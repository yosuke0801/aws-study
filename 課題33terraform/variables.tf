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

# Amazon Linux 2023のAMIのID
variable "ami_id" {
  description = "Amazon Linux 2023のAMIのID"
  type        = string
  default     = "ami-07faa35bbd2230d90"
}

# EC2用キーペア名
variable "key_name" {
  description = "EC2用キーペア名"
  type        = string
}

# RDSのパスワード
variable "rds_password" {
  description = "RDSのパスワード"
  type        = string
  sensitive   = true
}
