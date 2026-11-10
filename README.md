# Versionado de infraestructura de servicio de notificaciones con Terraform

El equipo de notificaciones necesita versionar su infraestructura para garantizar consistencia y replicabilidad en despliegues. La infraestructura incluye la red y el cómputo necesario para el servicio. Debes usar Terraform para aprovisionar y versionar estos componentes.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo con Terraform |
| **Nivel** | advanced-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Exploración y configuración inicial

**Objetivo:** Configurar el entorno de Terraform y explorar la infraestructura existente del servicio de notificaciones.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identificar y documentar los componentes de la infraestructura actual.
- Configurar el entorno de Terraform para trabajar con la infraestructura del servicio de notificaciones.

**Entregable:** Documentación de los componentes de la infraestructura y configuración inicial de Terraform.

<details>
<summary>Pistas de conocimiento</summary>

- Uso de Terraform para la gestión de infraestructura.
- Importancia de la versión y control de cambios en la infraestructura.

</details>

### Fase 2: Aprovisionamiento de la red y el cómputo

**Objetivo:** Usar Terraform para aprovisionar la red y el cómputo necesarios para el servicio de notificaciones.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Crear scripts de Terraform para aprovisionar la red y el cómputo.
- Ejecutar los scripts y verificar que los componentes se han aprovisionado correctamente.

**Entregable:** Scripts de Terraform que aprovisionan la red y el cómputo, y evidencia de la ejecución exitosa.

<details>
<summary>Pistas de conocimiento</summary>

- Mejores prácticas para el aprovisionamiento de infraestructura con Terraform.
- Manejo de dependencias y recursos en Terraform.

</details>

### Fase 3: Versionado y gestión de cambios

**Objetivo:** Versionar la infraestructura aprovisionada y gestionar cambios futuros.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Versionar los scripts de Terraform en un repositorio de control de versiones.
- Planificar y ejecutar cambios en la infraestructura usando Terraform.
- Documentar el proceso de versionado y gestión de cambios.

**Entregable:** Repositorio de control de versiones con los scripts de Terraform, y documentación del proceso de versionado y gestión de cambios.

<details>
<summary>Pistas de conocimiento</summary>

- Uso de repositorios de control de versiones para la gestión de infraestructura.
- Estrategias para la planificación y ejecución de cambios en Terraform.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y cómo se usa para la gestión de infraestructura?
- **paraQueSirve**: ¿Para qué sirve versionar la infraestructura con Terraform?
- **comoSeUsa**: ¿Cómo se usan los scripts de Terraform para aprovisionar la red y el cómputo?
- **erroresComunes**: ¿Cuáles son los errores comunes al aprovisionar infraestructura con Terraform y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el versionado y la gestión de cambios en la infraestructura con Terraform?

## Criterios de Evaluacion

- Configuración inicial de Terraform y documentación de la infraestructura.
- Scripts de Terraform que aprovisionan la red y el cómputo.
- Versionado de los scripts de Terraform en un repositorio de control de versiones.
- Documentación del proceso de versionado y gestión de cambios.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
