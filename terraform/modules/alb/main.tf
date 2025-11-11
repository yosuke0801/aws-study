# ALB
resource "aws_lb" "alb" {
  name                       = var.alb_name
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb_sg.id]
  subnets                    = var.subnet_ids
  enable_deletion_protection = false
  tags = {
    Name = var.alb_name
  }
}

# セキュリティグループ（ALB）
resource "aws_security_group" "alb_sg" {
  name        = "${var.alb_name}-sg"
  description = "Allow HTTP traffic to ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.alb_name}-sg"
  }
}

# ターゲットグループ
resource "aws_lb_target_group" "alb_tg" {
  name     = "${var.alb_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200,300,301"
  }

  tags = {
    Name = "${var.alb_name}-tg"
  }
}

# ターゲットグループ（EC2にアタッチメント）
resource "aws_lb_target_group_attachment" "tg_attachment" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = var.target_instance_ids[0]
  port             = 80
}

# リスナー
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}
