# EC2のID
output "ec2_id" {
  description = "EC2のID"
  value       = aws_instance.ec2.id
}

# EC2の名前
output "ec2_name" {
  description = "EC2の名前"
  value       = var.ec2_name
}

# EC2セキュリティグループのID
output "ec2_sg_ids" {
  description = "EC2セキュリティグループのID"
  value       = [aws_security_group.ec2_sg.id]
}

# EC2セキュリティグループの名前
output "ec2_sg_names" {
  description = "EC2セキュリティグループの名前"
  value       = [aws_security_group.ec2_sg.tags["Name"]]
}

# EC2のAMI
output "ec2_ami_id" {
  value = var.ami_id
}

# EC2のインスタンスタイプ
output "ec2_instance_type" {
  value = var.instance_type
}

# キーペア名
output "ec2_key_name" {
  value = var.key_name
}

# サブネットID
output "ec2_subnet_id" {
  value = var.subnet_id
}
