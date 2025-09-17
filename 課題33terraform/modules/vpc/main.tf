# VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = var.tags
}

# パブリックサブネット1a
resource "aws_subnet" "public_subnet1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-1a"
  }
}

# パブリックサブネット1c
resource "aws_subnet" "public_subnet1c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-1c"
  }
}

# プライベートサブネット1a
resource "aws_subnet" "private_subnet1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.vpc_name}-private-1a"
  }
}

# プライベートサブネット1c
resource "aws_subnet" "private_subnet1c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.vpc_name}-private-1c"
  }
}

# インターネットゲートウェイ
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

# パブリックルートテーブル
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public_rt"
  }
}

# プライベートルートテーブル
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.vpc_name}-private_rt"
  }
}

# パブリックサブネットにルートテーブルを関連付け
resource "aws_route_table_association" "public_subnet1a" {
  subnet_id      = aws_subnet.public_subnet1a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet1c" {
  subnet_id      = aws_subnet.public_subnet1c.id
  route_table_id = aws_route_table.public_rt.id
}

# プライベートサブネットにルートテーブルを関連付け
resource "aws_route_table_association" "private_subnet1a" {
  subnet_id      = aws_subnet.private_subnet1a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_subnet1c" {
  subnet_id      = aws_subnet.private_subnet1c.id
  route_table_id = aws_route_table.private_rt.id
}
