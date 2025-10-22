# WAF WebACLの名前
variable "waf_name" {
  description = "WAF WebACLの名前"
  type        = string
}

# ALBのARN
variable "alb_arn" {
  description = "WAFを関連付けるALBのARN"
  type        = string
}

variable "log_retention" {
  description = "CloudWatch Logs の保持期間（日数）"
  type        = number
  default     = 7
}
