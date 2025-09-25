output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.rds.rds_endpoint
}

output "rds_port" {
  description = "The port of the RDS instance"
  value       = module.rds.rds_port
}

output "db_password_secret_arn" {
  description = "The ARN of the secret containing the database password"
  value       = module.rds.db_password_secret_arn
}
