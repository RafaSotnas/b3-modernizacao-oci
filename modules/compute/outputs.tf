output "instance_id" {
  description = "OCID da instância criada"
  value       = oci_core_instance.app_server.id
}

output "instance_private_ip" {
  description = "IP privado da instância"
  value       = oci_core_instance.app_server.private_ip
}