# EC2の名前
variable "ec2_name" {
  description = "EC2の名前"
  type        = string
}

# EC2のAMIのID
variable "ami_id" {
  description = "EC2のAMIのID"
  type        = string
}

# EC2のインスタンスタイプ
variable "instance_type" {
  description = "EC2のインスタンスタイプ"
  type        = string
}

# EC2のキーペア名
variable "key_name" {
  description = "EC2のキーペア名"
  type        = string
}

# EC2を作成するサブネットID
variable "subnet_id" {
  description = "EC2を作成するサブネットID"
  type        = string
}

# EC2を作成するVPCのID
variable "vpc_id" {
  description = "EC2を作成するVPCのID"
  type        = string
}

# SSHアクセスを許可するIPアドレス
# 複数IPを許可したい場合はカンマ区切りではなく、別の方法で管理
variable "allowed_ssh_cidr" {
  description = "SSHアクセスを許可するIP"
  type        = string
  default     = ""

  validation {
    condition     = length(var.allowed_ssh_cidr) > 0
    error_message = "allowed_ssh_cidr は空にできません。必ずCIDRを指定してください。"
  }
}

variable "alb_sg_id" {
  description = "Security Group ID of the ALB to allow access to EC2"
  type        = string
}

# 共通タグ
variable "tags" {
  description = "EC2や関連リソースの共通タグ"
  type        = map(string)
  default     = {}
}
