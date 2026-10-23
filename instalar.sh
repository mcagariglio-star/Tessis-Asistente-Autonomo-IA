#!/usr/bin/env bash
# ==============================================================================
# Instalador de Tessis para un hogar (servidor Ubuntu o Debian, en la nube o en casa).
#
#     curl -fsSL https://<servidor-de-licencias>/instalar.sh -o instalar.sh && bash instalar.sh
#
# Pide la clave de licencia (TESS-XXXX-XXXX-XXXX-XXXX), activa este servidor, baja la imagen de
# Tessis (sin código fuente), genera secretos propios y deja Tessis andando con HTTPS. También instala
# el actualizador diario (tessis-actualizar). Se puede volver a correr sin perder nada.
#
# También corre solo al crear la máquina (script de inicio de Oracle / cloud-init), sin terminal:
#     su - ubuntu -c "TESSIS_CLAVE=TESS-... bash /tmp/instalar.sh"
# En ese caso la cuenta del titular se crea con la misma clave de licencia como código de alta.
#
# Variables opcionales: TESSIS_CLAVE (no preguntar la clave), TESSIS_DOMINIO (dominio propio que ya
# apunte a este servidor), TESSIS_DIR (carpeta; por defecto ~/tessis), LICENCIAS (servidor de licencias).
# ==============================================================================
set -euo pipefail

LICENCIAS="${LICENCIAS:-https://licencias.tessis-ia.com}"
DIR="${TESSIS_DIR:-$HOME/tessis}"
CONF=/etc/tessis/licencia.env

# Llave PÚBLICA de publicación de Tessis: solo se instala lo que está firmado con su llave privada, que vive en la PC
# del administrador (no en el servidor de licencias). verificar ARCHIVO FIRMA_BASE64
LLAVE_PUBLICACION="-----BEGIN PUBLIC KEY-----
MCowBQYDK2VwAyEArqgqvfSaLUh7z8hsclk+cWuMWS63It7jhTA4GFjk/hc=
-----END PUBLIC KEY-----"
verificar() {
    local k s r
    k="$(mktemp)"; s="$(mktemp)"
    printf '%s\n' "$LLAVE_PUBLICACION" > "$k"
    if printf '%s' "$2" | base64 -d > "$s" 2>/dev/null && [ -s "$s" ]; then
        openssl pkeyutl -verify -pubin -inkey "$k" -rawin -in "$1" -sigfile "$s" >/dev/null 2>&1; r=$?
    else
        r=1
    fi
    rm -f "$k" "$s"
    return $r
}

paso() { printf '\n\033[1;36m==> %s\033[0m\n' "$*"; }
error() { printf '\n\033[1;31m%s\033[0m\n' "$*" >&2; exit 1; }

# ── 0. Sistema y clave ───────────────────────────────────────────────────────
[ "$(id -u)" -ne 0 ] || error "Corré el instalador con tu usuario (no como root); va a pedir sudo cuando haga falta."
command -v apt-get >/dev/null || error "Este instalador es para Ubuntu o Debian."
case "$(uname -m)" in
    x86_64) ARQ=amd64 ;;
    # Por ahora solo hay versión para AMD/Intel: se avisa antes de activar la licencia (así no se gasta el servidor)
    aarch64 | arm64) error "Por ahora Tessis funciona solo en máquinas AMD o Intel. Si creaste una Ampere (ARM), creá
otra máquina con la unidad VM.Standard.E2.1.Micro (AMD), que también es gratis, y usá la misma clave." ;;
    *) error "Procesador no soportado: $(uname -m)." ;;
esac
# sudo -n primero: `sudo -v` pide contraseña si el usuario además está en el grupo sudo, aunque tenga NOPASSWD
# (pasa en Oracle y en WSL); sin terminal (script de inicio) se quedaría esperando
sudo -n true 2>/dev/null || sudo -v || error "Hace falta sudo."
# Recién creada, la máquina suele estar actualizándose sola: apt espera a que termine (hasta 15 min)
apt() { sudo DEBIAN_FRONTEND=noninteractive apt-get -o DPkg::Lock::Timeout=900 "$@"; }
apt update -qq
apt install -y -qq curl python3 openssl >/dev/null

