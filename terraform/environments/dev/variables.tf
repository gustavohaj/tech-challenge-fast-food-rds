variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "tech-challenge-fast-food"
}

variable "environment" {
  description = "The environment name"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}