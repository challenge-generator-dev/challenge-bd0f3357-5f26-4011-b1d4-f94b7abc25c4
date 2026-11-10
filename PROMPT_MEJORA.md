# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Como saber que terminaste

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter DevOps, Especialidad Ingenieria, Tecnología Terraform, Advanced L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform (corrida e2e 20261109213213585), Aprovisiona con Terraform la red y el computo del servicio de notificaciones

### Misión / candidato
Versionar la infraestructura del servicio de notificaciones

### Reto
- Tema: Infraestructura como codigo con Terraform
- Seniority: advanced-l2
- Tipo: practical
- Título: Versionado de infraestructura de servicio de notificaciones con Terraform
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Exploración y configuración inicial — objetivo: Configurar el entorno de Terraform y explorar la infraestructura existente del servicio de notificaciones. — entregable (NO resolver): Documentación de los componentes de la infraestructura y configuración inicial de Terraform.
- Fase 2: Aprovisionamiento de la red y el cómputo — objetivo: Usar Terraform para aprovisionar la red y el cómputo necesarios para el servicio de notificaciones. — entregable (NO resolver): Scripts de Terraform que aprovisionan la red y el cómputo, y evidencia de la ejecución exitosa.
- Fase 3: Versionado y gestión de cambios — objetivo: Versionar la infraestructura aprovisionada y gestionar cambios futuros. — entregable (NO resolver): Repositorio de control de versiones con los scripts de Terraform, y documentación del proceso de versionado y gestión de cambios.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: variables.tf ===
# Variables globales para parametrizar la infraestructura del servicio de notificaciones

variable "aws_region" {
  description = "Región de AWS donde se aprovisionarán los recursos"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "Bloque CIDR para la VPC del servicio de notificaciones"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes públicas"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes privadas"
  type        = list(string)
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para el servicio de notificaciones"
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "Tamaño mínimo del Auto Scaling Group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Tamaño máximo del Auto Scaling Group"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Capacidad deseada del Auto Scaling Group"
  type        = number
  default     = 2
}

variable "health_check_grace_period" {
  description = "Período de gracia para el health check en segundos"
  type        = number
  default     = 300
}

variable "notification_service_port" {
  description = "Puerto expuesto por el servicio de notificaciones"
  type        = number
  default     = 8080
}

// === ARCHIVO: providers.tf ===
# Configuración del proveedor AWS y versión de Terraform requerida
# Incluye configuración para backend remoto y validación de versiones

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  backend "s3" {
    bucket         = "terraform-state-notifications-service"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = terraform.workspace
      Service     = "notifications"
      ManagedBy   = "Terraform"
    }
  }
}

# Validación adicional de las versiones del provider y Terraform
locals {
  terraform_version = trimspace(replace(terraform.version, "v", ""))
  aws_provider_version = trimspace(data.aws_caller_identity.current.id != "" ? "5.x" : "")
}

data "aws_caller_identity" "current" {}

// === ARCHIVO: modules/network/variables.tf ===
# Variables específicas para el módulo de red
# Define los parámetros necesarios para configurar la VPC y subredes

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para subredes públicas"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para subredes privadas"
  type        = list(string)
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidad para distribuir las subredes"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "enable_nat_gateway" {
  description = "Habilita la creación de NAT Gateway para subredes privadas"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Usa un único NAT Gateway para todas las subredes privadas"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Habilita DNS hostnames en la VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Habilita soporte DNS en la VPC"
  type        = bool
  default     = true
}

// === ARCHIVO: modules/compute/variables.tf ===
# Variables específicas para el módulo de cómputo
# Define los parámetros necesarios para configurar instancias EC2 y Auto Scaling

variable "instance_type" {
  description = "Tipo de instancia EC2 para el servicio de notificaciones"
  type        = string
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
}

variable "min_size" {
  description = "Tamaño mínimo del Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Tamaño máximo del Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Capacidad deseada del Auto Scaling Group"
  type        = number
}

variable "vpc_security_group_ids" {
  description = "Lista de IDs de security groups para las instancias"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Lista de IDs de subredes para distribuir las instancias"
  type        = list(string)
}

variable "health_check_type" {
  description = "Tipo de health check para el Auto Scaling Group"
  type        = string
  default     = "ELB"
}

variable "health_check_grace_period" {
  description = "Período de gracia para el health check en segundos"
  type        = number
}

variable "target_group_arns" {
  description = "Lista de ARNs de target groups para el Auto Scaling Group"
  type        = list(string)
  default     = []
}

variable "key_name" {
  description = "Nombre de la clave SSH para acceder a las instancias"
  type        = string
}

variable "user_data" {
  description = "Script de user data para configurar las instancias al inicio"
  type        = string
  default     = ""
}

// === ARCHIVO: main.tf ===
# ===================================================================
# Configuración principal de infraestructura para el servicio de
# notificaciones. Este archivo define los recursos de red y cómputo.
# ===================================================================

