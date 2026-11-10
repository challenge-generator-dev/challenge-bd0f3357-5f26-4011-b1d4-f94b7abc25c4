# Módulo de cómputo para el servicio de notificaciones
# Define los recursos de cómputo: ECS Cluster, tareas, servicios

# ECS Cluster para el servicio de notificaciones
resource "aws_ecs_cluster" "main" {
  name = "${var.project}-${var.environment}-notifications"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = var.tags
}

# Task Definition para el servicio de notificaciones
resource "aws_ecs_task_definition" "notifications" {
  family                   = "${var.project}-notifications"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([{
    name      = "notifications"
    image     = var.container_image
    essential = true
    portMappings = [{
      containerPort = var.container_port
      protocol      = "tcp"
    }]
    environment = [
      { name = "ENVIRONMENT", value = var.environment },
      { name = "PROJECT", value = var.project }
    ]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = "/ecs/${var.project}-notifications"
        "awslogs-region"        = var.aws_region
        "awslogs-stream-prefix" = "ecs"
      }
    }
  }])

  tags = var.tags
}

# ECS Service para el servicio de notificaciones
resource "aws_ecs_service" "main" {
  name            = "${var.project}-${var.environment}-notifications"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.notifications.arn
  desired_count   = var.service_desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = var.vpc_security_group_ids
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "notifications"
    container_port   = var.container_port
  }

  health_check_grace_period_seconds = var.health_check_grace_period

  depends_on = [aws_iam_role.ecs_execution_role]

  tags = var.tags
}

# IAM Role para ejecución de tareas ECS
resource "aws_iam_role" "ecs_execution_role" {
  name = "${var.project}-${var.environment}-ecs-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

# Policy para ejecución de tareas ECS
resource "aws_iam_role_policy_attachment" "ecs_execution_policy" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# IAM Role para tareas ECS
resource "aws_iam_role" "ecs_task_role" {
  name = "${var.project}-${var.environment}-ecs-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

# Log Group para CloudWatch
resource "aws_cloudwatch_log_group" "notifications" {
  name              = "/ecs/${var.project}-notifications"
  retention_in_days = var.log_retention_days

  tags = var.tags
}