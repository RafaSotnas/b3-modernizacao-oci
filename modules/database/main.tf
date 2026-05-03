resource "oci_database_autonomous_database" "balcao_db" {
  compartment_id           = var.compartment_id
  db_name                  = var.db_name
  admin_password           = var.admin_password
  display_name             = var.display_name
  workload_type            = var.workload_type
  cpu_core_count           = var.cpu_core_count
  storage_size_in_gbs      = var.storage_size_in_gbs
  is_free_tier             = var.is_free_tier
  is_mtls_connection_required = var.is_mtls_connection_required
  license_model            = var.license_model

  # Acesso via VPN/Bastion (Segurança)
  is_data_guard_enabled    = var.is_data_guard_enabled
  is_backup_based_recovery_excluded = false

  # Habilita backups automáticos
  backup_retention_period_in_days = var.backup_retention_days

  # Subnet privada - Segurança
  subnet_id = var.subnet_id
  nsg_ids   = var.nsg_ids

  # FinOps
  defined_tags = {
    "Operations.CostCenter" = var.cost_center
    "Operations.Project"    = "Balcao-B3-Modernizacao"
  }

  freeform_tags = {
    "Environment" = var.environment
    "ManagedBy"   = "Terraform"
  }
}
