output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.default.endpoint
}

output "rds_port" {
  description = "The port of the RDS instance"
  value       = aws_db_instance.default.port
}

output "db_password_secret_arn" {
  description = "The ARN of the secret containing the database password"
  value       = aws_secretsmanager_secret.db_password.arn
}