if [ -f "$CONF" ]; then
    # Reinstalación: misma clave y misma instalación
    # shellcheck disable=SC1090
    . <(sudo cat "$CONF")
    # La dirección vieja del servidor de licencias pasó al dominio propio
    if [ "$LICENCIAS" = "https://licencias.163-176-79-48.sslip.io" ]; then LICENCIAS="https://licencias.tessis-ia.com"; fi
fi
CLAVE="${TESSIS_CLAVE:-${CLAVE:-}}"
if [ -z "$CLAVE" ]; then
    printf 'Clave de licencia (TESS-XXXX-XXXX-XXXX-XXXX): '
    read -r CLAVE </dev/tty
fi
CLAVE="$(echo "$CLAVE" | tr '[:lower:]' '[:upper:]' | tr -d ' ')"
INSTALACION="${INSTALACION:-$(openssl rand -hex 16)}"
DEPLOY="$DIR/deploy"
ENV="$DEPLOY/.env"

IP="$(curl -fsS https://api.ipify.org || curl -fsS https://ifconfig.me)"
DOMINIO="${TESSIS_DOMINIO:-$(grep -s '^APP_DOMAIN=' "$ENV" | cut -d= -f2- || true)}"
DOMINIO="${DOMINIO:-${IP//./-}.sslip.io}"

json() { python3 -c 'import json,sys; d=json.load(sys.stdin); print(d.get(sys.argv[1]) if d.get(sys.argv[1]) is not None else "")' "$1"; }

paso "Activando este servidor"
RESP="$(curl -sS -X POST "$LICENCIAS/api/activar" -H "Content-Type: application/json" \
    -d "{\"clave\": \"$CLAVE\", \"instalacion\": \"$INSTALACION\", \"arquitectura\": \"$ARQ\", \"dominio\": \"$DOMINIO\"}")" \
    || error "No me pude comunicar con el servidor de licencias. Revisá la conexión a internet."
if [ "$(echo "$RESP" | json valida)" != "True" ]; then
    error "No se pudo activar: $(echo "$RESP" | json detail)"
fi
VERSION="$(echo "$RESP" | json ultima_version)"
# Si el titular eligió su dirección al comprar (nombre.tessis-ia.com), se instala directo con ella
ASIGNADO="$(echo "$RESP" | json dominio_asignado)"
if [ -n "$ASIGNADO" ] && [ "$ASIGNADO" != "None" ]; then
    DOMINIO="$ASIGNADO"
fi
[ -n "$VERSION" ] || error "Todavía no hay una versión de Tessis publicada. Probá más tarde."
echo "Licencia de $(echo "$RESP" | json titular). Versión $VERSION."

sudo mkdir -p /etc/tessis
printf 'CLAVE=%s\nINSTALACION=%s\nLICENCIAS=%s\nDIR=%s\n' "$CLAVE" "$INSTALACION" "$LICENCIAS" "$DIR" \
    | sudo tee "$CONF" >/dev/null
sudo chmod 600 "$CONF"

# ── 1. Sistema ────────────────────────────────────────────────────────────────
if ! swapon --show | grep -q . && [ "$(awk '/MemTotal/ {print $2}' /proc/meminfo)" -lt 4000000 ]; then
    paso "Creando 2 GB de swap (este servidor tiene poca memoria)"
    sudo fallocate -l 2G /swapfile && sudo chmod 600 /swapfile
    sudo mkswap /swapfile >/dev/null && sudo swapon /swapfile
    grep -q '^/swapfile' /etc/fstab || echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab >/dev/null
