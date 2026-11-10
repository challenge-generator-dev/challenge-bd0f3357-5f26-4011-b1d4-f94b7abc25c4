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