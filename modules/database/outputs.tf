output "autonomous_database_id" {
  description = "OCID do Autonomous Database"
  value       = oci_database_autonomous_database.balcao_db.id
}

output "autonomous_database_name" {
  description = "Nome do Autonomous Database"
  value       = oci_database_autonomous_database.balcao_db.db_name
}

output "autonomous_database_admin_username" {
  description = "Nome de usuário admin do banco de dados"
  value       = "admin"
}

output "autonomous_database_status" {
  description = "Status do Autonomous Database"
  value       = oci_database_autonomous_database.balcao_db.lifecycle_state
}

output "autonomous_database_high_connection_string" {
  description = "Connection string HIGH do banco de dados"
  value       = try(oci_database_autonomous_database.balcao_db.connection_strings[0].high_connection_string, "N/A")
  sensitive   = true
}
