run "alb_basic_info" {
  command = apply

  assert {
    condition     = module.alb.alb_id != null
    error_message = "ALB ID が出力されていません"
  }

  assert {
    condition     = module.alb.alb_name != null
    error_message = "ALB 名が出力されていません"
  }

  assert {
    condition     = module.alb.alb_sg_id != null
    error_message = "ALB セキュリティグループ ID が出力されていません"
  }

  assert {
    condition     = module.alb.tg_id != null
    error_message = "ターゲットグループ ID が出力されていません"
  }
}