fi
if ! command -v docker >/dev/null || ! sudo docker compose version >/dev/null 2>&1; then
    paso "Instalando Docker"
    apt install -y -qq docker.io >/dev/null
    apt install -y -qq docker-compose-v2 >/dev/null 2>&1 || apt install -y -qq docker-compose-plugin >/dev/null
    sudo systemctl enable --now docker >/dev/null
fi
if sudo iptables -L INPUT -n 2>/dev/null | grep -q "REJECT"; then
    paso "Abriendo los puertos 80 y 443 en el firewall"     # imágenes de Oracle: rechazan todo salvo SSH
    apt install -y -qq iptables-persistent >/dev/null 2>&1 || true
    for p in 80 443; do
        sudo iptables -C INPUT -p tcp --dport "$p" -m state --state NEW -j ACCEPT 2>/dev/null \
            || sudo iptables -I INPUT 5 -p tcp --dport "$p" -m state --state NEW -j ACCEPT
    done
    sudo netfilter-persistent save >/dev/null 2>&1 || true
fi

# ── 2. Imagen ─────────────────────────────────────────────────────────────────
paso "Bajando Tessis $VERSION (unos 400 MB)"
# El actualizador baja y verifica las imágenes (huella y firma de publicación); él mismo también va firmado
TMP_ACT="$(mktemp -d)"
curl -fsS "$LICENCIAS/tessis-actualizar" -o "$TMP_ACT/tessis-actualizar" \
    && curl -fsS "$LICENCIAS/tessis-actualizar.firma" -o "$TMP_ACT/firma" \
    || error "No pude bajar el actualizador de Tessis. Revisá la conexión a internet."
verificar "$TMP_ACT/tessis-actualizar" "$(cat "$TMP_ACT/firma")" \
    || error "El actualizador no tiene una firma válida de Tessis: no se instala nada."
sudo install -m 755 "$TMP_ACT/tessis-actualizar" /usr/local/bin/tessis-actualizar
rm -rf "$TMP_ACT"
sudo tessis-actualizar --imagen "$VERSION" "$ARQ" || error "No se pudo bajar o verificar Tessis $VERSION."

paso "Preparando la carpeta $DIR"
mkdir -p "$DEPLOY/caddy-extra" "$DEPLOY/backups"
CONT="$(sudo docker create "tessis-core:$VERSION")"
for f in docker-compose.yml Caddyfile .env.example caddy-extra/LEEME.txt; do
    sudo docker cp "$CONT:/deploy/$f" - | tar -x -O > "$DEPLOY/$f"
done
sudo docker rm "$CONT" >/dev/null
# Primer estado de la licencia, firmado (después lo renueva tessis-actualizar cada hora)
mkdir -p "$DEPLOY/licencia"
python3 - "$DEPLOY/licencia/estado.json" "$RESP" <<'PY'
import json, sys, time
d = json.loads(sys.argv[2])
json.dump({"valida": bool(d.get("valida")), "vence": d.get("vence"), "ultima_version": d.get("ultima_version"),
           "controlado": int(time.time()), "firmado": d.get("firmado")}, open(sys.argv[1], "w"))
PY
chmod 644 "$DEPLOY/licencia/estado.json"

# ── 3. Dominio y secretos ────────────────────────────────────────────────────
paso "Dominio: $DOMINIO"

secreto() { python3 -c "import secrets; print(secrets.token_urlsafe(${1:-48}))"; }
fijar() { if grep -q "^$1=" "$ENV"; then sed -i "s|^$1=.*|$1=$2|" "$ENV"; else echo "$1=$2" >> "$ENV"; fi; }
if [ ! -f "$ENV" ]; then
    cp "$DEPLOY/.env.example" "$ENV"
    chmod 600 "$ENV"
    fijar ENCRYPTION_KEY "$(secreto)"
    fijar ENCRYPTION_SALT "$(secreto 24)"
    fijar JWT_SECRET "$(secreto)"
    fijar DB_PASSWORD "$(secreto 32)"
    fijar ALLOW_OPEN_BOOTSTRAP true
    fijar BOOTSTRAP_TOKEN "$CLAVE"     # el titular crea su cuenta con su clave de licencia
