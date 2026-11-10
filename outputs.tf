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