# WAF WebACL
resource "aws_wafv2_web_acl" "waf" {
  name        = var.waf_name
  description = "WAF for ALB"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  rule {
    name     = "AWSManagedRulesCommonRuleSet"
    priority = 1

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        vendor_name = "AWS"
        name        = "AWSManagedRulesCommonRuleSet"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesCommonRuleSet"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = var.waf_name
    sampled_requests_enabled   = true
  }

  tags = {
    Name = var.waf_name
  }
}

# ALBに関連付け
resource "aws_wafv2_web_acl_association" "waf_alb_association" {
  resource_arn = var.alb_arn
  web_acl_arn  = aws_wafv2_web_acl.waf.arn
}

# CloudWatch Logs
resource "aws_cloudwatch_log_group" "cwlogs" {
  name              = "aws-waf-logs-${var.waf_name}"
  retention_in_days = var.log_retention
}

# WebACLのログ記録
resource "aws_wafv2_web_acl_logging_configuration" "wafwebacllogging" {
  log_destination_configs = [aws_cloudwatch_log_group.cwlogs.arn]
  resource_arn            = aws_wafv2_web_acl.waf.arn
}
