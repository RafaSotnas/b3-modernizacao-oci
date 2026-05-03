variable "compartment_id" {
  type        = string
  description = "OCID do compartimento onde a VCN será criada"
}

variable "cost_center" {
  type        = string
  description = "Centro de custo para rastreabilidade"
}

variable "vcn_display_name" {
  type        = string
  description = "Nome da Virtual Cloud Network"
}

variable "vcn_dns_label" {
  type        = string
  description = "Label DNS da VCN"
}

variable "vcn_cidr_block" {
  type        = string
  description = "Bloco CIDR da VCN"
}

variable "private_subnet_cidr" {
  type        = string
  description = "Bloco CIDR da subnet privada"
}

variable "public_subnet_cidr" {
  type        = string
  description = "Bloco CIDR da subnet pública"
}