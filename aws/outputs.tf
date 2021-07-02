locals {
  db_instance_endpoint = aws_db_instance.default.*.endpoint
}

output "db_instance_endpoint" {
  description = "The address of the RDS instance"
  value       = local.db_instance_endpoint
}
