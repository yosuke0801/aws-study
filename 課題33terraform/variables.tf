# リージョン
variable "aws_region" {
  description = "リソースが構築されるリージョン"
  type        = string
  default     = "ap-northeast-1"
}

# 共通タグ
variable "name_prefix" {
  description = "リソース名に付与するプレフィックス"
  type        = string
  default     = "tf-aws-study"
}

# RDSのパスワード
variable "rds_password" {
  description = "RDSのパスワード"
  type        = string
  sensitive   = true
}