# Módulo de red: VPC, subnets, route tables, NAT Gateway, Internet Gateway
module "network" {
  source = "./modules/network"

  vpc_cidr         = var.vpc_cidr_block
  availability_zones = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  common_tags      = var.common_tags
  project          = var.project
  environment      = var.environment
}

# Módulo de cómputo: ECS Cluster, tareas y servicios
module "compute" {
  source = "./modules/compute"

  subnet_ids                = module.network.private_subnet_ids
  instance_type             = var.instance_type
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  ami_id                    = var.ami_id
  key_name                  = var.key_name
  container_image           = var.container_image
  container_port            = var.container_port
  task_cpu                  = var.task_cpu
  task_memory               = var.task_memory
  service_desired_count     = var.service_desired_count
  log_retention_days        = var.log_retention_days
  aws_region                = var.aws_region
  target_group_arn          = var.target_group_arn
  security_group_id         = var.security_group_id
  health_check_grace_period = var.health_check_grace_period
  vpc_security_group_ids    = var.vpc_security_group_ids
  project                   = var.project
  environment               = var.environment
  tags                      = var.common_tags
}

// === ARCHIVO: outputs.tf ===
# ===================================================================
# Salidas de la infraestructura aprovisionada.
# Exponen IDs, IPs y ARNs de los recursos creados.
# ===================================================================

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "vpc_cidr_block" {
  description = "Bloque CIDR de la VPC"
  value       = module.network.vpc_cidr
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = module.network.private_subnet_ids
}

output "load_balancer_dns_name" {
  description = "Nombre DNS del Load Balancer"
  value       = module.compute.load_balancer_dns_name
}

output "load_balancer_arn" {
  description = "ARN del Load Balancer"
  value       = module.compute.load_balancer_arn
}

output "asg_name" {
  description = "Nombre del Auto Scaling Group"
  value       = module.compute.asg_name
}

output "asg_arn" {
  description = "ARN del Auto Scaling Group"
  value       = module.compute.asg_arn
}

output "ecs_cluster_name" {
  description = "Nombre del ECS Cluster"
  value       = module.compute.ecs_cluster_name
}

output "ecs_cluster_id" {
  description = "ID del ECS Cluster"
  value       = module.compute.ecs_cluster_id
}

// === ARCHIVO: .terraform-docs.yml ===
# ===================================================================
# Configuración para terraform-docs: genera documentación automática
# de los módulos y variables de Terraform en formato Markdown.
# ===================================================================

version: "1.0"

header:
  fields:
    - name: version
      type: string
      required: true
      description: Versión de Terraform
    - name: provider
      type: string
      required: true
      description: Proveedor de cloud

settings:
  anchor: true
  color: true
  default-language: common
  escape: true
  hide-empty: false
  html-before-headers: false
  indent-level: 2
  line-length: 80
  lockfile: true
  module: false
  read-compatibility: true
  recursive: false
  recursive-path: modules
  required: true
  sensitive: true
  show-all: true
  show-header: true
  show-inertia: false
  show-modules: true
  show-sensitivity: true
  sidebar: {
    folded: false
  }
  sort: {
    enabled: true
    fields:
      - name
      - required
      - type
    order: asc
  }
  template: |-
    <!-- This file is managed by terraform-docs - DO NOT EDIT -->
    {{ .Content }}
  toc: {
    enabled: true
    title: Tabla de contenidos
    indent: 2
  }

formatter: "markdown table"

