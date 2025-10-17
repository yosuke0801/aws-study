run "rds_basic_info" {
  command = plan

  assert {
    condition     = module.rds.rds_name == "tfawsstudyrds"
    error_message = "RDS名が期待値と一致しません"
  }

  assert {
    condition     = module.rds.instance_class == "db.t3.micro"
    error_message = "インスタンスタイプが期待値と一致しません"
  }
}
