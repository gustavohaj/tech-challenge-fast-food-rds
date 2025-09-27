output "db_instance_endpoint" {
  description = "The endpoint of the database instance"
  value       = module.rds.db_instance_endpoint
}

output "db_instance_port" {
  description = "The port of the database instance"
  value       = module.rds.db_instance_port
}

output "db_instance_name" {
  description = "The name of the database instance"
  value       = module.rds.db_instance_name
}

output "db_instance_username" {
  description = "The username for the database instance"
  value       = module.rds.db_instance_username
  sensitive   = true
}

output "db_instance_password" {
  description = "The password for the database instance"
  value       = module.rds.db_instance_password
  sensitive   = true
}