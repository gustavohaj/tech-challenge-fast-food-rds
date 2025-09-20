output "rds_endpoint" {
  description = "O endpoint do banco de dados RDS"
  value       = aws_db_instance.main.endpoint
}

output "rds_port" {
  description = "A porta do banco de dados RDS"
  value       = aws_db_instance.main.port
}

output "rds_password_secret_name" {
  description = "O nome do segredo no AWS Secrets Manager que contém a senha do DB"
  value       = aws_secretsmanager_secret.db_password_secret.name
}
