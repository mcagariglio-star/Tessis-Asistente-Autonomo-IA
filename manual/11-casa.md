# 11 · Tu casa: la tele, las luces y los enchufes

Tessis puede manejar los aparatos de tu casa **a través de Home Assistant**, el programa gratuito que conecta los
aparatos inteligentes de casi todas las marcas (Samsung SmartThings, Smart Life / Tuya, LG ThinQ, Philips Hue,
Xiaomi y muchas más). Funciona **aunque tengas la PC apagada**: Tessis le habla a tu Home Assistant desde el
servidor.

```
Vos:    Prendé la tele y bajale el volumen
Tessis: Listo, prendí la tele de la sala y le bajé el volumen.

Vos:    Apagá la luz del dormitorio
Tessis: Apagada.
```

## Qué necesitás

- **Un Home Assistant que se vea desde internet.** La forma más fácil es
  [Home Assistant Cloud (Nabu Casa)](https://www.nabucasa.com/), que te da una dirección del tipo
  `https://xxxx.ui.nabu.casa`. También sirve una dirección propia con HTTPS. Una dirección de tu red de casa
  (`192.168…`, `homeassistant.local`) **no** sirve, porque tu Tessis vive en un servidor, no en tu casa.
- **Tus aparatos agregados en Home Assistant.** Si ya los usás con la app de la marca (por ejemplo SmartThings), en
  Home Assistant se suman con la integración de esa marca.

> [!NOTE]
> Por ahora, en **Tessis Online** también hace falta tu propio Home Assistant. Estamos preparando la opción de que
> Tessis te arme uno.

## Conectar tu casa

1. En Tessis, entrá a **Integraciones → Tu casa (Home Assistant)**.
2. Escribí la dirección de tu Home Assistant y tocá **Conectar**.
3. Se abre tu Home Assistant: **entrás con tu usuario** (o lo creás, si es nuevo) y aceptás. Volvés solo a Tessis,
   con la casa conectada.

Tu contraseña **no pasa por Tessis**: es el mismo ingreso que usa la app oficial de Home Assistant. Tessis recibe un
permiso que podés revocar cuando quieras desde tu perfil en Home Assistant, o con **Desconectar** en Tessis.

Con la casa conectada aparecen botones para **sumar aparatos de una marca** (SmartThings, Smart Life, LG, Hue,
Xiaomi u otra): abren tu Home Assistant directo en ese paso.

## Qué le podés pedir

| Aparato | Ejemplos |
|---|---|
| 📺 **Tele y equipos de música** | «prendé la tele», «subí el volumen», «silenciá la tele», «pausá» |
| 💡 **Luces** | «apagá la luz del living», «prendé las luces» |
| 🔌 **Enchufes e interruptores** | «prendé el enchufe de la estufa» |
| 🌀 **Ventiladores** | «apagá el ventilador» |
| ❄️ **Aire y calefacción** | «prendé el aire» |

Tessis reconoce los aparatos por el nombre que tienen en Home Assistant («tele de la sala», «luz del dormitorio»):
conviene ponerles nombres claros.

> [!IMPORTANT]
> **Cerraduras, alarmas y portones quedan afuera**, aunque estén en tu Home Assistant. Tessis lee mails y páginas, y
> no queremos que un texto armado por otra persona pueda pedirle que abra tu casa.

## Abrir apps, cambiar de canal y el control remoto

En las teles **Samsung**, Tessis además puede **abrir Netflix, YouTube, Disney+, Prime Video, Spotify y Apple TV**,
**cambiar de canal** y mostrarte un **control remoto** en la app (flechas, OK, volver e inicio), para elegir el perfil
o la serie.

Eso usa una extensión de Tessis para Home Assistant que **todavía no está publicada**: la estamos preparando para que
la puedas sumar desde HACS. Mientras tanto, prender, apagar, el volumen y la pausa funcionan con cualquier tele que
esté en tu Home Assistant.
