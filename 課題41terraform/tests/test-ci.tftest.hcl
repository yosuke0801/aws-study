variable "key_name" {}
variable "rds_password" {}
variable "allowed_ssh_cidr" {}

run "alarm_basic_info" {
  variables = {
    key_name        = var.key_name
    rds_password    = var.rds_password
    allowed_ssh_cidr = var.allowed_ssh_cidr
  }

  command = plan

  assert {
    condition     = module.cpu_alarm.cwa_name != null
    error_message = "CloudWatch Alarm 名が出力されていません"
  }
}

run "alb_basic_info" {
  variables = {
    key_name        = var.key_name
    rds_password    = var.rds_password
    allowed_ssh_cidr = var.allowed_ssh_cidr
  }

  command = plan

  assert {
    condition     = module.alb.alb_name != null
    error_message = "ALB 名が出力されていません"
  }
}

run "ec2_basic_info" {
  variables = {
    key_name        = var.key_name
    rds_password    = var.rds_password
    allowed_ssh_cidr = var.allowed_ssh_cidr
  }

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

run "rds_basic_info" {
  variables = {
    key_name        = var.key_name
    rds_password    = var.rds_password
    allowed_ssh_cidr = var.allowed_ssh_cidr
  }

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

run "vpc_basic_info_ci" {
  variables = {
    key_name        = var.key_name
    rds_password    = var.rds_password
    allowed_ssh_cidr = var.allowed_ssh_cidr
  }

  command = plan

  assert {
    condition     = module.vpc.vpc_name == "tf-aws-study-vpc"
    error_message = "VPC名が期待値と一致しません"
  }
}

run "waf_basic_info" {
  variables = {
    key_name        = var.key_name
    rds_password    = var.rds_password
    allowed_ssh_cidr = var.allowed_ssh_cidr
  }

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
