# RDSの名前
variable "rds_name" {
  description = "RDSの名前"
  type        = string
}

# DBエンジン
variable "engine" {
  description = "DBエンジン"
  type        = string
  default     = "mysql"
}

# DBエンジンバージョン
variable "engine_version" {
  description = "DBエンジンバージョン"
  type        = string
  default     = "8.0.42"
}

# インスタンスの種類
variable "instance_class" {
  description = "インスタンスの種類"
  type        = string
  default     = "db.t3.micro"
}

# RDSのストレージサイズ（GB）
variable "allocated_storage" {
  description = "RDSのストレージサイズ（GB）"
  type        = number
  default     = 20
}

# データベース名
variable "db_name" {
  description = "データベース名"
  type        = string
  default     = "tfawsstudyrds"
}

# DB管理ユーザー名
variable "username" {
  description = "DB管理ユーザー名"
  type        = string
  default     = "root"
}

# RDSのパスワード
variable "rds_password" {
  description = "RDSのパスワード"
  type        = string
  sensitive   = true
}

# AZのリスト
variable "availability_zones" {
  description = "AZのリスト"
  type        = list(string)
}

# Multi-AZ構成にするか
variable "multi_az" {
  description = "Multi-AZ構成にするか"
  type        = bool
  default     = false
}

# パブリックアクセスを許可するか
variable "publicly_accessible" {
  description = "パブリックアクセスを許可するか"
  type        = bool
  default     = false
}

# ストレージタイプ
variable "storage_type" {
  description = "ストレージタイプ"
  type        = string
  default     = "gp3"
}

# メジャーバージョンアップを許可するか
variable "allow_major_version_upgrade" {
  description = "メジャーバージョンアップを許可するか"
  type        = bool
  default     = false
}

# マイナーバージョンアップを自動で行うか
variable "auto_minor_version_upgrade" {
  description = "マイナーバージョンアップを自動で行うか"
  type        = bool
  default     = true
}

# 削除保護を有効にするか
variable "deletion_protection" {
  description = "削除保護を有効にするかどうか"
  type        = bool
  default     = true
}

# 削除時にスナップショットをスキップするか
variable "skip_final_snapshot" {
  description = "削除時にスナップショットをスキップするかどうか"
  type        = bool
  default     = false
}

# VPCのID
variable "vpc_id" {
  description = "VPCのID"
  type        = string
}

# EC2セキュリティグループのID
variable "ec2_sg_id" {
  description = "EC2のセキュリティグループID"
  type        = string
}

# プライベートサブネットのIDリスト
variable "private_subnet_ids" {
  description = "プライベートサブネットのIDリスト"
  type        = list(string)
}

# 共通タグ
variable "tags" {
  description = "タグ"
  type        = map(string)
  default     = {}
}
