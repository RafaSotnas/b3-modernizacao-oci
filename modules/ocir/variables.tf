variable "compartment_id" {
  type        = string
  description = "OCID do compartimento para o repositório OCIR"
}

variable "repository_name" {
  type        = string
  description = "Nome do repositório OCIR a ser criado"
}

variable "cost_center" {
  type        = string
  description = "Centro de custo para tags de FinOps"
}
