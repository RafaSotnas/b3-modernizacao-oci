terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 5.0"
    }
  }
}

# Exemplo de configuração de Logs via Service Connector Hub
# Aqui o conector envia logs de um log group OCI para um tópico de Notifications

resource "oci_sch_service_connector" "log_to_notifications_connector" {
  compartment_id = var.compartment_id
  display_name   = "log-to-notifications-connector"
  source {
    kind = "logging"
    log_sources {
      compartment_id = var.compartment_id
      log_group_id   = var.log_group_id
    }
  }
  target {
    kind      = "notifications"
    topic_id  = var.notification_topic_id
    enable_formatted_messaging = true
  }
  defined_tags = local.common_tags
}

# Definição de um Alarme de Telemetria (Métrica Default)
resource "oci_monitoring_alarm" "high_cpu_alarm" {
  compartment_id = var.compartment_id
  destinations   = [var.notification_topic_id]
  display_name   = "HighCPUAlarm"
  is_enabled     = true
  metric_compartment_id = var.compartment_id
  namespace      = "oci_computeagent"
  query          = "CpuUtilization[1m].mean() > 80"
  severity       = "CRITICAL"
  defined_tags = local.common_tags
}

# Alarme de Memória (Crucial para Troubleshooting de serviços Java/Node legados)
resource "oci_monitoring_alarm" "high_memory_alarm" {
  compartment_id = var.compartment_id
  destinations   = [var.notification_topic_id]
  display_name   = "HighMemoryAlarm"
  is_enabled     = true
  metric_compartment_id = var.compartment_id
  namespace      = "oci_computeagent" # Requer o Oracle Cloud Agent ativo na instância
  query          = "MemoryUtilization[1m].mean() > 85"
  severity       = "CRITICAL"
  defined_tags = local.common_tags
}