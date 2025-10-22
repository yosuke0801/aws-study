output "rds_name" {
  description = "RDSの名前"
  value       = var.rds_name
}

output "rds_id" {
  description = "RDSのID"
  value       = aws_db_instance.rds.id
}
