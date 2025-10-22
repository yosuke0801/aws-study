# VPC 名前
output "vpc_name" {
  description = "VPCの名前"
  value       = aws_vpc.vpc.tags["Name"]
}

# VPC ID
output "vpc_id" {
  description = "VPCのID"
  value       = aws_vpc.vpc.id
}

# パブリックサブネットID
output "public_subnet_ids" {
  description = "作成したパブリックサブネットのID一覧"
  value       = [aws_subnet.public_subnet_1a.id, aws_subnet.public_subnet_1c.id]
}

# プライベートサブネットID
output "private_subnet_ids" {
  description = "作成したプライベートサブネットのID一覧"
  value       = [aws_subnet.private_subnet_1a.id, aws_subnet.private_subnet_1c.id]
}

# インターネットゲートウェイID
output "igw_id" {
  description = "インターネットゲートウェイのID"
  value       = aws_internet_gateway.igw.id
}

# パブリックルートテーブルID
output "public_route_table_id" {
  description = "作成したパブリックルートテーブルのID"
  value       = aws_route_table.public_rt.id
}

# プライベートルートテーブルID
output "private_route_table_id" {
  description = "作成したプライベートルートテーブルのID"
  value       = aws_route_table.private_rt.id
}
