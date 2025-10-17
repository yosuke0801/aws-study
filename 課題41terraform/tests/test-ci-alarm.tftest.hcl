run "alarm_basic_info" {
  command = plan

  assert {
    condition     = module.cpu_alarm.cwa_name != null
    error_message = "CloudWatch Alarm 名が出力されていません"
  }
}
