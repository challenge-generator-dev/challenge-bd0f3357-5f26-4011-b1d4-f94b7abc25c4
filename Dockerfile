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