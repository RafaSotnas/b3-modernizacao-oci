resource "oci_core_vcn" "this" {
  dns_label      = var.vcn_dns_label
  cidr_block     = var.vcn_cidr_block
  compartment_id = var.compartment_id
  display_name   = var.vcn_display_name

  # Foco em FinOps: Tagging obrigatória para rastreabilidade
  defined_tags = {
    "Operations.CostCenter" = var.cost_center
    "Operations.Project"    = "Balcao-B3-Modernizacao"
  }
}

# NAT Gateway para permitir que recursos em subnets privadas acessem a internet (ex: yum install)
resource "oci_core_nat_gateway" "this" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.this.id
  display_name   = "nat-gateway-balcao"

  defined_tags = {
    "Operations.CostCenter" = var.cost_center
    "Operations.Project"    = "Balcao-B3-Modernizacao"
  }
}

# Tabela de Roteamento para a Subnet Privada
resource "oci_core_route_table" "private_rt" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.this.id
  display_name   = "rt-privada"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.this.id
  }

  defined_tags = {
    "Operations.CostCenter" = var.cost_center
    "Operations.Project"    = "Balcao-B3-Modernizacao"
  }
}

# Subnet Privada (Segurança: Princípio de Least Privilege)
resource "oci_core_subnet" "private" {
  cidr_block     = var.private_subnet_cidr
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.this.id
  display_name   = "subnet-privada-app"
  route_table_id = oci_core_route_table.private_rt.id

  # Bloqueia acesso público direto para segurança
  prohibit_public_ip_on_vnic = true

  defined_tags = {
    "Operations.CostCenter" = var.cost_center
    "Operations.Project"    = "Balcao-B3-Modernizacao"
  }
}

# Subnet Pública (Para recursos que precisam de acesso público, como Load Balancers)
resource "oci_core_subnet" "public" {
  cidr_block     = var.public_subnet_cidr
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.this.id
  display_name   = "subnet-publica-lb"
  
  # Permite IPs públicos
  prohibit_public_ip_on_vnic = false

  defined_tags = {
    "Operations.CostCenter" = var.cost_center
    "Operations.Project"    = "Balcao-B3-Modernizacao"
  }
}