# VPC
module "vpc" {
  source   = "./modules/vpc"
  vpc_name = "${var.name_prefix}-vpc"
}

# EC2
module "ec2_instance" {
  source        = "./modules/ec2"
  ec2_name      = "${var.name_prefix}-ec2"
  ami_id        = "ami-07faa35bbd2230d90"
  instance_type = "t3.micro"
  subnet_id     = module.vpc.public_subnet_ids[0]  # AZ1a
  vpc_id        = module.vpc.vpc_id
  key_name      = var.key_name
}

# ALB
module "alb" {
  source              = "./modules/alb"
  alb_name            = "${var.name_prefix}-alb"
  subnet_ids          = module.vpc.public_subnet_ids
  target_instance_ids = [module.ec2_instance.ec2_id]
  vpc_id              = module.vpc.vpc_id
}

# WAF WebACL
module "waf" {
  source   = "./modules/waf_webacl"
  waf_name = "${var.name_prefix}-waf"
  alb_arn  = module.alb.alb_arn
}

# RDS
module "rds" {
  source             = "./modules/rds"
  rds_name           = "${var.name_prefix}-rds"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  ec2_sg_ids         = module.ec2_instance.ec2_sg_ids
  db_username        = var.db_username
  db_password        = var.db_password
  db_name            = var.db_name
}

# CloudWatch Alarm
module "cwa_ec2" {
  source   = "./modules/cloudwatch_alarm"
  cwa_name = "${var.name_prefix}-ec2cpu-alarm"
  ec2_id   = module.ec2_instance.ec2_id
}
