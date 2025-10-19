run "vpc_basic_info_ci" {
  command = plan

  assert {
    condition     = module.vpc.vpc_name == "tf-aws-study-vpc"
    error_message = "VPC名が期待値と一致しません"
  }
}

run "ec2_basic_info" {
  command = plan

  assert {
    condition     = module.ec2_instance.ec2_name == "tf-aws-study-ec2"
    error_message = "EC2名が期待値と一致しません"
  }
}
