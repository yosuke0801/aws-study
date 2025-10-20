# CloudWatch AlarmのID
output "cwa_id" {
  description = "CloudWatch AlarmのID"
  value       = aws_cloudwatch_metric_alarm.cpu_alarm.id
}

# CloudWatch Alarmの名前
output "cwa_name" {
  description = "CloudWatch Alarmの名前"
  value       = aws_cloudwatch_metric_alarm.cpu_alarm.alarm_name
}
