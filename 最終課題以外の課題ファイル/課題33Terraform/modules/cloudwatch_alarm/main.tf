# CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = var.cwa_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.period
  statistic           = var.statistic
  threshold           = var.threshold
  alarm_description   = "This metric monitors EC2 CPU utilization"
  dimensions = {
    InstanceId = var.ec2_instance_id
  }
}
