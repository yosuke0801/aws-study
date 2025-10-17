run "waf_basic_info" {
  command = apply

  assert {
    condition     = module.waf.waf_id != null
    error_message = "WAF ID が出力されていません"
  }

  assert {
    condition     = module.waf.waf_name != null
    error_message = "WAF 名が出力されていません"
  }

  assert {
    condition     = module.waf.log_group_id != null
    error_message = "CloudWatch Logs グループ ID が出力されていません"
  }

  assert {
    condition     = module.waf.log_group_name != null
    error_message = "CloudWatch Logs グループ 名が出力されていません"
  }
}
