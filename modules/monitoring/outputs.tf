output "connector_id" {
  description = "OCID do service connector para envio de logs"
  value       = oci_sch_service_connector.log_to_notifications_connector.id
}

output "alarm_id" {
  description = "OCID do alarme de monitoramento de CPU"
  value       = oci_monitoring_alarm.high_cpu_alarm.id
}