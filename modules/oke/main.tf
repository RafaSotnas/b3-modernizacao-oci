terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 5.0"
    }
  }
}

resource "oci_containerengine_cluster" "b3_cluster" {
  compartment_id = var.compartment_id

  endpoint_config {
    is_public_ip_enabled = false
    subnet_id            = var.endpoint_subnet_id
  }

  kubernetes_version = var.kubernetes_version
  name               = "oke-balcao-modernizacao"
  vcn_id             = var.vcn_id

  options {
    service_lb_subnet_ids = [var.lb_subnet_id]
  }

  defined_tags = {
    "Operations.CostCenter" = var.cost_center
    "Operations.Project"    = "Balcao-B3-Modernizacao"
  }
}

resource "oci_containerengine_node_pool" "b3_node_pool" {
  cluster_id         = oci_containerengine_cluster.b3_cluster.id
  compartment_id     = var.compartment_id
  kubernetes_version = var.kubernetes_version
  name               = "node-pool-balcao"
  node_shape         = var.node_shape

  node_config_details {
    placement_configs {
      availability_domain = var.availability_domain
      subnet_id           = var.node_subnet_id
    }
    size = var.node_pool_size
  }

  node_shape_config {
    memory_in_gbs = var.node_memory_in_gbs
    ocpus         = var.node_ocpus
  }
}