resource "oci_artifacts_container_repository" "this" {
  compartment_id = var.compartment_id
  display_name   = var.repository_name
  is_public      = false
  is_immutable   = false

  defined_tags = {
    "Operations.CostCenter" = var.cost_center
    "Operations.Project"    = "Balcao-B3-Modernizacao"
  }
}