content: |-
  {{ .Header }}

  {{ .ModuleHeader }}
  {{ if .ModuleCalls }}

  ## Módulos

  | Nombre | Descripción |
  |--------|-------------|
  {{ range .ModuleCalls }}
  | [`{{ .Name }}`]({{ .Path }}) | {{ .Description }} |
  {{ end }}
  {{ end }}
  {{ if .ModuleProviders }}

  ## Proveedores requeridos

  | Proveedor | Versión |
  |-----------|---------|
  {{ range .ModuleProviders }}
  | [{{ .Name }}]({{ .Website }}) | {{ .Version }} |
  {{ end }}
  {{ end }}
  {{ if .ModuleRequirements }}

  ## Requisitos

  | Requisito | Versión |
  |-----------|---------|
  {{ range .ModuleRequirements }}
  | {{ .Name }} | {{ .Version }} |
  {{ end }}
  {{ end }}
  {{ if .ModuleResources }}

  ## Recursos

  | Tipo | Nombre |
  |------|--------|
  {{ range .ModuleResources }}
  | [{{ .Type }}]({{ .URL }}) | [{{ .Name }}](#{{ .Name | anchor }}) |
  {{ end }}
  {{ end }}
  {{ if .ModuleOutputs }}

  ## Salidas

  | Nombre | Descripción |
  |--------|-------------|
  {{ range .ModuleOutputs }}
  | [{{ .Name }}](#{{ .Name | anchor }}) | {{ .Description }} |
  {{ end }}
  {{ end }}
  {{ if .ModuleInputs }}

  ## Entradas

  | Nombre | Descripción | Tipo | Valor por defecto | Requerido |
  |--------|-------------|------|-------------------|-----------|
  {{ range .ModuleInputs }}
  | [{{ .Name }}](#{{ .Name | anchor }}) | {{ .Description }} | {{ .Type }} | {{ if .DefaultValue }}{{ .DefaultValue }}{{ else }}-{{ end }} | {{ if .Required }}sí{{ else }}no{{ end }} |
  {{ end }}
  {{ end }}
  {{ .ModuleFooter }}

  {{ .ProviderHeader }}
  {{ if .ProviderRequirements }}

  ## Requisitos del proveedor

  | Proveedor | Versión |
  |-----------|---------|
  {{ range .ProviderRequirements }}
  | [{{ .Name }}]({{ .Website }}) | {{ .Version }} |
  {{ end }}
  {{ end }}
  {{ .ProviderFooter }}

  {{ .RequirementsHeader }}
  {{ if .Requirements }}

  ## Requisitos

  | Requisito | Versión |
  |-----------|---------|
  {{ range .Requirements }}
  | {{ .Name }} | {{ .Version }} |
  {{ end }}
  {{ end }}
  {{ .RequirementsFooter }}

  {{ .ResourcesHeader }}
  {{ if .Resources }}

  ## Recursos

  | Tipo | Nombre |
  |------|--------|
  {{ range .Resources }}
  | [{{ .Type }}]({{ .URL }}) | [{{ .Name }}](#{{ .Name | anchor }}) |
  {{ end }}
  {{ end }}
  {{ .ResourcesFooter }}

  {{ .OutputsHeader }}
  {{ if .Outputs }}

  ## Salidas

  | Nombre | Descripción |
  |--------|-------------|
  {{ range .Outputs }}
  | [{{ .Name }}](#{{ .Name | anchor }}) | {{ .Description }} |
  {{ end }}
  {{ end }}
  {{ .OutputsFooter }}

  {{ .InputsHeader }}
  {{ if .Inputs }}

  ## Entradas

  | Nombre | Descripción | Tipo | Valor por defecto | Requerido |
  |--------|-------------|------|-------------------|-----------|
  {{ range .Inputs }}
  | [{{ .Name }}](#{{ .Name | anchor }}) | {{ .Description }} | {{ .Type }} | {{ if .DefaultValue }}{{ .DefaultValue }}{{ else }}-{{ end }} | {{ if .Required }}sí{{ else }}no{{ end }} |
  {{ end }}
  {{ end }}
  {{ .InputsFooter }}

// === ARCHIVO: README.md ===
# Versionado de Infraestructura de Servicio de Notificaciones con Terraform

Este proyecto contiene la definición de infraestructura como código para el servicio de notificaciones. Utiliza Terraform para aprovisionar y versionar los componentes de red y cómputo necesarios.

## Propósito

El objetivo principal es garantizar consistencia y replicabilidad en los despliegues del servicio de notificaciones mediante el uso de infraestructura como código versionada. Esto permite:

- Reproducir entornos identically en diferentes etapas (dev, staging, prod)
- Versionar la infraestructura junto con el código de la aplicación
- Gestionar cambios de manera controlada y auditable
- Detectar drift entre la infraestructura deseada y la real

## Estructura de Directorios

```
.
├── environments/
│   ├── dev/
│   │   └── terraform.tfvars    # Variables para entorno de desarrollo
│   └── prod/
│       └── terraform.tfvars    # Variables para entorno de producción
├── modules/
│   ├── compute/
│   │   ├── main.tf             # Definición de recursos de cómputo
│   │   ├── outputs.tf          # Salidas del módulo de cómputo
│   │   └── variables.tf        # Variables del módulo de cómputo
│   └── network/
│       ├── main.tf             # Definición de recursos de red
│       ├── outputs.tf          # Salidas del módulo de red
│       └── variables.tf        # Variables del módulo de red
├── scripts/
│   └── healthcheck.sh          # Script de verificación de salud
├── .terraform-docs.yml         # Configuración para generación de documentación
├── main.tf                     # Archivo principal de Terraform
├── outputs.tf                  # Salidas del root module
├── providers.tf                # Configuración de providers
├── variables.tf                # Variables del root module
└── README.md                   # Este archivo
```

## Requisitos Previos

- Terraform >= 1.5 instalado en el entorno local
- Credenciales de AWS configuradas (variables de entorno, perfil AWS CLI o archivo de credenciales)
- Acceso a un bucket S3 para almacenar el estado remoto de Terraform
- Tabla DynamoDB para el lock del estado (opcional pero recomendado para equipos)

## Configuración Inicial

### 1. Inicializar el directorio de trabajo

```bash
terraform init -backend=false
```

El flag `-backend=false` es útil para una primera ejecución sin configurar el backend remoto. Para entornos de producción, eliminar este flag y configurar el backend en main.tf.

### 2. Validar la configuración

```bash
terraform validate
```

Este comando verifica que los archivos de configuración sean sintácticamente válidos y consistentes.

### 3. Planificar los cambios

```bash
terraform plan -var-file=environments/dev/terraform.tfvars
```

Este comando muestra los recursos que serán creados, modificados o eliminados sin aplicar cambios reales.

### 4. Aplicar la infraestructura

```bash
terraform apply -var-file=environments/dev/terraform.tfvars
```

Este comando aprovisiona los recursos definidos en AWS. Requiere confirmación manual a menos que se use el flag `-auto-approve`.

## Ejemplos de Uso

### Desarrollar en Entorno Local (dev)

```bash
# Validar sintaxis
terraform validate

# Ver plan de cambios
terraform plan -var-file=environments/dev/terraform.tfvars -out=tfplan.dev

# Aplicar cambios
terraform apply tfplan.dev
```

### Desplegar a Producción

```bash
# Usar workspace de producción
terraform workspace select prod

# Plan con variables de producción
terraform plan -var-file=environments/prod/terraform.tfvars -out=tfplan.prod

# Revisar el plan cuidadosamente antes de aplicar
terraform apply tfplan.prod
```

### Limpiar Recursos

```bash
# Destruir todos los recursos creados
terraform destroy -var-file=environments/dev/terraform.tfvars
```

**⚠️ Advertencia**: Este comando elimina todos los recursos de AWS definidos en el estado de Terraform. Usar con precaución.

## Gestión de Secretos

Los secretos nunca deben incluirse en el repositorio. Las siguientes prácticas son obligatorias:

- Usar variables de entorno de AWS (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
- Referenciar secretos desde AWS Secrets Manager o Parameter Store
- Nunca commitear archivos .tfvars con credenciales
- Usar .gitignore para excluir archivos sensibles

## Módulos Reutilizables

El proyecto utiliza dos módulos principales:

### Módulo Network

Encapsula todos los recursos relacionados con la red:

- VPC con CIDR configurable
- Subnets públicas y privadas
- Internet Gateway
- NAT Gateways para conectividad outbound desde subnets privadas
- Route Tables

### Módulo Compute

Encapsula los recursos de cómputo:

- Instancias EC2 o Auto Scaling Groups
- Security Groups asociados
- IAM Roles y Policies
- Load Balancers (opcional)

## Variables por Ambiente

Los valores específicos por ambiente se definen en archivos terraform.tfvars dentro del directorio environments/. Esto permite mantener la misma configuración de Terraform con diferentes valores según el entorno.

## Outputs Disponibles

Después de aplicar la configuración, los siguientes valores están disponibles:

- IDs de VPC y subnets
- Endpoints de servicios
- URLs de load balancers
- Información de instancias aprovisionadas

Consultar outputs.tf para la lista completa.

## Integración con CI/CD

Este proyecto está diseñado para integrarse con pipelines de Azure DevOps, GitHub Actions o AWS CodePipeline. Los stages típicos incluyen:

1. **Init**: Inicializar Terraform y descargar providers
2. **Validate**: Ejecutar terraform validate y terraform fmt
3. **Plan**: Generar plan de cambios para revisión
4. **Apply**: Aprovisionar recursos (solo en分支 protegidas)
5. **Healthcheck**: Validar que los recursos están operativos

## Documentación Automática

El archivo .terraform-docs.yml configura la generación automática de documentación. Para regenerar la documentación:

```bash
terraform-docs ./...
```

## Recursos Adicionales

- Documentación oficial de Terraform: https://www.terraform.io/docs
- Provider AWS de Terraform: https://registry.terraform.io/providers/hashicorp/aws
- Mejores prácticas de seguridad: https://learn.hashicorp.com/tutorials/terraform/aws-security

## Licencia

Este proyecto es para uso interno del equipo de notificaciones.

// === ARCHIVO: modules/network/main.tf ===
# Módulo de red para el servicio de notificaciones
# Este archivo define los recursos de red necesarios: VPC, subnets, security groups

# VPC principal del servicio de notificaciones
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = var.common_tags
}

# Subnets públicas para recursos expuestos a internet
resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = merge(var.common_tags, {
    Name        = "${var.project}-${var.environment}-public-subnet-${count.index + 1}"
    Type        = "public"
  })
}

# Subnets privadas para recursos internos
resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + length(var.availability_zones))
  availability_zone = var.availability_zones[count.index]
  tags = merge(var.common_tags, {
    Name        = "${var.project}-${var.environment}-private-subnet-${count.index + 1}"
    Type        = "private"
  })
}

# Internet Gateway para conectividad externa
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = var.common_tags
}

# Tabla de rutas pública
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = merge(var.common_tags, {
    Name = "${var.project}-${var.environment}-public-rt"
  })
}

# Asociación de subnets públicas con tabla de rutas
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Security Group para el servicio de notificaciones
resource "aws_security_group" "notifications" {
  name        = "${var.project}-${var.environment}-notifications-sg"
  description = "Security group para el servicio de notificaciones"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP desde ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS desde ALB"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Salida a internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}

// === ARCHIVO: modules/network/outputs.tf ===
# Salidas del módulo de red
# Exponen los IDs de los recursos creados para ser consumidos por otros módulos

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "Bloque CIDR de la VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = aws_subnet.private[*].id
}

output "security_group_id" {
  description = "ID del security group del servicio de notificaciones"
  value       = aws_security_group.notifications.id
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.main.id
}

// === ARCHIVO: modules/compute/main.tf ===
# Módulo de cómputo para el servicio de notificaciones
# Define los recursos de cómputo: ECS Cluster, tareas, servicios

# ECS Cluster para el servicio de notificaciones
resource "aws_ecs_cluster" "main" {
  name = "${var.project}-${var.environment}-notifications"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = var.tags
}

# Task Definition para el servicio de notificaciones
resource "aws_ecs_task_definition" "notifications" {
  family                   = "${var.project}-notifications"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([{
    name      = "notifications"
    image     = var.container_image
    essential = true
    portMappings = [{
      containerPort = var.container_port
      protocol      = "tcp"
    }]
    environment = [
      { name = "ENVIRONMENT", value = var.environment },
      { name = "PROJECT", value = var.project }
    ]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = "/ecs/${var.project}-notifications"
        "awslogs-region"        = var.aws_region
        "awslogs-stream-prefix" = "ecs"
      }
    }
  }])

  tags = var.tags
}

