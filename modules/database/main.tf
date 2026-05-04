# B3 Modernização OCI - Infraestrutura como Código
resource "oci_database_autonomous_database" "this" {
  admin_password              = var.admin_password
  compartment_id              = var.compartment_id
  cpu_core_count              = var.cpu_core_count
  db_name                     = var.db_name
  db_version                  = "19c" # Versão padrão para Autonomous Database
  display_name                = var.display_name
  is_auto_scaling_enabled     = true
  is_data_guard_enabled       = var.is_data_guard_enabled
  is_free_tier                = var.is_free_tier
  is_mtls_connection_required = var.is_mtls_connection_required
  license_model               = var.license_model
  storage_size_in_gbs         = var.storage_size_in_gbs

  # Configuração de rede privada
  subnet_id = var.subnet_id
  nsg_ids   = var.nsg_ids

  # Tags para FinOps
  defined_tags = {
    "Operations.CostCenter" = var.cost_center
    "Operations.Project"    = "Balcao-B3-Modernizacao"
    "Environment"           = var.environment
  }

  # Configurações de backup
  backup_config {
    auto_backup_enabled = true
    retention_period_in_days = var.backup_retention_days
  }
}