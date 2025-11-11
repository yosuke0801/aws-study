variable "vpc_name" {
  description = "VPCの名前"
  type        = string
}

variable "vpc_cidr" {
  description = "VPCのCIDR"
  type        = string
  default     = "10.0.0.0/16"
}
