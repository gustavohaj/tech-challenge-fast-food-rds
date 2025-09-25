variable "aws_region" {
  description = "The AWS region to deploy to."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "The name of the project."
  type        = string
  default     = "tech-challenge"
}

variable "environment" {
  description = "The environment to deploy to."
  type        = string
  default     = "dev"
}
