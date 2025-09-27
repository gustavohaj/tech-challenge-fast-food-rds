output "db_instance_endpoint" {
  description = "The endpoint of the database instance"
  value       = aws_db_instance.default.endpoint
}

output "db_instance_port" {
  description = "The port of the database instance"
  value       = aws_db_instance.default.port
}

output "db_instance_name" {
  description = "The name of the database instance"
  value       = aws_db_instance.default.db_name
}

output "db_instance_username" {
  description = "The username for the database instance"
  value       = aws_db_instance.default.username
  sensitive   = true
}

output "db_instance_password" {
  description = "The password for the database instance"
  value       = random_password.master_password.result
  sensitive   = true
}