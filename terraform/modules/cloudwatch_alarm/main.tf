# modules/ec2/alarm.tf
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "${var.cwa_name}-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "EC2 CPU使用率が70%を超えた場合にアラーム"

  dimensions = {
    InstanceId = var.ec2_id
  }
}
