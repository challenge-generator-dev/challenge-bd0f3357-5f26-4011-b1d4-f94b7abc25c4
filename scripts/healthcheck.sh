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