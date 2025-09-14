# ALBのID
output "alb_id" {
  description = "ALBのID"
  value       = aws_lb.alb.id
}

# ALBのARN
output "alb_arn" {
  description = "ALBのARN"
  value       = aws_lb.alb.arn
}

# ALBの名前
output "alb_name" {
  description = "ALBの名前"
  value       = aws_lb.alb.name
}

# ALBセキュリティグループのID
output "alb_sg_id" {
  description = "ALBセキュリティグループのID"
  value       = aws_security_group.alb_sg.id
}

# ALBセキュリティグループの名前
output "alb_sg_name" {
  description = "ALBセキュリティグループの名前"
  value       = aws_security_group.alb_sg.name
}

# ターゲットグループのID
output "tg_id" {
  description = "ターゲットグループのID"
  value       = aws_lb_target_group.alb_tg.id
}

# ターゲットグループの名前
output "tg_name" {
  description = "ターゲットグループの名前"
  value       = aws_lb_target_group.alb_tg.name
}

output "alb_tg_arn" {
  value = aws_lb_target_group.alb_tg.arn
}