variable "compartment_id" {
  type        = string
  description = "OCID do compartimento onde o banco de dados será criado"
}

variable "db_name" {
  type        = string
  description = "Nome do banco de dados (máximo 14 caracteres)"
  validation {
    condition     = length(var.db_name) <= 14
    error_message = "O nome do banco de dados não pode exceder 14 caracteres."
  }
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Senha do administrador do banco de dados"
  validation {
    condition     = length(var.admin_password) >= 12
    error_message = "A senha deve ter no mínimo 12 caracteres."
  }
}

variable "display_name" {
  type        = string
  description = "Nome de exibição do banco de dados"
}

variable "environment" {
  type        = string
  description = "Ambiente do banco de dados (dev, prod, etc)"
}

variable "cost_center" {
  type        = string
  description = "Centro de custo para tags de FinOps"
}

variable "workload_type" {
  type        = string
  default     = "OLTP"
  description = "Tipo de workload (OLTP ou DW)"
}

variable "cpu_core_count" {
  type        = number
  default     = 1
  description = "Número de cores CPU para o Autonomous Database"
}

variable "storage_size_in_gbs" {
  type        = number
  default     = 20
  description = "Tamanho do armazenamento em GB"
}

variable "is_free_tier" {
  type        = bool
  default     = false
  description = "Se deve usar Always Free tier"
}

variable "is_mtls_connection_required" {
  type        = bool
  default     = true
  description = "Requer conexão mTLS (mutual TLS)"
}

variable "license_model" {
  type        = string
  default     = "LICENSE_INCLUDED"
  description = "Modelo de licença (LICENSE_INCLUDED ou BRING_YOUR_OWN_LICENSE)"
}

variable "is_data_guard_enabled" {
  type        = bool
  default     = false
  description = "Habilita Data Guard para alta disponibilidade"
}

variable "backup_retention_days" {
  type        = number
  default     = 30
  description = "Dias de retenção de backup"
}

variable "subnet_id" {
  type        = string
  description = "OCID da subnet privada para o banco de dados"
}

variable "nsg_ids" {
  type        = list(string)
  default     = []
  description = "OCIDs dos Network Security Groups (NSGs)"
}
