variable "ec2_id" {
  description = "監視対象のEC2インスタンスID"
  type        = string
}

variable "cwa_name" {
  description = "CloudWatch Alarm名"
  type        = string
}
