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