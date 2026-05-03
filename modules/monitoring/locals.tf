locals {
  common_tags = {
    "Operations.CostCenter" = var.cost_center
    "Operations.Project"    = "Balcao-B3-Modernizacao"
    "Environment" = var.environment
    "ManagedBy"   = "Terraform"
  }
}