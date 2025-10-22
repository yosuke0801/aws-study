# ALBの名前
output "alb_name" {
  description = "ALBの名前"
  value       = aws_lb.alb.name
}

# ALBのID
output "alb_id" {
  description = "ALBのID"
  value       = aws_lb.alb.id
}

# ALBのDNS名
output "alb_dns_name" {
  description = "ALBのDNS名（アクセス用URL）"
  value       = aws_lb.alb.dns_name
}

# ALBのARM
output "alb_arn" {
  description = "ALBのARN"
  value       = aws_lb.alb.arn
}

# ALBセキュリティグループのID
output "alb_sg_id" {
  description = "ALBセキュリティグループのID"
  value       = aws_security_group.alb_sg.id
}

# ターゲットグループのID
output "tg_id" {
  description = "ターゲットグループのID"
  value       = aws_lb_target_group.alb_tg.id
}

# ALBリスナーのID
output "alb_listener_id" {
  description = "ALBリスナーのID"
  value       = aws_lb_listener.front_end.id
}
