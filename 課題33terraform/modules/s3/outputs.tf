# S3バケットのID
output "bucket_id" {
  description = "S3バケットのID"
  value       = aws_s3_bucket.s3bucket.id
}

# S3バケットの名前
output "bucket_name" {
  description = "S3バケットの名前"
  value       = aws_s3_bucket.s3bucket.bucket
}
