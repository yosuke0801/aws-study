run "waf_basic_info" {
  command = plan

  assert {
    condition     = module.waf.waf_name != null
    error_message = "WAF 名が出力されていません"
  }

  assert {
    condition     = module.waf.log_group_name != null
    error_message = "CloudWatch Logs グループ 名が出力されていません"
  }
}
