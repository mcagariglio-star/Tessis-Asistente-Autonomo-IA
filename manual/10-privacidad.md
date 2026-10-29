# 10 · Privacidad y ajustes

## Dónde están tus datos

- **En tu instalación.** Las charlas, la memoria, los recordatorios, los lugares y la configuración se guardan en la
  base de datos de tu propia instalación. Cada persona del hogar ve solo lo suyo. En **Tessis Server** esa base
  está en tu servidor; en **Tessis Online**, en nuestros servidores, separada de la de los demás clientes (más en la
  [guía de Tessis Online](00-tessis-online.md#tus-datos-en-tessis-online)).
- **Las claves** de Groq, Gemini y Google se guardan **cifradas**.
- **Los servicios de IA externos** (Groq, Gemini) reciben lo que escribís, adjuntás o mostrás de tu pantalla para
  poder responder, y lo procesan según sus propias condiciones. **No compartas información sensible.**

Los términos y condiciones completos están en tu Tessis (`https://<tu-tessis>/terminos`) y en el enlace del aviso
de uso.

---

## Lo que Tessis sabe de vos

En **Lo que sé de vos** ves todo lo que Tessis aprendió: personas, lugares, gustos, rutinas y datos. Podés
corregir o borrar cualquier cosa. Si borrás algo, Tessis no lo vuelve a aprender de la misma charla.

<img src="../img/memoria.png" alt="Lo que sé de vos" width="640">

> [!TIP]
> En **Configuración → Privacidad** podés poner un **PIN** aparte de tu contraseña: aunque alguien tenga tu sesión
> abierta, no puede ver ni borrar lo que Tessis sabe de vos.

Lo que Tessis marca como sensible (salud, dinero, documentos) **nunca lo dice en voz alta**.

---

## Respaldos

- **Todos los días** se guarda una copia de la base en tu servidor.
- **Respaldo en tu Google Drive (opcional):** en **Configuración → Sistema → Respaldo**. La copia sube **cifrada** y
  solo se abre con un **código de recuperación** que se te muestra una única vez: guardalo en un lugar seguro.

<img src="../img/respaldo.png" alt="Respaldo en Drive" width="640">

---

## Actualizaciones y licencia

Tessis se actualiza sola, de madrugada. Si una versión nueva no arranca, vuelve automáticamente a la anterior. Si tu licencia
está por vencer o tiene algún problema, el titular ve un aviso arriba en la app.

---

## Preguntas frecuentes

**¿Tessis me escucha todo el tiempo?**
No. Solo procesa lo que le escribís o le decís cuando tocás el micrófono.

**¿Puede leer mis mails o mandar mails por mí?**
Si vinculás tu Gmail, puede **leerlo** para buscar y resumir mails. No manda, no borra ni marca nada.

**¿Ve mi pantalla sin avisarme?**
No. Solo cuando se lo pedís («mirá mi pantalla»), y solo si tu PC tiene el agente con ese permiso.

**¿Qué pasa si se cae internet o el servidor?**
Los recordatorios que vencieron con el servidor apagado salen apenas vuelve, con un aviso del atraso.

**¿Cuánto cuesta?**
Las claves de IA tienen opciones gratis que alcanzan para un hogar. Las dos formas traen 7 días de prueba gratis y
son para hasta 5 personas:
- **Tessis Online** (sin servidor): 5 USD el primer mes y después 7 USD por mes.
- **Tessis Server** (en tu servidor de Oracle Cloud o Google Cloud, que tienen opción gratis): 3 USD el primer mes y
  después 5 USD por mes. Si en los primeros 7 días no lográs hacerla funcionar, te devolvemos el pago.

**¿Cómo borro todo?**
El titular puede borrar a un miembro y todos sus datos desde **Configuración → Familia**. Para borrar todo: en Tessis
Server, se borra el servidor; en Tessis Online, escribinos y lo borramos (si no renovás, se borra solo a los 30 días
del vencimiento).
