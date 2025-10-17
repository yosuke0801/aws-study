run "vpc_basic_info_cd" {
  command = apply

  assert {
    condition     = module.vpc.vpc_name == "tf-aws-study-vpc"
    error_message = "VPC名が期待値と一致しません"
  }

  assert {
    condition     = module.vpc.vpc_id != null
    error_message = "VPC ID が出力されていません"
  }
}
