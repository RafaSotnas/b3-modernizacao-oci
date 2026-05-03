variable "availability_domain" {
  type        = string
  description = "Domínio de disponibilidade no OCI (ex: Uocm:SA-SAOPAULO-1-AD-1)"
}

variable "compartment_id" {
  type        = string
  description = "OCID do compartimento onde a instância será criada"
}

variable "cost_center" {
  type        = string
  description = "Centro de custo para rastreabilidade dos recursos"
}

variable "image_id" {
  type        = string
  description = "OCID da imagem do sistema operacional para a instância"
}

variable "subnet_id" {
  type        = string
  description = "OCID da subnet onde a instância será provisionada"
}
