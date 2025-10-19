# VPCのID
output "vpc_id" {
  description = "VPCのID"
  value       = aws_vpc.vpc.id
}

# VPCの名前
output "vpc_name" {
  description = "VPCの名前"
  value       = var.vpc_name
}

# パブリックサブネットのID
output "public_subnet1a_id" {
  description = "パブリックサブネットのID"
  value       = aws_subnet.public_subnet1a.id
}

# パブリックサブネットの名前
output "public_subnet1a_name" {
  description = "パブリックサブネットの名前"
  value       = aws_subnet.public_subnet1a.tags["Name"]
}
