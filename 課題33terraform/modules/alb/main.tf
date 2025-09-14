# ALB
resource "aws_lb" "alb" {
  name               = var.alb_name
  load_balancer_type = "application"
  internal           = var.internal
  ip_address_type    = "ipv4"
  subnets            = var.subnets
  security_groups    = [aws_security_group.alb_sg.id]
  tags               = var.tags
}

# セキュリティグループ（ALB）
resource "aws_security_group" "alb_sg" {
  name        = "${var.alb_name}-sg"
  description = "Allow HTTP traffic to ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.listener_port
    to_port     = var.listener_port
    protocol    = "tcp"
    cidr_blocks = [var.allowed_alb_cidr]
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
  name             = "${var.alb_name}-tg"
  port             = var.target_port
  protocol         = "HTTP"
  vpc_id           = var.vpc_id
  protocol_version = "HTTP1"

  health_check {
    protocol            = "HTTP"
    path                = var.health_check_path
    port                = "traffic-port"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = "200,300,301"
  }

  tags = var.tags
}

# リスナー
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.listener_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}
