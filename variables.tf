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