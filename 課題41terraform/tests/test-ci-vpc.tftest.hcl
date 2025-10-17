run "vpc_basic_info_ci" {
  command = plan

  assert {
    condition     = module.vpc.vpc_name == "tf-aws-study-vpc"
    error_message = "VPC名が期待値と一致しません"
  }
}
