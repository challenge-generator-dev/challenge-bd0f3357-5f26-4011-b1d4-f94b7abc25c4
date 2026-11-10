# Módulo de red para el servicio de notificaciones
# Este archivo define los recursos de red necesarios: VPC, subnets, security groups

# VPC principal del servicio de notificaciones
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = var.common_tags
}

# Subnets públicas para recursos expuestos a internet
resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = merge(var.common_tags, {
    Name        = "${var.project}-${var.environment}-public-subnet-${count.index + 1}"
    Type        = "public"
  })
}

# Subnets privadas para recursos internos
resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + length(var.availability_zones))
  availability_zone = var.availability_zones[count.index]
  tags = merge(var.common_tags, {
    Name        = "${var.project}-${var.environment}-private-subnet-${count.index + 1}"
    Type        = "private"
  })
}

# Internet Gateway para conectividad externa
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = var.common_tags
}

# Tabla de rutas pública
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = merge(var.common_tags, {
    Name = "${var.project}-${var.environment}-public-rt"
  })
}

# Asociación de subnets públicas con tabla de rutas
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Security Group para el servicio de notificaciones
resource "aws_security_group" "notifications" {
  name        = "${var.project}-${var.environment}-notifications-sg"
  description = "Security group para el servicio de notificaciones"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP desde ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS desde ALB"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Salida a internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}