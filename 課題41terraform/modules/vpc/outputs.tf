# VPCのID
output "vpc_id" {
  description = "VPCのID"
  value       = aws_vpc.vpc.id
}

# VPCの名前
output "vpc_name" {
  description = "VPCの名前"
  value       = aws_vpc.vpc.tags["Name"]
}

# パブリックサブネット
output "public_subnet_ids" {
  description = "パブリックサブネットのID"
  value = [
    aws_subnet.public_subnet1a.id,
    aws_subnet.public_subnet1c.id
  ]
}

output "public_subnet_names" {
  description = "パブリックサブネットの名前"
  value = [
    aws_subnet.public_subnet1a.tags["Name"],
    aws_subnet.public_subnet1c.tags["Name"]
  ]
}

# プライベートサブネット
output "private_subnet_ids" {
  description = "プライベートサブネットのID"
  value = [
    aws_subnet.private_subnet1a.id,
    aws_subnet.private_subnet1c.id
  ]
}

output "private_subnet_names" {
  description = "プライベートサブネットの名前"
  value = [
    aws_subnet.private_subnet1a.tags["Name"],
    aws_subnet.private_subnet1c.tags["Name"]
  ]
}

# インターネットゲートウェイ
output "igw_id" {
  description = "インターネットゲートウェイのID"
  value       = aws_internet_gateway.igw.id
}

output "igw_name" {
  description = "インターネットゲートウェイの名前"
  value       = aws_internet_gateway.igw.tags["Name"]
}
