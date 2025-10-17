run "alb_basic_info" {
  command = plan

  assert {
    condition     = module.alb.alb_name != null
    error_message = "ALB 名が出力されていません"
  }
}
