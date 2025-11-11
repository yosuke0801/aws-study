# RDS用サブネットグループ
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.rds_name}-subnet"
  subnet_ids = var.private_subnet_ids
  tags = {
    Name = "${var.rds_name}-subnet"
  }
}

# RDS用セキュリティグループ
resource "aws_security_group" "rds_sg" {
  name        = "${var.rds_name}-sg"
  description = "RDS access"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = var.ec2_sg_ids
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.rds_name}-sg"
  }
}

# RDSインスタンス
resource "aws_db_instance" "rds" {
  identifier             = var.rds_name
  engine                 = "mysql"
  engine_version         = "8.0.42"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  publicly_accessible    = false
  skip_final_snapshot    = true
  multi_az               = false
  availability_zone      = "ap-northeast-1a"


  tags = {
    Name = var.rds_name
  }
}