# ECS Service para el servicio de notificaciones
resource "aws_ecs_service" "main" {
  name            = "${var.project}-${var.environment}-notifications"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.notifications.arn
  desired_count   = var.service_desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = var.vpc_security_group_ids
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "notifications"
    container_port   = var.container_port
  }

  health_check_grace_period_seconds = var.health_check_grace_period

  depends_on = [aws_iam_role.ecs_execution_role]

  tags = var.tags
}

# IAM Role para ejecución de tareas ECS
resource "aws_iam_role" "ecs_execution_role" {
  name = "${var.project}-${var.environment}-ecs-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

# Policy para ejecución de tareas ECS
resource "aws_iam_role_policy_attachment" "ecs_execution_policy" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# IAM Role para tareas ECS
resource "aws_iam_role" "ecs_task_role" {
  name = "${var.project}-${var.environment}-ecs-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

# Log Group para CloudWatch
resource "aws_cloudwatch_log_group" "notifications" {
  name              = "/ecs/${var.project}-notifications"
  retention_in_days = var.log_retention_days

  tags = var.tags
}

// === ARCHIVO: modules/compute/outputs.tf ===
output "instance_ids" {
  description = "IDs de las instancias EC2 aprovisionadas"
  value       = aws_instance.notification_server[*].id
}

output "public_ips" {
  description = "Direcciones IP públicas de las instancias"
  value       = aws_instance.notification_server[*].public_ip
}

output "private_ips" {
  description = "Direcciones IP privadas de las instancias"
  value       = aws_instance.notification_server[*].private_ip
}

output "public_dns" {
  description = "Nombres DNS públicos de las instancias"
  value       = aws_instance.notification_server[*].public_dns
}

output "security_group_id" {
  description = "ID del security group asociado a las instancias"
  value       = aws_security_group.instance_sg.id
}

output "iam_instance_profile" {
  description = "Nombre del perfil de IAM asociado a las instancias"
  value       = aws_iam_instance_profile.notification_profile.name
}

// === ARCHIVO: environments/dev/terraform.tfvars ===
project_name = "notificaciones"
environment  = "dev"

common_tags = {
  Environment = "development"
  Project     = "notificaciones"
  ManagedBy   = "terraform"
  CostCenter  = "engineering"
}

vpc_cidr            = "10.0.0.0/16"
availability_zones  = ["us-east-1a", "us-east-1b"]

instance_type     = "t3.small"
instance_count    = 2
ami_id            = "ami-0c55b159cbfafe1f0"
key_name          = "notificaciones-dev-key"
root_volume_size  = 20
root_volume_type  = "gp3"

allowed_ssh_cidr     = ["10.0.0.0/16"]
allowed_http_cidrs   = ["0.0.0.0/0"]
allowed_https_cidrs  = ["0.0.0.0/0"]
allowed_smtp_cidrs   = ["0.0.0.0/0"]
allowed_custom_cidrs = ["10.0.0.0/8"]

enable_monitoring              = true
enable_deletion_protection     = false
enable_detailed_monitoring     = false

bucket_name     = "notificaciones-dev-terraform-state"
dynamodb_table  = "notifications-dev-terraform-locks"

healthcheck_path    = "/health"
healthcheck_port    = 8080
healthcheck_timeout = 30
healthcheck_retries = 3

health_check_grace_period = 300
vpc_security_group_ids    = []

// === ARCHIVO: environments/prod/terraform.tfvars ===
project_name = "notificaciones"
environment  = "prod"

tags = {
  Environment = "production"
  Project     = "notificaciones"
  ManagedBy   = "terraform"
  CostCenter  = "engineering"
  Compliance  = "pci-dss"
  Backup      = "required"
}

vpc_cidr             = "172.16.0.0/16"
vpc_cidr_block       = "172.16.0.0/16"
public_subnet_cidrs  = ["172.16.1.0/24", "172.16.2.0/24"]
private_subnet_cidrs = ["172.16.11.0/24", "172.16.12.0/24"]
availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]

instance_type     = "t3.medium"
instance_count    = 3
ami_id            = "ami-0c55b159cbfafe1f0"
key_name          = "notificaciones-prod-key"
root_volume_size  = 50
root_volume_type  = "gp3"

allowed_ssh_cidr     = ["172.16.0.0/16"]
allowed_http_cidrs   = ["0.0.0.0/0"]
allowed_https_cidrs  = ["0.0.0.0/0"]
allowed_smtp_cidrs   = ["10.0.0.0/8"]
allowed_custom_cidrs = ["172.16.0.0/12"]

enable_monitoring               = true
enable_deletion_protection      = true
enable_detailed_monitoring      = true
enable_ebs_encryption           = true
enable_transit_encryption       = true

bucket_name     = "notificaciones-prod-terraform-state"
dynamodb_table  = "notifications-prod-terraform-locks"

healthcheck_path    = "/health"
healthcheck_port    = 8080
healthcheck_timeout = 10
healthcheck_retries = 5

asg_min_size     = 3
asg_max_size     = 6
asg_desired_size = 3
asg_cooldown     = 300
asg_health_check_type = "ELB"

// === ARCHIVO: scripts/healthcheck.sh ===
#!/bin/bash

set -euo pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
readonly ENVIRONMENT="${ENVIRONMENT:-dev}"
readonly AWS_REGION="${AWS_REGION:-us-east-1}"
readonly TIMEOUT_SECONDS=30
readonly RETRY_ATTEMPTS=3

declare -i EXIT_CODE=0
declare -i VERIFIED_RESOURCES=0
declare -i FAILED_RESOURCES=0

log_info() {
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] [INFO] $1"
}

