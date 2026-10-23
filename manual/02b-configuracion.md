# 2b · Configuración de tu Tessis

Todo se ajusta desde **Ajustes** (en el celular, abajo a la derecha) o **Configuración** (en la PC, en el menú de la
izquierda). Está ordenado en pestañas:

| Pestaña | Qué se configura |
|---|---|
| [Avisos](#-avisos) | Cuánto se adelanta Tessis, horarios de silencio, resumen de la mañana, notificaciones |
| [Familia](#-familia) | Invitar a los de tu casa, contraseñas, bajas |
| [Privacidad](#-privacidad) | Tu contraseña y el PIN de «Lo que sé de vos» |
| [Voz y apariencia](#-voz-y-apariencia) | Tema claro u oscuro, color, voz y velocidad |
| [IA y claves](#-ia-y-claves) | Las claves de Groq, Gemini, búsqueda y Maps; la IA de tu PC |
| [Sistema](#-sistema) | Respaldo en tu Google Drive, ubicación, estado del servidor |

Aparte, en **Integraciones**, están Google (Calendar, Drive, Gmail), tu PC y la ubicación con OwnTracks.

---

## 🔔 Avisos

<img src="../img/ajustes-avisos.png" alt="Avisos" width="360">

- **Iniciativa:** cuánto se adelanta Tessis por su cuenta.
  - **Asistente proactivo** (recomendado): te avisa cuándo salir, te recuerda plazos y te sugiere cosas.
  - **Autónomo controlado:** además ejecuta las reglas automáticas que le diste.
  - **Observador:** aprende de tu rutina, pero no te avisa nada por su cuenta.
- **Modo discreto:** la notificación dice solo «Tessis tiene un aviso para vos», sin el contenido. Lo sensible
  siempre llega así.
- **Silencio:** horarios sin notificaciones, uno para días hábiles y otro para el fin de semana. Tus recordatorios y
  el resumen de la mañana llegan igual, porque los pediste vos. Al terminar el silencio, recibís un resumen de lo
  demás.
- **Resumen de la mañana:** elegí la hora. Cada día te llega con el clima, tu agenda, los recordatorios y los
  cumpleaños que Tessis conoce. Para probarlo, tocá **Mandámelo ahora**.
- **Notificaciones:** se activan **en cada dispositivo** (celular y PC por separado). Tocá **Activar**, aceptá el
  permiso y fijate que funcione con **Probar**.

> [!TIP]
> En el iPhone, las notificaciones funcionan solo si Tessis está instalada en la pantalla de inicio
> ([ver cómo](02-primeros-pasos.md#instalar-la-app-en-el-celular)).

---

## 🏠 Familia

<img src="../img/hogar.png" alt="Familia" width="360">

- **Invitar:** poné el nombre y el vínculo («Laura», «pareja») y tocá **Crear invitación**. Compartile el enlace:
  vale por 48 horas y se usa una sola vez. Al abrirlo, la persona elige su usuario y su propia contraseña.
- Para cada miembro, el titular puede:
  - **Contraseña:** generarle un enlace para que elija una nueva si se la olvidó.
  - **Dar de baja:** deja de poder entrar (sus datos quedan guardados).
  - **Borrar:** elimina a esa persona **y todos sus datos**. No se puede deshacer.
- **Bloquear** (cada uno, para sí): esa persona no te puede mandar mensajes ni recordatorios por Tessis.

Más sobre el hogar en [El hogar](08-hogar.md).

---

## 🔒 Privacidad

<img src="../img/ajustes-privacidad.png" alt="Privacidad" width="360">

- **Tu contraseña:** cambiala cuando quieras. Al cambiarla se cierran las sesiones abiertas en tus otros
  dispositivos.
- **PIN de privacidad:** un número de 4 a 6 cifras, aparte de tu contraseña, para entrar a **«Lo que sé de vos»**.
  Aunque alguien tenga tu sesión abierta en tu celular, no puede ver ni borrar lo que Tessis sabe de vos.

---

## 🎨 Voz y apariencia

<img src="../img/ajustes-voz.png" alt="Voz y apariencia" width="360">

- **Tema:** claro, oscuro o el del sistema (este último cambia solo, igual que tu celular).
- **Color de acento:** naranja, azul, verde o gris. También cambia el color del orbe.
- **Voz de Tessis** y **velocidad:** elegilas y probalas con **Escuchar**; después tocá **Guardar voz**.
  - Las voces **Gemini** son las más naturales: usan tu clave de Gemini (cuestan centavos por hora de voz).
  - Las demás son gratis.

---

## 🧠 IA y claves

<img src="../img/ajustes-ia.png" alt="Claves de servicios" width="640">

- **Claves de servicios** (desplegá el recuadro): pegá cada clave y guardá. Quedan **cifradas** en tu servidor y
  nunca se vuelven a mostrar: solo ves «● Cargada». Con **Quitar** la borrás.

  | Clave | Para qué | ¿Hace falta? |
  |---|---|---|
  | **Groq** | Pensar y conversar (rápido) | Sí, Groq o Gemini (mejor las dos) |
  | **Gemini** | Pensar, mirar imágenes, voz natural | Sí, Groq o Gemini (mejor las dos) |
  | **Tavily** o **Brave** | Buscar en internet | Recomendada |
  | **Google Maps** | Rutas con tránsito, avisos de salida, lugares cercanos | Opcional |
  | **SerpApi** | Buscar vuelos con precios | Opcional |

  Dónde sacar cada una, en [Primeros pasos](02-primeros-pasos.md#cargar-tus-claves-de-ia).
- **Modelos de IA:** qué modelo usa Tessis para cada tarea y en qué orden (Groq primero y Gemini si falla, o al
  revés). Lo que viene elegido es lo recomendado.
- **IA local (tu PC):** si instalaste la IA en tu computadora, elegí si Tessis piensa **primero con tu PC** cuando
  está prendida (ver [Tu PC e IA local](09-pc.md)).

Las claves del titular las usa todo el hogar: los demás no necesitan cargar nada.

---

## 🔧 Sistema

<img src="../img/respaldo.png" alt="Sistema" width="640">

- **Respaldo en Google Drive:** una copia diaria de todo Tessis, **cifrada**, en tu Drive. Va a la carpeta
  «Tessis - respaldos», que conserva los últimos 7 días. Al activarlo, Tessis te muestra un **código de
  recuperación**: anotalo y guardalo bien, porque es la única forma de abrir los respaldos. Si perdés tu servidor,
  con ese código recuperás todo.
- **Ubicación:** cada cuánto este dispositivo manda su ubicación (cada 3 minutos es lo recomendado) y cuánto tiempo
  se guarda tu recorrido (7 días). No se borran tus lugares guardados, las llegadas y salidas ni tus rutinas.
- **Estado del sistema:** si la base de datos funciona y cuántos recordatorios hay activos.

---

## 🔗 Integraciones

<img src="../img/integraciones.png" alt="Integraciones" width="360">

- **Google:** vinculá Calendar, Drive y Gmail (solo lectura) con tu cuenta. Cada persona del hogar vincula la suya.
  Mientras Google verifica la aplicación de Tessis (en trámite), aparece «Google no verificó esta app»: tocá
  **Configuración avanzada → Ir a Tessis**.
- **Dispositivos vinculados:** conectá tu PC con el [agente para Windows](09-pc.md).
- **OwnTracks:** para que Tessis sepa cuándo llegás o te vas de tus lugares aunque no tengas la app abierta. Seguí
  los 3 pasos de la pantalla **desde el celular**.
