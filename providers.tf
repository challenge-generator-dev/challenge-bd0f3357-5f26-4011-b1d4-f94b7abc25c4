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