log_error() {
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] [ERROR] $1" >&2
}

log_success() {
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] [SUCCESS] $1"
}

log_warning() {
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] [WARNING] $1"
}

check_aws_credentials() {
    log_info "Verificando credenciales de AWS..."
    
    if ! aws sts get-caller-identity --region "$AWS_REGION" > /dev/null 2>&1; then
        log_error "Credenciales de AWS no configuradas o inválidas"
        return 1
    fi
    
    local identity
    identity=$(aws sts get-caller-identity --query 'Arn' --output text --region "$AWS_REGION")
    log_success "Credenciales configuradas para: $identity"
    return 0
}

get_terraform_output() {
    local output_name="$1"
    local default_value="${2:-}"
    
    if [ -f "$PROJECT_ROOT/terraform.tfstate" ]; then
        cd "$PROJECT_ROOT"
        terraform output -raw "$output_name" 2>/dev/null || echo "$default_value"
    else
        echo "$default_value"
    fi
}

check_vpc_exists() {
    local vpc_id="$1"
    log_info "Verificando VPC: $vpc_id"
    
    if [ -z "$vpc_id" ] || [ "$vpc_id" == "null" ]; then
        log_warning "ID de VPC no proporcionado"
        return 1
    fi
    
    local vpc_state
    vpc_state=$(aws ec2 describe-vpcs --vpc-ids "$vpc_id" --query 'Vpcs[0].State' --output text --region "$AWS_REGION" 2>/dev/null || echo "not-found")
    
    if [ "$vpc_state" == "available" ]; then
        log_success "VPC $vpc_id está disponible"
        ((VERIFIED_RESOURCES++))
        return 0
    else
        log_error "VPC $vpc_id no está disponible (estado: $vpc_state)"
        ((FAILED_RESOURCES++))
        return 1
    fi
}

