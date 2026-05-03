output "cluster_id" {
  description = "OCID do cluster OKE"
  value       = oci_containerengine_cluster.b3_cluster.id
}

output "node_pool_id" {
  description = "OCID do node pool OKE"
  value       = oci_containerengine_node_pool.b3_node_pool.id
}
