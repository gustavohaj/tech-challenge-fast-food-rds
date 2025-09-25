terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Data source to find the existing VPC
data "aws_vpc" "main" {
  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }
}

# Data source to find the existing private subnets
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
  tags = {
    Tier = "Private"
  }
}

# RDS Module
module "rds" {
  source = "../../modules/rds"

  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = data.aws_vpc.main.id
  vpc_cidr           = data.aws_vpc.main.cidr_block
  private_subnet_ids = data.aws_subnets.private.ids
  db_name            = "fastfood"
  db_username        = "root"
}
