# 1b · Instalación en Google Cloud (plan B)

Si Oracle no tiene máquinas gratis disponibles («Capacidad insuficiente»), **Google Cloud** ofrece otra opción
siempre gratis que alcanza para Tessis: la **e2-micro** (2 CPU compartidas, 1 GB de memoria, 30 GB de disco).

| | Oracle Cloud | Google Cloud |
|---|---|---|
| Máquina gratis | Micro (1 GB) o Ampere (hasta 24 GB) | e2-micro (1 GB) |
| Dónde | San Pablo / Santiago | Estados Unidos (Iowa, Carolina del Sur u Oregón) |
| Tráfico gratis | 10 TB por mes | **1 GB por mes** de salida; lo que se pase cuesta centavos (≈0,12 USD por GB) |
| Disponibilidad | A veces sin lugar | Casi siempre hay |

Para un hogar con uso normal de texto alcanza bien. La **voz** y las **imágenes** consumen más tráfico: si usás
mucho la voz, algún mes puede haber un costo chico.

**Qué necesitás**
- Tu **clave de licencia** (`TESS-XXXX-XXXX-XXXX-XXXX`).
- Una cuenta de **Google Cloud** con facturación activa (pide una tarjeta para verificar; no cobra mientras uses lo gratis).
- 10 minutos.

---

## Paso 1 · Crear la cuenta y el proyecto

1. Entrá a [console.cloud.google.com](https://console.cloud.google.com/) con tu cuenta de Google. Activá la prueba
   gratuita; la tarjeta se usa para verificar.
2. Arriba a la izquierda, en el selector de proyectos, tocá **Proyecto nuevo**, ponele un nombre (por ejemplo
   `tessis`) y crealo. Anotá su **ID** (aparece debajo del nombre, por ejemplo `tessis-123456`).
3. Andá al menú **☰ → Compute Engine → Instancias de VM**. La primera vez, Google pide **Habilitar** la API de
   Compute Engine: tocá **Habilitar** y esperá un minuto.

## Paso 2 · Crear la máquina con dos comandos

1. Arriba a la derecha de la consola tocá el ícono **`>_`** (**Activar Cloud Shell**). Se abre una terminal abajo.
   Si pide **Autorizar**, aceptá.
2. El primer comando abre los puertos de la web. Pegalo (cambiando `TU-PROYECTO` por el ID de tu proyecto) y
   apretá Enter:

   ```bash
   gcloud config set project TU-PROYECTO && gcloud compute firewall-rules create tessis-web --network=default --allow=tcp:80,tcp:443 --target-tags=tessis-web
   ```

3. El segundo crea la máquina gratis con Tessis. Pegalo **cambiando la clave por la tuya** y apretá Enter:

   ```bash
   gcloud compute instances create tessis --zone=us-central1-a --machine-type=e2-micro --image-family=ubuntu-2404-lts-amd64 --image-project=ubuntu-os-cloud --boot-disk-size=30GB --boot-disk-type=pd-standard --tags=tessis-web --metadata=startup-script-url=https://licencias.163-176-79-48.sslip.io/inicio.sh,tessis-clave=TESS-XXXX-XXXX-XXXX-XXXX
   ```

   Al terminar muestra una tabla con `STATUS: RUNNING` y la **EXTERNAL_IP**. Si aparecen dos avisos sobre el tamaño
   del disco, es normal.

> [!IMPORTANT]
> Para que sea **gratis**, la máquina tiene que quedar así: zona en **us-central1**, **us-east1** o **us-west1**, máquina
> **e2-micro** y disco **pd-standard** de hasta **30 GB**. Los comandos de arriba ya lo hacen.

## Paso 3 · Entrar a tu Tessis

La instalación tarda unos **10 minutos** desde que la máquina arranca.

**La dirección de tu Tessis** es la **EXTERNAL_IP** que mostró el segundo comando, con **guiones** en lugar de
puntos y terminada en **`.sslip.io`**. Por ejemplo, si la IP es `136.113.222.125`, tu Tessis es
**`https://136-113-222-125.sslip.io`**. Guardala en favoritos. También te la muestran la página donde compraste la
licencia y Mi Tessis; cuando está lista, ahí tenés un botón para abrirla.

1. Entrá a **[Mi Tessis](https://licencias.163-176-79-48.sslip.io/)** y poné tu clave: vas a ver la dirección de tu
   Tessis (algo como `https://136-113-222-125.sslip.io`) y si ya está lista.
2. Abrila, tocá **Crear la cuenta del titular** y usá **tu clave de licencia** como código de alta.

Listo: seguí con los [primeros pasos](02-primeros-pasos.md).

---

## Si algo no sale

| Qué pasa | Qué hacer |
|---|---|
| Al crear la máquina desde el formulario dice **«Se produjo un error desconocido»** | Usá los dos comandos de Cloud Shell de arriba: hacen lo mismo y, si algo falla, dicen el motivo exacto. |
| `The resource 'projects/.../firewalls/tessis-web' already exists` | Ya estaba creada: seguí con el segundo comando. |
| `Billing account ... is not found` o similar | El proyecto no tiene facturación: en **☰ → Facturación**, vinculá tu cuenta de facturación al proyecto. |
| En Mi Tessis dice **«Todavía no responde»** después de media hora | Revisá que el primer comando (los puertos) haya terminado sin error. |

### ¿Cuánto me puede costar?

Con la e2-micro en una región gratis y el disco estándar de 30 GB, la máquina y el disco son gratis. Lo único que
se puede pasar es el tráfico de salida (1 GB por mes). Para no tener sorpresas, creá una **alerta de presupuesto**:
**☰ → Facturación → Presupuestos y alertas → Crear presupuesto**, monto **1 USD**, alerta al 100 % a tu mail.
