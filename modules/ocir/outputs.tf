output "repository_name" {
  description = "Nome do repositório OCIR criado"
  value       = var.repository_name
}

output "repository_id" {
  description = "OCID do repositório OCIR"
  value       = oci_artifacts_container_repository.this.id
}