fi
fijar APP_DOMAIN "$DOMINIO"
fijar TESSIS_VERSION "$VERSION"
fijar BACKUP_OWNER "$(id -u):10001"
fijar GOOGLE_REDIRECT_URI "https://$DOMINIO/auth/google/callback"

cd "$DEPLOY"
dc() { sudo docker compose "$@"; }
if [ -z "$(grep '^VAPID_PRIVATE_KEY=' "$ENV" | cut -d= -f2-)" ]; then
    CLAVES="$(dc run --rm --no-deps --no-build -T tessis-core python -c '
import base64
from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.primitives.asymmetric import ec
k = ec.generate_private_key(ec.SECP256R1())
b = lambda x: base64.urlsafe_b64encode(x).decode().rstrip("=")
print(b(k.private_numbers().private_value.to_bytes(32, "big")))
print(b(k.public_key().public_bytes(serialization.Encoding.X962, serialization.PublicFormat.UncompressedPoint)))
')"
    fijar VAPID_PRIVATE_KEY "$(echo "$CLAVES" | sed -n 1p)"
    fijar VAPID_PUBLIC_KEY "$(echo "$CLAVES" | sed -n 2p)"
fi

# ── 4. Actualizador diario ───────────────────────────────────────────────────
paso "Programando el actualizador (cada hora)"
sudo tee /etc/systemd/system/tessis-actualizar.service >/dev/null <<'SERVICIO'
[Unit]
Description=Tessis: control de licencia y actualización
After=network-online.target docker.service
Wants=network-online.target
[Service]
Type=oneshot
ExecStart=/usr/local/bin/tessis-actualizar
SERVICIO
sudo tee /etc/systemd/system/tessis-actualizar.timer >/dev/null <<'TIMER'
[Unit]
Description=Tessis: control de licencia y actualización, cada hora
[Timer]
OnCalendar=hourly
RandomizedDelaySec=10min
Persistent=true
[Install]
WantedBy=timers.target
TIMER
sudo systemctl daemon-reload
sudo systemctl enable --now tessis-actualizar.timer >/dev/null

# ── 5. Arranque ───────────────────────────────────────────────────────────────
paso "Levantando Tessis"
dc up -d --no-build

paso "Esperando el certificado HTTPS"
INSEGURO=()   # localhost: Caddy usa su certificado propio (no hay uno público para una PC sin dominio)
case "$DOMINIO" in localhost | *.localhost) INSEGURO=(-k) ;; esac
for _ in $(seq 1 60); do
    if curl -fsS "${INSEGURO[@]}" -o /dev/null "https://$DOMINIO/"; then
        printf '\n\033[1;32mListo: https://%s\033[0m\n' "$DOMINIO"
        # «Tu Tessis está lista» por mail, ahora que responde de verdad
        curl -fsS -m 20 -X POST "$LICENCIAS/api/instalada" -H "Content-Type: application/json" \
            -d "{\"clave\": \"$CLAVE\", \"instalacion\": \"$INSTALACION\", \"arquitectura\": \"$ARQ\", \"dominio\": \"$DOMINIO\"}" \
            -o /dev/null 2>&1 && touch "$DEPLOY/licencia/avisada" || true
        ALTA="$(grep '^BOOTSTRAP_TOKEN=' "$ENV" | cut -d= -f2-)"
        echo "Para crear la cuenta del titular, abrí esa dirección y usá tu clave de licencia, o este enlace:"
        echo "    https://$DOMINIO/?alta=$ALTA"
        exit 0
    fi
    sleep 5
done
echo "Tessis está levantado pero el HTTPS todavía no responde. Revisá que los puertos 80 y 443 estén"
echo "abiertos (en Oracle: la Security List de la red) y mirá: cd $DEPLOY && sudo docker compose logs caddy"
exit 2
