module "network_dev" {
  source = "../../modules/vcn"

  # Passando as variáveis necessárias para o módulo
  compartment_id      = var.compartment_id
  cost_center         = var.cost_center
  vcn_display_name    = "vcn-balcao-dev"
  vcn_dns_label       = "vcndev"
  vcn_cidr_block      = "10.0.0.0/16"
  private_subnet_cidr = "10.0.1.0/24"
  public_subnet_cidr  = "10.0.2.0/24"
}

module "compute_dev" {
  source         = "../../modules/compute"
  compartment_id = var.compartment_id
  subnet_id      = module.network_dev.private_subnet_id
  cost_center    = var.cost_center
  image_id            = var.image_id
  availability_domain = var.availability_domain
}

module "monitoring_dev" {
  source                = "../../modules/monitoring"
  compartment_id        = var.compartment_id
  environment           = "dev"
  log_group_id          = var.log_group_id
  notification_topic_id = var.notification_topic_id
  cost_center           = var.cost_center
}

# Novo: Módulo para armazenar imagens Docker
module "ocir_dev" {
  source          = "../../modules/ocir"
  compartment_id  = var.compartment_id
  repository_name = "balcao/app-legada"
  cost_center     = var.cost_center
}

# Novo: Módulo para Orquestração (Kubernetes)
module "oke_dev" {
  source             = "../../modules/oke"
  compartment_id     = var.compartment_id
  vcn_id             = module.network_dev.vcn_id
  endpoint_subnet_id = module.network_dev.private_subnet_id
  lb_subnet_id       = module.network_dev.public_subnet_id
  cost_center        = var.cost_center
}