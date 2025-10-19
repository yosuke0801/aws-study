# VPCの名前
variable "vpc_name" {
  description = "VPCの名前"
  type        = string
}

# VPCのCIDR
variable "vpc_cidr" {
  description = "VPCのCIDR"
  type        = string
  default     = "10.0.0.0/16"
}

# 共通タグ
variable "tags" {
  description = "共通タグ"
  type        = map(string)
  default     = {}
}
