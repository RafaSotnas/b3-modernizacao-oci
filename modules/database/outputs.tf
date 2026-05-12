output "autonomous_database_id" {
  description = "OCID do Autonomous Database"
  value       = oci_database_autonomous_database.this.id
}

output "autonomous_database_name" {
  description = "Nome do Autonomous Database"
  value       = oci_database_autonomous_database.this.db_name
}

output "autonomous_database_admin_username" {
  description = "Usuário admin do Autonomous Database"
  value       = oci_database_autonomous_database.this.admin_username
}

output "autonomous_database_status" {
  description = "Status do Autonomous Database"
  value       = oci_database_autonomous_database.this.state
}