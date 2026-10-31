# 2 · Primeros pasos

## Crear tu cuenta

La primera vez que abrís tu Tessis, tocá **«¿Primera vez en este servidor? Crear la cuenta del titular»** y
completá:

- **Clave de licencia:** la que te llegó por mail (`TESS-XXXX-XXXX-XXXX-XXXX`): con la que instalaste, o la de tu
  Tessis Online.
- **Usuario** y **contraseña**: los vas a usar para entrar desde el celular y la PC.
- **Cómo querés que te llame Tessis.**

<img src="../img/alta-titular.png" alt="Crear la cuenta del titular" width="360">

Antes de empezar, Tessis te muestra cómo se usan tus datos. Leé ese aviso: lo que escribís y mostrás se procesa con
servicios de IA externos.

<img src="../img/aviso-uso.png" alt="El aviso de uso" width="360">

---

## Instalar la app en el celular

Tessis es una **app web (PWA)**: se instala desde el navegador, en el celular y en la PC, sin pasar por las tiendas.

- **Android (Chrome):** abrí tu Tessis → menú ⋮ → **Instalar app** (o «Agregar a la pantalla principal»).
- **iPhone (Safari):** abrí tu Tessis → botón **Compartir** → **Agregar a inicio**.

Queda con su ícono y se abre a pantalla completa. Además, te puede mandar **notificaciones** (aceptá el permiso
cuando lo pida). Tessis trabaja en el servidor las 24 horas: aunque cierres la app o apagues el celular, sigue atenta
a tu agenda, tus recordatorios y tus lugares. Cuando hace falta, te avisa con una notificación.

---

## Cargar tus claves de IA

Tessis piensa con servicios de IA que **vos elegís y pagás (o no)**. Groq y Gemini tienen una opción gratis que alcanza
para el uso de un hogar:

| Servicio | Dónde se saca la clave | Costo |
|---|---|---|
| **Groq** | [console.groq.com/keys](https://console.groq.com/keys) | Gratis con límite por minuto; pago por uso, muy barato |
| **Google Gemini** | [aistudio.google.com/apikey](https://aistudio.google.com/apikey) | Cuota gratis diaria; pago por uso |

En Tessis: **Configuración → IA**, pegá las claves y guardá. Con las dos, si una falla o llega a su límite, Tessis
sigue con la otra sin que lo notes.

> [!NOTE]
> Las claves nuevas de Gemini empiezan con `AQ.` (las anteriores, con `AIza`): las dos sirven. En la **prueba de
> Tessis Online**, mientras no cargues ninguna clave, Tessis contesta con una IA de cortesía con límite diario
> ([más info](00-tessis-online.md#probarla-gratis-7-días)).

Una tercera opción gratis es **OpenRouter** ([openrouter.ai/keys](https://openrouter.ai/keys)): con una sola clave da
acceso a muchas IA, y algunas son gratis, con un límite diario. Tessis la usa de respaldo después de Groq y Gemini y,
de fábrica, elige un modelo gratis. Ojo: en los modelos gratis, el servicio que los corre puede usar lo que le mandás
para entrenar.

### ¿Preferís ChatGPT, Claude o DeepSeek?

Tessis no está atada a ninguna IA. Si ya pagás una o querés probar otra, cargá su clave y elegila como
**IA principal** (Configuración → IA → IA principal), con el modelo que quieras. Tu memoria, tu agenda y tu familia
quedan en tu servidor: cambiar de IA no borra nada.

| Servicio | Dónde se saca la clave | Costo |
|---|---|---|
| **ChatGPT** (OpenAI) | [platform.openai.com/api-keys](https://platform.openai.com/api-keys) | Pago por uso, con crédito cargado |
| **Claude** (Anthropic) | [platform.claude.com](https://platform.claude.com/) | Pago por uso, con crédito cargado |
| **DeepSeek** | [platform.deepseek.com/api_keys](https://platform.deepseek.com/api_keys) | Pago por uso, muy barato |

> [!NOTE]
> La clave de la API es aparte de la suscripción de la app (ChatGPT Plus, Claude Pro): se paga por lo que se usa.
> Si la principal falla o se queda sin crédito, Tessis sigue con Groq y Gemini.

Hay dos claves más para que las búsquedas y las rutas den datos reales:

| Servicio | Para qué | Dónde se saca la clave | Costo |
|---|---|---|---|
| **Tavily** o **Brave Search** (una de las dos) | Búsquedas en internet con fuentes | [app.tavily.com](https://app.tavily.com/) · [api-dashboard.search.brave.com](https://api-dashboard.search.brave.com/) | **Tavily:** gratis y sin tarjeta, 1.000 búsquedas por mes (la más fácil). **Brave:** prepago con 5 USD de crédito gratis por mes (unas 1.000 búsquedas); para activar el plan puede pedir una tarjeta |
| **Google Maps** (opcional) | Rutas con tiempo y tránsito, avisos de cuándo salir, lugares cercanos | [Google Cloud → Credenciales](https://console.cloud.google.com/apis/credentials) (activar Directions, Places y Geocoding) | Crédito gratis mensual; pide cargar una tarjeta |

También es opcional **SerpApi** ([serpapi.com](https://serpapi.com/), 250 búsquedas gratis por mes), para buscar
**vuelos** con precios reales.

Cómo sacar cada clave, en video de menos de un minuto: [Groq, Gemini, Tavily y Brave](https://www.youtube.com/playlist?list=PLD39aGFL-t_M).

Si cargás las dos de búsqueda, Tessis usa Tavily y, si falla, Brave. Sin ninguna, no puede buscar en internet. Sin Google Maps, las rutas salen como un enlace a Maps, sin tiempos.

<img src="../img/ajustes-ia.png" alt="Configuración de IA" width="640">

> [!TIP]
> ¿No querés usar servicios externos para charlar? Con el [agente para Windows](09-pc.md) Tessis puede pensar con
> una **IA instalada en tu PC**.

---

## Conectar Google

En **Integraciones → Vincular con Google** autorizás Calendar, Drive y Gmail (solo lectura). Cada persona del hogar
vincula su propia cuenta.

<img src="../img/integraciones.png" alt="Integraciones" width="640">

> [!NOTE]
> Mientras Google termina de verificar la aplicación de Tessis (el trámite está en curso), al vincular aparece la
> pantalla **«Google no verificó esta app»**. Es normal: tocá **Configuración avanzada → Ir a Tessis** y aceptá los
> permisos.

Todo lo demás (notificaciones, horarios de silencio, voz, tema, PIN, respaldo) está en
**[Configuración](02b-configuracion.md)**. Después seguí con [Charlar y hablar](03-charlar.md).
