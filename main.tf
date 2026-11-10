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