check_subnets() {
    local vpc_id="$1"
    local expected_count="${2:-2}"
    log_info "Verificando subnets en VPC $vpc_id (esperadas: $expected_count)"
    
    local subnet_count
    subnet_count=$(aws ec2 describe-subnets --filters "Name=vpc-id,Values=$vpc_id" --query 'length(Subnets)' --output text --region "$AWS_REGION" 2>/dev/null || echo "0")
    
    if [ "$subnet_count" -ge "$expected_count" ]; then
        log_success "Subnets verificadas: $subnet_count"
        ((VERIFIED_RESOURCES++))
        return 0
    else
        log_error "Subnets insuficientes: encontradas $subnet_count, esperadas $expected_count"
        ((FAILED_RESOURCES++))
        return 1
    fi
}

check_security_groups() {
    local vpc_id="$1"
    local sg_name_pattern="${2:-notifications-*}"
    log_info "Verificando security groups en VPC $vpc_id"
    
    local sg_count
    sg_count=$(aws ec2 describe-security-groups --filters "Name=vpc-id,Values=$vpc_id" "Name=group-name,Values=$sg_name_pattern" --query 'length(SecurityGroups)' --output text --region "$AWS_REGION" 2>/dev/null || echo "0")
    
    if [ "$sg_count" -gt "0" ]; then
        log_success "Security groups encontrados: $sg_count"
        ((VERIFIED_RESOURCES++))
        return 0
    else
        log_error "No se encontraron security groups con patrón: $sg_name_pattern"
        ((FAILED_RESOURCES++))
        return 1
    fi
}

