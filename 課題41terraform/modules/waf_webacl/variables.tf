# WAF WebACLの名前
variable "waf_name" {
  description = "WAF WebACLの名前"
  type        = string
}

# 関連付けるALBのARN
variable "alb_arn" {
  description = "関連付けるALBのARN"
  type        = string
}

# CloudWatch Logsの保持日数
variable "log_retention" {
  description = "CloudWatch Logsの保持日数"
  type        = number
  default     = 7
}

# 共通タグ
variable "tags" {
  description = "タグ"
  type        = map(string)
  default     = {}
}
