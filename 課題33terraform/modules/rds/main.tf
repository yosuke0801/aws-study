# RDS
resource "aws_db_instance" "rds" {
  identifier                  = var.rds_name
  engine                      = var.engine
  engine_version              = var.engine_version
  instance_class              = var.instance_class
  allocated_storage           = var.allocated_storage
  db_name                     = var.db_name
  username                    = var.username
  password                    = var.rds_password
  availability_zone           = var.availability_zones[0]
  multi_az                    = var.multi_az
  publicly_accessible         = var.publicly_accessible
  storage_type                = var.storage_type
  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  deletion_protection         = var.deletion_protection
  skip_final_snapshot         = var.skip_final_snapshot
  db_subnet_group_name        = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids      = [aws_security_group.rds_sg.id]
  tags                        = var.tags
}

# RDSセキュリティグループ
resource "aws_security_group" "rds_sg" {
  name        = "${var.rds_name}-sg"
  description = "Allow MySQL access only from EC2"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.ec2_sg_id]
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

# DBサブネットグループ
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.rds_name}-subnet-group"
  subnet_ids = var.private_subnet_ids
  tags       = var.tags
}
