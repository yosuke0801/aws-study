run "ec2_basic_info" {
  command = plan

  assert {
    condition     = module.ec2_instance.ec2_name == "tf-aws-study-ec2"
    error_message = "EC2名が期待値と一致しません"
  }

  assert {
    condition     = module.ec2_instance.ec2_instance_type == "t3.micro"
    error_message = "EC2インスタンスタイプが期待値と一致しません"
  }
}
