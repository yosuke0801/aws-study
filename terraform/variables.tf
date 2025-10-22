# 名前のプレフィックス
variable "name_prefix" {
  description = "リソースの名前プレフィックス"
  type        = string
  default     = "tf-aws-study"
}

# EC2用キーペア名
variable "key_name" {
  description = "EC2用キーペア名"
  type        = string
}

# RDSデータベース名
variable "db_name" {
  description = "RDSデータベース名"
  type        = string
  default     = "tfawsstudy"
}

# RDSマスターユーザー名
variable "db_username" {
  description = "RDSのマスターユーザー名"
  type        = string
  default     = "root"
}

# RDSマスターパスワード
variable "db_password" {
  description = "RDSのマスターパスワード"
  type        = string
  sensitive   = true
}
