run "alarm_basic_info" {
  command = apply

  assert {
    condition     = module.cpu_alarm.cwa_id != null
    error_message = "CloudWatch Alarm ID が出力されていません"
  }

  assert {
    condition     = module.cpu_alarm.cwa_name != null
    error_message = "CloudWatch Alarm 名が出力されていません"
  }
}
