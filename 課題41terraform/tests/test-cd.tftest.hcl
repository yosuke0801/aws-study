variable "key_name" {}
variable "rds_password" {}
variable "allowed_ssh_cidr" {}

run "alarm_basic_info" {
  variables = {
    key_name        = var.key_name
    rds_password    = var.rds_password
    allowed_ssh_cidr = var.allowed_ssh_cidr
  }

  command = apply

  assert {
    condition     = module.cpu_alarm.cwa_id != null
    error_message = "CloudWatch Alarm ID が出力されていません"
  }

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

run "ec2_basic_info" {
  variables = {
    key_name        = var.key_name
    rds_password    = var.rds_password
    allowed_ssh_cidr = var.allowed_ssh_cidr
  }

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

run "rds_basic_info" {
  variables = {
    key_name        = var.key_name
    rds_password    = var.rds_password
    allowed_ssh_cidr = var.allowed_ssh_cidr
  }

  command = apply

  assert {
    condition     = module.rds.rds_id != null
    error_message = "RDS ID が出力されていません"
  }

  assert {
    condition     = module.rds.rds_name == "tfawsstudyrds"
    error_message = "RDS名が期待値と一致しません"
  }

  assert {
    condition     = module.rds.instance_class == "db.t3.micro"
    error_message = "インスタンスタイプが期待値と一致しません"
  }
}

run "vpc_basic_info_cd" {
  variables = {
    key_name        = var.key_name
    rds_password    = var.rds_password
    allowed_ssh_cidr = var.allowed_ssh_cidr
  }

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

run "waf_basic_info" {
  variables = {
    key_name        = var.key_name
    rds_password    = var.rds_password
    allowed_ssh_cidr = var.allowed_ssh_cidr
  }

  command = apply

  assert {
    condition     = module.waf.waf_id != null
    error_message = "WAF ID が出力されていません"
  }

  assert {
    condition     = module.waf.waf_name != null
    error_message = "WAF 名が出力されていません"
  }

  assert {
    condition     = module.waf.log_group_id != null
    error_message = "CloudWatch Logs グループ ID が出力されていません"
  }

  assert {
    condition     = module.waf.log_group_name != null
    error_message = "CloudWatch Logs グループ 名が出力されていません"
  }
}
