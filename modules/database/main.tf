# B3 Modernização OCI - Infraestrutura como Código
resource "oci_database_autonomous_database" "this" {
  admin_password              = var.admin_password
  compartment_id              = var.compartment_id
  cpu_core_count              = var.cpu_core_count
  db_name                     = var.db_name
  db_version                  = "19c" # Versão padrão para Autonomous Database
  display_name                = var.display_name
  is_auto_scaling_enabled     = true
  is_data_guard_enabled       = var.is_data_guard_enabled
  is_free_tier                = var.is_free_tier
  is_mtls_connection_required = var.is_mtls_connection_required
  license_model               = var.license_model
  storage_size_in_gbs         = var.storage_size_in_gbs
  workload_type               = var.workload_type

  # Configuração de rede privada
  subnet_id = var.subnet_id
  nsg_ids   = var.nsg_ids

  # Tags para FinOps
  defined_tags = {
    "Operations.CostCenter" = var.cost_center
    "Operations.Project"    = "Balcao-B3-Modernizacao"
    "Environment"           = var.environment
  }

  # Configurações de backup
  backup_config {
    auto_backup_enabled = true
    retention_period_in_days = var.backup_retention_days
  }
}
```

```
.
├── environments/          # Ambientes de deploy (dev, prod, etc.)
│   └── dev/              # Ambiente de desenvolvimento
├── modules/              # Módulos reutilizáveis Terraform
│   ├── vcn/             # Rede Virtual (VCN e Subnets)
│   ├── compute/         # Instâncias de Computação
│   ├── monitoring/      # Monitoramento e Alertas
│   └── database/        # Banco de Dados (futuro)
├── policies/            # Políticas de Segurança OCI
├── scripts/             # Scripts de automação
└── README.md           # Esta documentação
```

## 🚀 Funcionalidades

- **Segurança por Design**: Subnets privadas sem IPs públicos, princípio de least privilege
- **FinOps**: Tagging obrigatório para rastreabilidade de custos
- **Monitoramento**: Alertas automáticos e integração com logs
- **Modularidade**: Módulos reutilizáveis para diferentes ambientes
- **CI/CD Ready**: Estrutura preparada para pipelines de automação

## 📋 Pré-requisitos

- Terraform v1.0+
- OCI CLI configurada
- Conta OCI com permissões adequadas
- Chaves de API OCI configuradas

## 🛠️ Como Usar

### 1. Configuração Inicial

```bash
# Clone o repositório
git clone <url-do-repo>
cd b3-modernizacao-oci

# Configure suas credenciais OCI
oci setup config

# Valide a configuração
oci iam compartment list
```

### 2. Deploy no Ambiente de Desenvolvimento

```bash
# Navegue para o ambiente dev
cd environments/dev

# Inicialize o Terraform
terraform init

# Valide a configuração
terraform validate

# Planeje o deploy
terraform plan

# Aplique as mudanças
terraform apply
```

### 3. Variáveis Necessárias

Edite o arquivo `terraform.tfvars` com seus valores:

```hcl
compartment_id      = "ocid1.compartment.oc1..xxxxx"
tenancy_ocid        = "ocid1.tenancy.oc1..xxxxx"
user_ocid           = "ocid1.user.oc1..xxxxx"
fingerprint         = "xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx"
private_key_path    = "~/.oci/oci_api_key.pem"
region              = "sa-saopaulo-1"
cost_center         = "FIN-SRE-01"
image_id            = "ocid1.image.oc1.sa-saopaulo-1.xxxxx"
availability_domain = "Uocm:SA-SAOPAULO-1-AD-1"
log_group_id        = "ocid1.loggroup.oc1.sa-saopaulo-1.xxxxx"
notification_topic_id = "ocid1.onstopic.oc1.sa-saopaulo-1.xxxxx"
```

## 📤 Outputs

Após o deploy, os seguintes recursos estarão disponíveis:

- `vcn_id`: OCID da VCN criada
- `private_subnet_id`: Subnet privada para aplicações
- `public_subnet_id`: Subnet pública para load balancers
- `compute_instance_id`: Instância EC2 criada
- `monitoring_alarm_id`: Alarme de CPU alta
- `monitoring_connector_id`: Conector de logs

## 🔧 Módulos Disponíveis

### VCN Module
Cria rede virtual com subnets públicas e privadas.

### Compute Module
Provisiona instâncias EC2 com configurações otimizadas.

### Monitoring Module
Configura alertas e conectores de log para observabilidade.

## ⚠️ Notas Importantes

- Sempre use subnets privadas para aplicações sensíveis
- Mantenha tags de custo atualizadas para FinOps
- Teste mudanças em dev antes de aplicar em produção
- Monitore custos regularmente via OCI Cost Analysis

## 🤝 Contribuição

1. Faça fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📞 Suporte

Para dúvidas ou problemas, entre em contato com a equipe SRE da B3.