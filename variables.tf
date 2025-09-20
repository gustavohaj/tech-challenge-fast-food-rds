variable "aws_region" {
  description = "Região da AWS para implantar os recursos"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto para usar como prefixo nos recursos"
  type        = string
  default     = "fiap-fastfood"
}

variable "db_name" {
  description = "Nome do banco de dados inicial"
  type        = string
  default     = "fastfood"
}

variable "db_user" {
  description = "Usuário master do banco de dados"
  type        = string
  default     = "admin"
}
