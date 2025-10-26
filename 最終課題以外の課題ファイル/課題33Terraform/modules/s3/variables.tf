# S3バケットの名前
variable "bucket_name" {
  description = "S3バケットの名前"
  type        = string
}

# 共通タグ
variable "tags" {
  description = "共通タグ"
  type        = map(string)
  default     = {}
}
