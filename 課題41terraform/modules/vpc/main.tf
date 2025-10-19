# VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags       = var.tags
}

# パブリックサブネット1a
resource "aws_subnet" "public_subnet1a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${var.vpc_name}-public-1a"
  }
}
