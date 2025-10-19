# VPC関連の出力
output "vpc_name" {
  description = "VPCの名前"
  value       = module.vpc.vpc_name
}

output "vpc_id" {
  description = "VPCのID"
  value       = module.vpc.vpc_id
}

output "public_subnet1a_name" {
  description = "パブリックサブネットの名前"
  value       = module.vpc.public_subnet1a_name
}

output "public_subnet_id" {
  description = "パブリックサブネットのID"
  value       = module.vpc.public_subnet1a_id
}

# EC2関連の出力
output "ec2_name" {
  description = "EC2の名前"
  value       = module.ec2_instance.ec2_name
}

output "ec2_id" {
  description = "EC2のID"
  value       = module.ec2_instance.ec2_id
}

output "ec2_sg_names" {
  description = "EC2セキュリティグループの名前"
  value       = module.ec2_instance.ec2_sg_names
}

output "ec2_sg_ids" {
  description = "EC2セキュリティグループのID"
  value       = module.ec2_instance.ec2_sg_ids
}
