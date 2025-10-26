# CloudWatch Alarmの名前
variable "cwa_name" {
  description = "CloudWatch Alarmの名前"
  type        = string
}

# 対象EC2のID
variable "ec2_instance_id" {
  description = "対象EC2のID"
  type        = string
}

# CPU使用率の閾値
variable "threshold" {
  description = "CPU使用率の閾値"
  type        = number
  default     = 80
}

# 評価期間（回数）
variable "evaluation_periods" {
  description = "評価期間（回数）"
  type        = number
  default     = 1
}

# 統計期間（秒）
variable "period" {
  description = "統計期間（秒）"
  type        = number
  default     = 60
}

# 統計方法
variable "statistic" {
  description = "統計方法"
  type        = string
  default     = "Average"
}
