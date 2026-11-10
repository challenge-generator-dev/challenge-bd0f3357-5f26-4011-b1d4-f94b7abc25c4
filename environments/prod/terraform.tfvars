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