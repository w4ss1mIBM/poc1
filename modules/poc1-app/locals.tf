locals {
  topic_name_ec2_resource_utilization = "EC2-Resource-Utilization"
  emails                              = ["example1@example.com", "example2@example.com"]
  web_server_tag_name                 = "MyWebServer"
  cpu_alarm_name                      = "CPUAlarm"
  cpu_utilization_threshold           = 65
  ec2_state_change_rule_name          = "EC2StateChange"
  topic_name_ec2_stat_change          = "EC2-State-Change"
  disk_alarm_name                     = "DiskSpaceAlarm"
  logical_disk_free_space_threshold   = 20
  memory_alarm_name                   = "MemoryUsageAlarm"
  memory_utilization_threshold        = 80
}