check_ec2_instances() {
    local vpc_id="$1"
    local expected_state="${2:-running}"
    log_info "Verificando instancias EC2 en VPC $vpc_id"
    
    local instances
    instances=$(aws ec2 describe-instances --filters "Name=vpc-id,Values=$vpc_id" "Name=instance-state-name,Values=$expected_state" --query 'Reservations[].Instances[].InstanceId' --output text --region "$AWS_REGION" 2>/dev/null || echo "")
    
    if [ -n "$instances" ]; then
        local instance_count
        instance_count=$(echo "$instances" | wc -w)
        log_success "Instancias en estado $expected_state: $instance_count"
        ((VERIFIED_RESOURCES++))
        
        for instance_id in $instances; do
            local instance_type
            instance_type=$(aws ec2 describe-instances --instance-ids "$instance_id" --query 'Reservations[0].Instances[0].InstanceType' --output text --region "$AWS_REGION" 2>/dev/null || echo "unknown")
            log_info "  - $instance_id (tipo: $instance_type)"
        done
        
        return 0
    else
        log_warning "No se encontraron instancias en estado $expected_state"
        return 1
    fi
}

check_nat_gateway() {
    local vpc_id="$1"
    log_info "Verificando NAT Gateway en VPC $vpc_id"
    
    local nat_count
    nat_count=$(aws ec2 describe-nat-gateways --filter "Name=vpc-id,Values=$vpc_id" --query 'length(NatGateways)' --output text --region "$AWS_REGION" 2>/dev/null || echo "0")
    
    if [ "$nat_count" -gt "0" ]; then
        log_success "NAT Gateways encontrados: $nat_count"
        ((VERIFIED_RESOURCES++))
        return 0
    else
        log_warning "No se encontraron NAT Gateways"
        return 1
    fi
}

check_internet_gateway() {
    local vpc_id="$1"
    log_info "Verificando Internet Gateway en VPC $vpc_id"
    
    local igw_id
    igw_id=$(aws ec2 describe-internet-gateways --filters "Name=attachment.vpc-id,Values=$vpc_id" --query 'InternetGateways[0].InternetGatewayId' --output text --region "$AWS_REGION" 2>/dev/null || echo "")
    
    if [ -n "$igw_id" ]; then
        log_success "Internet Gateway asociado: $igw_id"
        ((VERIFIED_RESOURCES++))
        return 0
    else
        log_error "No se encontró Internet Gateway para VPC $vpc_id"
        ((FAILED_RESOURCES++))
        return 1
    fi
}

check_routes() {
    local vpc_id="$1"
    log_info "Verificando tablas de rutas en VPC $vpc_id"
    
    local route_table_count
    route_table_count=$(aws ec2 describe-route-tables --filters "Name=vpc-id,Values=$vpc_id" --query 'length(RouteTables)' --output text --region "$AWS_REGION" 2>/dev/null || echo "0")
    
    if [ "$route_table_count" -gt "0" ]; then
        log_success "Tablas de rutas encontradas: $route_table_count"
        ((VERIFIED_RESOURCES++))
        return 0
    else
        log_error "No se encontraron tablas de rutas para VPC $vpc_id"
        ((FAILED_RESOURCES++))
        return 1
    fi
}

verify_network_connectivity() {
    local target_host="${1:-8.8.8.8}"
    log_info "Verificando conectividad de red hacia $target_host..."
    
    if timeout "$TIMEOUT_SECONDS" ping -c 3 "$target_host" > /dev/null 2>&1; then
        log_success "Conectividad hacia $target_host verificada"
        ((VERIFIED_RESOURCES++))
        return 0
    else
        log_error "No hay conectividad hacia $target_host"
        ((FAILED_RESOURCES++))
        return 1
    fi
}

check_dns_resolution() {
    local domain="${1:-amazon.com}"
    log_info "Verificando resolución DNS hacia $domain..."
    
    if timeout "$TIMEOUT_SECONDS" nslookup "$domain" > /dev/null 2>&1 || timeout "$TIMEOUT_SECONDS" dig "$domain" > /dev/null 2>&1; then
        log_success "Resolución DNS hacia $domain exitosa"
        ((VERIFIED_RESOURCES++))
        return 0
    else
        log_error "Resolución DNS hacia $domain fallida"
        ((FAILED_RESOURCES++))
        return 1
    fi
}

