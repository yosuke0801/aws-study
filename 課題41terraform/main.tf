# VPC
module "vpc" {
  source   = "./modules/vpc"
  vpc_name = "${var.name_prefix}-vpc"
  vpc_cidr = "10.0.0.0/16"
}

# EC2
module "ec2_instance" {
  source        = "./modules/ec2"
  ec2_name      = "${var.name_prefix}-ec2"
  ami_id        = var.ami_id
  instance_type = "t3.micro"
  subnet_id     = module.vpc.public_subnet1a_id
  vpc_id        = module.vpc.vpc_id
}
