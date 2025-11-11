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

run "alb_basic_info" {
  command = plan

  assert {
    condition     = module.alb.alb_name == "tf-aws-study-alb"
    error_message = "ALB 名が期待値と一致しません"
  }
}

run "waf_basic_info" {
  command = plan

  assert {
    condition     = module.waf.waf_name == "tf-aws-study-waf"
    error_message = "WAF 名が期待値と一致しません"
  }
}

run "rds_basic_info" {
  command = plan

  assert {
    condition     = module.rds.rds_name == "tf-aws-study-rds"
    error_message = "RDS名が期待値と一致しません"
  }
}

run "cloudwatch_alarm_basic_info" {
  command = plan

  assert {
    condition     = module.cwa_ec2.cwa_name == "tf-aws-study-ec2cpu-alarm"
    error_message = "CloudWatch Alarm 名が期待値と一致しません"
  }
}
