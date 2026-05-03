variable "compartment_id" {
  type        = string
  description = "OCID do compartimento onde o cluster será criado"
}

variable "vcn_id" {
  type        = string
  description = "OCID da VCN onde o cluster será provisionado"
}

variable "endpoint_subnet_id" {
  type        = string
  description = "OCID da subnet usada para o endpoint do cluster"
}

variable "lb_subnet_id" {
  type        = string
  description = "OCID da subnet usada para load balancers do cluster"
}

variable "node_subnet_id" {
  type        = string
  description = "OCID da subnet usada pelos nodes do cluster"
}

variable "availability_domain" {
  type        = string
  description = "Domínio de disponibilidade OCI para os nodes"
}

variable "cost_center" {
  type        = string
  description = "Centro de custo para as tags de FinOps"
}

variable "kubernetes_version" {
  type        = string
  default     = "v1.28.2"
}

variable "node_shape" {
  type        = string
  default     = "VM.Standard.E4.Flex"
}

variable "node_pool_size" {
  type        = number
  default     = 2
}

variable "node_memory_in_gbs" {
  type        = number
  default     = 16
}

variable "node_ocpus" {
  type        = number
  default     = 2
}
