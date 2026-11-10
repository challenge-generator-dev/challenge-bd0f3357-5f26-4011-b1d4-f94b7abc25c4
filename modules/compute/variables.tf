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