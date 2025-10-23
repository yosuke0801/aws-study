# EC2の名前
output "ec2_name" {
  description = "EC2の名前"
  value       = aws_instance.ec2.tags["Name"]
}

# EC2のID
output "ec2_id" {
  description = "EC2のID"
  value       = aws_instance.ec2.id
}

# EC2セキュリティグループのID
output "ec2_sg_ids" {
  description = "EC2セキュリティグループのID"
  value       = [aws_security_group.ec2_sg.id]
}

# EC2のパブリックIP
output "ec2_public_ip" {
  description = "EC2のパブリックIP"
  value       = aws_instance.ec2.public_ip
}
