run "ec2_basic_info" {
  command = apply

  assert {
    condition     = module.ec2_instance.ec2_id != null
    error_message = "EC2 ID が出力されていません"
  }

  assert {
    condition     = module.ec2_instance.ec2_name == "tf-aws-study-ec2"
    error_message = "EC2名が期待値と一致しません"
  }

  assert {
    condition     = module.ec2_instance.ec2_instance_type == "t3.micro"
    error_message = "EC2インスタンスタイプが期待値と一致しません"
  }
}
