output "cluster_id" {
  description = "OCID do cluster OKE vindo do módulo"
  value       = module.oke_dev.cluster_id
}

output "container_repository_name" {
  description = "Nome do repositório de imagens"
  value       = module.ocir_dev.repository_name
}

output "container_repository_id" {
  description = "OCID do repositório de imagens OCIR"
  value       = module.ocir_dev.repository_id
}

output "database_id" {
  description = "OCID do Autonomous Database"
  value       = module.database_dev.autonomous_database_id
}

output "database_name" {
  description = "Nome do Autonomous Database"
  value       = module.database_dev.autonomous_database_name
}

output "database_admin_username" {
  description = "Usuário admin do banco de dados"
  value       = module.database_dev.autonomous_database_admin_username
}

output "database_status" {
  description = "Status do Autonomous Database"
  value       = module.database_dev.autonomous_database_status
}