run_healthcheck() {
    log_info "========================================="
    log_info "Iniciando healthcheck de infraestructura"
    log_info "Ambiente: $ENVIRONMENT"
    log_info "Región: $AWS_REGION"
    log_info "========================================="
    
    if ! check_aws_credentials; then
        log_error "Healthcheck abortado: credenciales inválidas"
        exit 1
    fi
    
    log_info "Cargando configuración del ambiente..."
    local tfvars_file="$PROJECT_ROOT/environments/$ENVIRONMENT/terraform.tfvars"
    
    if [ ! -f "$tfvars_file" ]; then
        log_warning "Archivo de variables no encontrado: $tfvars_file"
        log_info "Usando valores por defecto del entorno"
    fi
    
    local vpc_id="${VPC_ID:-}"
    
    if [ -z "$vpc_id" ]; then
        vpc_id=$(get_terraform_output "vpc_id" "")
    fi
    
    if [ -z "$vpc_id" ]; then
        log_error "No se pudo obtener el ID de la VPC"
        log_error "Defina la variable VPC_ID o ejecute terraform output primero"
        exit 1
    fi
    
    log_info "========================================="
    log_info "Verificando recursos de red"
    log_info "========================================="
    
    check_vpc_exists "$vpc_id"
    check_internet_gateway "$vpc_id"
    check_subnets "$vpc_id" 2
    check_security_groups "$vpc_id"
    check_routes "$vpc_id"
    check_nat_gateway "$vpc_id"
    
    log_info "========================================="
    log_info "Verificando recursos de cómputo"
    log_info "========================================="
    
    check_ec2_instances "$vpc_id" "running"
    
    log_info "========================================="
    log_info "Verificando conectividad"
    log_info "========================================="
    
    verify_network_connectivity
    check_dns_resolution
    
    log_info "========================================="
    log_info "Resumen del healthcheck"
    log_info "========================================="
    log_info "Recursos verificados exitosamente: $VERIFIED_RESOURCES"
    log_info "Recursos fallidos: $FAILED_RESOURCES"
    
    if [ "$FAILED_RESOURCES" -eq 0 ]; then
        log_success "Healthcheck completado: todos los recursos están healthy"
        EXIT_CODE=0
    elif [ "$FAILED_RESOURCES" -lt 3 ]; then
        log_warning "Healthcheck completado con advertencias"
        EXIT_CODE=1
    else
        log_error "Healthcheck completado: recursos críticos fallidos"
        EXIT_CODE=2
    fi
    
    return "$EXIT_CODE"
}

main() {
    run_healthcheck
    exit $?
}

main "$@"

// === ARCHIVO: Dockerfile ===
# Dockerfile multi-stage para validación de infraestructura Terraform
# Este Dockerfile permite construir y validar la infraestructura sin instalar Terraform localmente

# Etapa 1: Builder - descarga e instala Terraform
FROM hashicorp/terraform:1.5.7 AS builder

# Etapa 2: Validator - copia el código y ejecuta validación
FROM alpine:3.19 AS validator

# Instala las herramientas necesarias para la validación
RUN apk add --no-cache curl bash jq

# Copia el binario de Terraform desde la etapa builder
COPY --from=builder /bin/terraform /usr/local/bin/terraform

# Define el directorio de trabajo
WORKDIR /app

# Copia los archivos de configuración de Terraform
COPY providers.tf /app/
COPY variables.tf /app/
COPY main.tf /app/
COPY outputs.tf /app/
COPY .terraform-docs.yml /app/

# Copia los módulos de infraestructura
COPY modules/ /app/modules/

# Copia los entornos
COPY environments/ /app/environments/

# Copia scripts de utilidad
COPY scripts/ /app/scripts/

# Inicializa Terraform (sin backend remoto para validación local)
RUN terraform init -backend=false

# Valida la configuración de Terraform
RUN terraform validate

# Ejecuta terraform plan para verificar que los recursos se pueden crear
RUN terraform plan -out=tfplan -var-file=environments/dev/terraform.tfvars

# Etapa 3: Final - imagen mínima de producción (opcional)
FROM alpine:3.19 AS production

# Instala solo las herramientas necesarias para运行
RUN apk add --no-cache curl bash

# Copia el binario de Terraform
COPY --from=builder /bin/terraform /usr/local/bin/terraform

# Copia los scripts de healthcheck
COPY scripts/healthcheck.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/healthcheck.sh

# Puerto para healthcheck
EXPOSE 8080

# Healthcheck básico
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

# Punto de entrada
ENTRYPOINT ["/bin/bash", "/usr/local/bin/healthcheck.sh"]
```
