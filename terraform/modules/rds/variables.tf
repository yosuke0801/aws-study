variable "rds_name" {
  description = "RDSの名前"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "RDSを配置するプライベートサブネットIDリスト"
  type        = list(string)
}

variable "ec2_sg_ids" {
  description = "RDSにアクセスを許可するEC2セキュリティグループIDリスト"
  type        = list(string)
}

variable "db_name" {
  description = "データベース名"
  type        = string
  default     = "tfawsstudy"
}

variable "db_username" {
  description = "RDSのマスターユーザー名"
  type        = string
  default     = "root"
}

variable "db_password" {
  description = "RDSのマスターパスワード"
  type        = string
  sensitive   = true
}
