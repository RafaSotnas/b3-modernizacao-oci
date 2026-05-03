resource "oci_core_instance" "app_server" {
  # Localização e Identidade
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  display_name        = "srv-balcao-legado-01"
  shape               = "VM.Standard.E4.Flex" # Exemplo de shape moderno OCI

  shape_config {
    memory_in_gbs = 4
    ocpus         = 1
  }

  source_details {
    source_type = "image"
    source_id   = var.image_id # OCID da imagem Linux
  }

  create_vnic_details {
    subnet_id        = var.subnet_id
    assign_public_ip = false # Segurança: mantendo privado
  }

  metadata = {
    user_data = base64encode(<<-EOF
      #!/bin/bash
      yum install -y docker-engine
      systemctl enable --now docker
      usermod -aG docker opc
      echo "Docker instalado para suporte a containers - B3 Modernizacao"
    EOF
    )
  }

  # Foco em FinOps: Seguindo o padrão da VCN
  defined_tags = {
    "Operations.CostCenter" = var.cost_center
    "Operations.Project"    = "Balcao-B3-Modernizacao"
  }
}