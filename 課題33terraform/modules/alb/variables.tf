# ALBの名前
variable "alb_name" {
  description = "ALBの名前"
  type        = string
}

# ALBを内部向けにするかの指定
variable "internal" {
  description = "ALBを内部向けにするかの指定"
  type        = bool
  default     = false
}

# ALBを配置するサブネットのリスト
variable "subnets" {
  description = "ALBを配置するサブネットのリスト"
  type        = list(string)
}

# VPCのID
variable "vpc_id" {
  description = "VPCのID"
  type        = string
}

# ターゲットグループのポート番号
variable "target_port" {
  description = "ターゲットグループのポート番号"
  type        = number
  default     = 8080
}

# ALBリスナーのポート番号
variable "listener_port" {
  description = "ALBリスナーのポート番号"
  type        = number
  default     = 80
}

# ヘルスチェックのパス
variable "health_check_path" {
  description = "ヘルスチェックのパス"
  type        = string
  default     = "/"
}

# ALBに紐づけるEC2のID
variable "ec2_instance_id" {
  description = "ALBに紐づけるEC2のID"
  type        = string
}

# 共通タグ
variable "tags" {
  description = "タグ"
  type        = map(string)
  default     = {}
}

variable "allowed_alb_cidr" {
  description = "ALB にアクセスを許可する CIDR。デフォルトは 0.0.0.0/0"
  type        = string
  default     = "0.0.0.0/0" # デフォルトは全体公開
}