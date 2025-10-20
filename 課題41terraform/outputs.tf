# VPC関連の出力
output "vpc_id" {
  description = "VPCのID"
  value       = module.vpc.vpc_id
}

output "vpc_name" {
  description = "VPCの名前"
  value       = module.vpc.vpc_name
}

output "public_subnet_ids" {
  description = "パブリックサブネットのID"
  value       = module.vpc.public_subnet_ids
}

output "public_subnet_names" {
  description = "パブリックサブネットの名前"
  value       = module.vpc.public_subnet_names
}

output "private_subnet_ids" {
  description = "プライベートサブネットのID"
  value       = module.vpc.private_subnet_ids
}

output "private_subnet_names" {
  description = "プライベートサブネットの名前"
  value       = module.vpc.private_subnet_names
}

output "igw_id" {
  description = "インターネットゲートウェイのID"
  value       = module.vpc.igw_id
}

output "igw_name" {
  description = "インターネットゲートウェイの名前"
  value       = module.vpc.igw_name
}

# EC2関連の出力（複数対応）
output "ec2_id" {
  description = "EC2のID"
  value       = [for m in module.ec2_instance : m.ec2_id]
}

output "ec2_name" {
  description = "EC2の名前"
  value       = [for m in module.ec2_instance : m.ec2_name]
}

output "ec2_sg_ids" {
  description = "EC2セキュリティグループのID"
  value       = flatten([for m in module.ec2_instance : m.ec2_sg_ids])
}

output "ec2_sg_names" {
  description = "EC2セキュリティグループの名前"
  value       = [for m in module.ec2_instance : m.ec2_sg_names]
}

# RDS関係の出力
output "rds_id" {
  description = "RDSのID"
  value       = module.rds.rds_id
}

output "rds_name" {
  description = "RDSの名前"
  value       = module.rds.rds_name
}

# ALB関係の出力
output "alb_id" {
  description = "ALBのID"
  value       = module.alb.alb_id
}

output "alb_name" {
  description = "ALBの名前"
  value       = module.alb.alb_name
}

output "alb_sg_id" {
  description = "ALBセキュリティグループのID"
  value       = module.alb.alb_sg_id
}

output "alb_sg_name" {
  description = "ALBセキュリティグループの名前"
  value       = module.alb.alb_sg_name
}

output "alb_tg_id" {
  description = "ターゲットグループのID"
  value       = module.alb.tg_id
}

output "alb_tg_name" {
  description = "ターゲットグループの名前"
  value       = module.alb.tg_name
}

# Cloudwatch Alarm関係の出力（1台目EC2参照）
output "cwa_ec2_cpu_alarm_id" {
  description = "Cloudwatch AlarmのID"
  value       = module.cpu_alarm.cwa_id
}

output "cwa_ec2_cpu_alarm_name" {
  description = "Cloudwatch Alarmの名前"
  value       = module.cpu_alarm.cwa_name
}

# WAF WebACL関係の出力
output "waf_id" {
  description = "WAF WebACLのID"
  value       = module.waf.waf_id
}

output "waf_name" {
  description = "WAF WebACLの名前"
  value       = module.waf.waf_name
}
