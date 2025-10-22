# ALBの名前
variable "alb_name" {
  description = "ALBの名前"
  type        = string
}

# VPCのID
variable "vpc_id" {
  description = "VPCのID"
  type        = string
}

# ALBを配置するサブネットのリスト
variable "subnet_ids" {
  description = "ALBを配置するサブネットのリスト"
  type        = list(string)
}

# ターゲットグループに登録するEC2インスタンスIDリスト
variable "target_instance_ids" {
  description = "ターゲットグループに登録するEC2インスタンスIDリスト"
  type        = list(string)
}
