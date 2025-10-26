# RDSのID
output "rds_id" {
  description = "RDSのID"
  value       = aws_db_instance.rds.id
}

# RDSの名前
output "rds_name" {
  description = "RDSの名前"
  value       = aws_db_instance.rds.db_name
}
