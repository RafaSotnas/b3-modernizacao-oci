output "cluster_id" {
  description = "OCID do cluster OKE vindo do módulo"
  value       = module.oke_dev.cluster_id
}

output "container_repository_name" {
  description = "Nome do repositório de imagens"
  value       = module.ocir_dev.repository_name
}