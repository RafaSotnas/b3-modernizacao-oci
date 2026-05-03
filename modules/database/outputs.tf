output "autonomous_database_id" {
  description = "OCID do Autonomous Database"
  value       = oci_database_autonomous_database.balcao_db.id
}

output "autonomous_database_name" {
  description = "Nome do Autonomous Database"
  value       = oci_database_autonomous_database.balcao_db.db_name
}

output "autonomous_database_connection_strings" {
  description = "Connection strings do banco de dados"
  value       = oci_database_autonomous_db_connection_string.balcao_db_connection.connection_strings
  sensitive   = true
}

output "autonomous_database_admin_username" {
  description = "Nome de usuário admin do banco de dados"
  value       = "admin"
}

output "autonomous_database_service_console_url" {
  description = "URL do console do banco de dados"
  value       = "https://cloud.oracle.com/dbcs"
}

output "backup_id" {
  description = "OCID do backup automatizado"
  value       = oci_database_autonomous_database_backup.balcao_db_backup.id
}

output "autonomous_database_status" {
  description = "Status do Autonomous Database"
  value       = oci_database_autonomous_database.balcao_db.lifecycle_state
}
