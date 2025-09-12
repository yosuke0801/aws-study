# EC2の名前
variable "ec2_name" {
  description = "EC2の名前"
  type        = string
}

# EC2のAMIのID
variable "ami" {
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

# 共通タグ
variable "tags" {
  description = "EC2や関連リソースの共通タグ"
  type        = map(string)
  default     = {}
}
