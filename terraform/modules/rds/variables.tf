variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "environment" {
  description = "The environment name"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "The IDs of the private subnets"
  type        = list(string)
}

variable "eks_worker_security_group_ids" {
  description = "The security group IDs of the EKS worker nodes"
  type        = list(string)
}

variable "db_allocated_storage" {
  description = "The allocated storage for the database"
  type        = number
  default     = 20
}

variable "db_instance_class" {
  description = "The instance class for the database"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "fast_food_db"
}

variable "db_username" {
  description = "The username for the database"
  type        = string
  default     = "fastfood"
}