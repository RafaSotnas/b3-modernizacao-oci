# Exemplo de política restrita para o time de Redes/DevOps

resource "oci_identity_policy" "network_admin_limited" {
  name           = "B3-Network-Limited-Access"
  description    = "Permite apenas o gerenciamento de recursos de rede, sem acesso a dados ou usuários"
  compartment_id = var.compartment_id

  statements = [
    # Permite gerenciar a VCN e Subnets, mas não deletar o compartimento
    "Allow group DevOps-Team to manage virtual-network-family in compartment id ${var.compartment_id}",
    
    # Permite ler informações de instâncias para troubleshooting, mas não criá-las (separação de deveres)
    "Allow group DevOps-Team to read instance-family in compartment id ${var.compartment_id}"
  ]
}