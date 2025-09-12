# WAF WebACLのID
output "waf_id" {
  description = "WAF WebACLのID"
  value       = aws_wafv2_web_acl.wafwebacl.id
}

# WAF WebACLの名前
output "waf_name" {
  description = "WAF WebACLの名前"
  value       = aws_wafv2_web_acl.wafwebacl.name
}

# CloudWatch Logsグループの名前
output "log_group_name" {
  description = "CloudWatch Logsグループの名前"
  value       = aws_cloudwatch_log_group.cwlogs.name
}

# CloudWatch LogsグループのID
output "log_group_id" {
  description = "CloudWatch LogsグループのID"
  value       = aws_cloudwatch_log_group.cwlogs
}
