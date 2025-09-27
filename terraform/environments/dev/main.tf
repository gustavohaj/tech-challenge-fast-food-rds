terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "terraform_remote_state" "eks_infra" {
  backend = "s3"
  config = {
    bucket = "tech-challenge-fast-food-terraform-state"
    key    = "environments/dev/terraform.tfstate"
    region = "us-east-1"
  }
}

module "rds" {
  source = "../../modules/rds"

  project_name                  = var.project_name
  environment                   = var.environment
  aws_region                    = var.aws_region
  vpc_id                        = data.terraform_remote_state.eks_infra.outputs.vpc_id
  private_subnet_ids            = data.terraform_remote_state.eks_infra.outputs.private_subnet_ids
  eks_worker_security_group_ids = data.terraform_remote_state.eks_infra.outputs.eks_worker_security_group_ids
}