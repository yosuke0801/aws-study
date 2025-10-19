# リージョン
variable "aws_region" {
  description = "リソースが構築されるリージョン"
  type        = string
  default     = "ap-northeast-1"
}

# Amazon Linux 2023のAMIのID
variable "ami_id" {
  description = "Amazon Linux 2023のAMIのID"
  type        = string
  default     = "ami-07faa35bbd2230d90"
}

# 共通の名前タグ
variable "name_prefix" {
  description = "リソース名に付与するプレフィックス"
  type        = string
  default     = "tf-aws-study"
}
