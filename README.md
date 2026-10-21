<p align="center">
  <img src="img/banner.svg" alt="Tessis — Asistente Personal Autónomo con IA" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/estado-lanzamiento-E08A4B?style=flat-square" alt="Estado: lanzamiento">
  <img src="https://img.shields.io/badge/idioma-español-163554?style=flat-square" alt="Idioma: español">
  <img src="https://img.shields.io/badge/IA-Groq%20·%20Gemini%20·%20local-1D4E89?style=flat-square" alt="IA: Groq, Gemini o local">
  <img src="https://img.shields.io/badge/servidor-propio-163554?style=flat-square" alt="Servidor propio">
</p>

<p align="center">
  <a href="#-qué-es-tessis">Qué es</a> ·
  <a href="#-qué-puede-hacer">Qué puede hacer</a> ·
  <a href="manual/README.md">Manual de usuario</a> ·
  <a href="#-cómo-conseguirla">Cómo conseguirla</a> ·
  <a href="#-apoyar-el-proyecto">Apoyar el proyecto</a>
</p>

---

## 🐾 Qué es Tessis

**Tessis es una asistente personal autónoma con IA que te conoce, entiende tu contexto y actúa de forma
proactiva. Y vive en tu propio servidor: tus datos son tuyos.**

Te conoce, entiende tu día y se adelanta: te avisa cuándo salir, te recuerda lo importante y te da la bienvenida
cuando llegás. Habla en español, por texto o por voz, y trabaja para todo tu hogar.

Trabaja **las 24 horas, los 7 días de la semana**, en tu servidor: aunque tengas el celular y la PC apagados, sigue
vigilando tu agenda, tus recordatorios y tus lugares, y te avisa. Y es una **app web (PWA)** que se instala en el
celular y la PC como una app más, con su ícono y notificaciones, sin pasar por las tiendas.

<p align="center">
  <img src="img/chat-movil.png" alt="Tessis en el celular" width="31%">
  &nbsp;
  <img src="img/recordatorio.png" alt="Un recordatorio que avisa cuándo salir" width="31%">
  &nbsp;
  <img src="img/memoria.png" alt="Lo que Tessis sabe de vos" width="31%">
</p>

> [!NOTE]
> Tessis se instala con una **licencia mensual**; ver [Cómo conseguirla](#-cómo-conseguirla).

---

## ✨ Qué puede hacer

| | |
|---|---|
| ⏱️ **Siempre activa** | Trabaja las 24 horas en tu servidor: aunque apagues el celular y la PC, sigue atenta a tu agenda, tus recordatorios y tus lugares, y te avisa. |
| 📲 **App en tu celular** | Se instala desde el navegador (PWA) en el celular y la PC, con su ícono y notificaciones, sin pasar por las tiendas. |
| 💬 **Conversar y recordar** | Charla natural, por texto o por voz. Aprende de vos (personas, lugares, gustos, rutinas) y podés ver, corregir o borrar lo que sabe. |
| 📅 **Organizar tu día** | Recordatorios a una hora, repetidos o al llegar a un lugar. Google Calendar. Resumen de la mañana. Plazos y vencimientos. |
| 🚗 **Avisarte cuándo salir** | Sigue el tránsito real y te avisa a tiempo para llegar. Te da la bienvenida en el trabajo con tu agenda. |
| 📍 **Lugares** | Dónde estoy, cómo llego, qué hay cerca. Guarda tus lugares y aprende tus rutinas. |
| 🔎 **Información real** | Búsquedas con fuentes, clima, dólar, acciones y cripto, análisis de una acción e informes en PDF. No inventa: si no lo sabe, lo busca o te lo dice. |
| 📨 **Correo y archivos** | Lee tu Gmail (solo lectura) y tu Google Drive. Mira las fotos y capturas que le mostrás. |
| 🏠 **Para todo el hogar** | Una cuenta por persona. Mensajes y recordatorios entre ustedes: «decile a Ana que compre pan». |
| 💻 **Tu computadora** | Con el agente para Windows abre programas y mira tu pantalla cuando se lo pedís, y puede pensar con una **IA instalada en tu PC**. |
| 🔒 **Tus datos, en tu servidor** | Cada hogar tiene su propia instalación. Respaldo diario y, si querés, respaldo cifrado en tu Drive. |

Todo esto, con capturas y ejemplos, está en el **[manual de usuario](manual/README.md)**.

---

## 🎬 Así se ve

<table>
  <tr>
    <td width="50%"><img src="img/clima-ruta.png" alt="Clima y ruta con tránsito"><br><sub>«¿Cómo llego al trabajo?» — con el tránsito de ahora</sub></td>
    <td width="50%"><img src="img/finanzas.png" alt="Análisis de una acción"><br><sub>«Analizame YPF» — datos reales e indicadores</sub></td>
  </tr>
  <tr>
    <td><img src="img/hogar.png" alt="El hogar"><br><sub>Mensajes y recordatorios entre los miembros del hogar</sub></td>
    <td><img src="img/escritorio.png" alt="Tessis en la PC"><br><sub>En la computadora, con el panel de actividad</sub></td>
  </tr>
</table>

---

## 🚀 Cómo conseguirla

Tessis corre en un **servidor tuyo**: una máquina gratis de Oracle Cloud o una computadora en casa con Ubuntu.

1. **Conseguí tu licencia** en **[Conseguir Tessis](https://licencias.163-176-79-48.sslip.io/comprar)**: el primer
   mes cuesta **3 USD** y después **5 USD por mes**, en **USDT o USDC por la red BNB Smart Chain**. Al pagar, la
   clave (`TESS-XXXX-XXXX-XXXX-XXXX`) aparece sola en la página. Unos días antes de que venza, Tessis te avisa
   para renovarla.
2. **Creá tu servidor** siguiendo la [guía paso a paso](manual/01-instalacion.md). En Oracle se pega un script de
   inicio con tu clave y Tessis se instala sola. En un Ubuntu ya creado:
   ```bash
   curl -fsSL https://licencias.163-176-79-48.sslip.io/instalar.sh -o instalar.sh && bash instalar.sh
   ```
3. **Entrá a [Mi Tessis](https://licencias.163-176-79-48.sslip.io/)** con tu clave para ver la dirección de tu
   Tessis, y creá tu cuenta con esa misma clave.

Tessis se actualiza sola: una vez por día busca versiones nuevas y las instala.

> [!IMPORTANT]
> Para responder, Tessis usa **servicios de IA externos** (Groq, Google Gemini) con tus propias claves, que tienen
> opción gratis. Lo que escribís, adjuntás o mostrás de tu pantalla se procesa en esos servicios: **no compartas
> información sensible.**

---

## 💛 Apoyar el proyecto

Tessis es un proyecto independiente. Si te sirve y querés ayudar a que siga creciendo, podés aportar en cripto:

| Red | Dirección |
|---|---|
| **BNB Smart Chain (BEP20)** | `0xE7C0f00a914EcBc1C73E2175BA66af0e4003Fba3` |

> [!WARNING]
> Mandá **solo por la red BNB Smart Chain (BEP20)**: BNB o tokens BEP20 como USDT o USDC. Si lo enviás por otra red,
> el aporte se puede perder. Revisá la dirección antes de confirmar.

¡Gracias! 🙌

---

<p align="center">
  <sub>Este repositorio tiene la presentación, el manual y el instalador de Tessis. El código de Tessis es privado.<br>
  Contacto: <a href="mailto:mca.gariglio@gmail.com">mca.gariglio@gmail.com</a></sub>
</p>
