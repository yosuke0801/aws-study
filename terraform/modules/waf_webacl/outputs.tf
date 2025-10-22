# WAFの名前
output "waf_name" {
  description = "WAFの名前"
  value       = aws_wafv2_web_acl.waf.name
}

# WAFのID
output "waf_id" {
  description = "WAFのID"
  value       = aws_wafv2_web_acl.waf.id
}
