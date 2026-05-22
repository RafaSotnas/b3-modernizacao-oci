variable "tenancy_ocid" {
  type        = string
  description = "OCID da tenancy OCI"
}

variable "user_ocid" {
  type        = string
  description = "OCID do usuário OCI"
}

variable "fingerprint" {
  type        = string
  description = "Fingerprint da chave API OCI"
}

variable "region" {
  type        = string
  description = "Região OCI onde os recursos serão criados"
}

variable "compartment_id" {
  type        = string
  description = "OCID do compartimento onde os recursos serão criados"
}

variable "datadog_api_key" {
  type        = string
  description = "Chave de API do Datadog para integração de logs"
}

variable "cost_center" {
  type        = string
  description = "Centro de custo para rastreabilidade dos recursos"
}

variable "image_id" {
  type        = string
  description = "OCID da imagem de sistema operacional para a instância"
}

variable "availability_domain" {
  type        = string
  description = "Domínio de disponibilidade OCI (ex: Uocm:SA-SAOPAULO-1-AD-1)"
}

variable "log_group_id" {
  type        = string
  description = "OCID do log group para monitoramento"
}

variable "notification_topic_id" {
  type        = string
  description = "OCID do tópico de notificação para alertas"
}

