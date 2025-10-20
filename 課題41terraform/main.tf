# VPC
module "vpc" {
  source             = "./modules/vpc"
  vpc_name           = "${var.name_prefix}-vpc"
  vpc_cidr           = "10.0.0.0/16"
  availability_zones = ["ap-northeast-1a", "ap-northeast-1c"]
  tags = {
    Name = "${var.name_prefix}-vpc"
  }
}

# EC2
module "ec2_instance" {
  source           = "./modules/ec2"
  ec2_name         = "${var.name_prefix}-ec2"
  ami_id           = var.ami_id
  instance_type    = "t3.micro"
  key_name         = var.key_name
  allowed_ssh_cidr = var.allowed_ssh_cidr
  subnet_id        = module.vpc.public_subnet_ids[0]
  vpc_id           = module.vpc.vpc_id
  alb_sg_id        = module.alb.alb_sg_id
  tags = {
    Name = "${var.name_prefix}-ec2"
  }
}

# RDS
module "rds" {
  source                    = "./modules/rds"
  rds_name                  = "${var.name_prefix}-rds"
  vpc_id                    = module.vpc.vpc_id
  private_subnet_ids        = module.vpc.private_subnet_ids
  ec2_sg_id                 = module.ec2_instance.ec2_sg_ids[0]
  username                  = "root"
  rds_password              = var.rds_password
  availability_zones        = ["ap-northeast-1a", "ap-northeast-1c"]
  allocated_storage         = 20
  db_name                   = "tfawsstudyrds"
  instance_class            = "db.t3.micro"
  multi_az                  = false
  publicly_accessible       = false
  deletion_protection       = false
  skip_final_snapshot       = true
  final_snapshot_identifier = "tfawsstudydb-final-snapshot"
  tags = {
    Name = "${var.name_prefix}-rds"
  }
}

# ALB
module "alb" {
  source            = "./modules/alb"
  alb_name          = "${var.name_prefix}-alb"
  internal          = false
  subnets           = module.vpc.public_subnet_ids
  vpc_id            = module.vpc.vpc_id
  target_port       = 8080
  listener_port     = 80
  health_check_path = "/"
  tags = {
    Name = "${var.name_prefix}-alb"
  }
}

resource "aws_lb_target_group_attachment" "alb_tg_attachment" {
  target_group_arn = module.alb.alb_tg_arn      # ALBモジュールの出力を参照
  target_id        = module.ec2_instance.ec2_id # EC2モジュールの出力を参照
  port             = 8080                       # EC2 のターゲットポート
}

# Cloudwatch Alarm
module "cpu_alarm" {
  source             = "./modules/cloudwatch_alarm"
  cwa_name           = "${var.name_prefix}-ec2cpu-alarm"
  ec2_instance_id    = module.ec2_instance.ec2_id
  threshold          = 5
  evaluation_periods = 1
  period             = 60
  statistic          = "Average"
}

# WAF WebACL
module "waf" {
  source   = "./modules/waf_webacl"
  waf_name = "${var.name_prefix}-wafwebacl"
  alb_arn  = module.alb.alb_arn
  tags = {
    Name = "${var.name_prefix}-wafwebacl"
  }
}

module "ec2_test_2" {
  source        = "./modules/ec2"
  ec2_name      = "tf-test-ec2-2"
  ami_id        = var.ami_id
  instance_type = "t3.micro"
  key_name      = "dummy"          # dummyでも作れる
  alb_sg_id     = "dummy"          # dummyでも作れる
  subnet_id     = module.vpc.public_subnet_ids[0]
  vpc_id        = module.vpc.vpc_id
  tags = {
    Name = "tf-test-ec2-2"
  }
}