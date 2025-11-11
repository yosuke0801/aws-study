# VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

# パブリックサブネット1a/1c
resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-public1a"
  }
}

resource "aws_subnet" "public_subnet_1c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-public-1c"
  }
}

# プライベートサブネット1a/1c
resource "aws_subnet" "private_subnet_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "${var.vpc_name}-private-1a"
  }
}

resource "aws_subnet" "private_subnet_1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "${var.vpc_name}-private-1c"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

# パブリックルートテーブル
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name}-public_rt"
  }
}

# IGW向けルート
resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# パブリックサブネットとルートテーブルを関連付け
resource "aws_route_table_association" "public_assoc_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_assoc_1c" {
  subnet_id      = aws_subnet.public_subnet_1c.id
  route_table_id = aws_route_table.public_rt.id
}

# プライベートルートテーブル
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name}-private_rt"
  }
}

# プライベートサブネットとルートテーブルを関連付け
resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_assoc_c" {
  subnet_id      = aws_subnet.private_subnet_1c.id
  route_table_id = aws_route_table.private_rt.id
}
