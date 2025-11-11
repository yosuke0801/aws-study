# VPC関連の出力
output "vpc_name" {
  description = "VPCの名前"
  value       = module.vpc.vpc_name
}

output "vpc_id" {
  description = "VPCのID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "パブリックサブネットのID"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "プライベートサブネットのID"
  value       = module.vpc.private_subnet_ids
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

# ALB関係の出力
output "alb_name" {
  description = "ALBの名前"
  value       = module.alb.alb_name
}

output "alb_arn" {
  description = "ALBのARN"
  value       = module.alb.alb_arn
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

# WAF WebACL関係の出力
output "waf_name" {
  description = "WAF WebACLの名前"
  value       = module.waf.waf_name
}

output "waf_id" {
  description = "WAF WebACLのID"
  value       = module.waf.waf_id
}

# EC2のパブリックIP
output "ec2_public_ip" {
  description = "EC2のパブリックIP"
  value       = module.ec2_instance.ec2_public_ip
}
