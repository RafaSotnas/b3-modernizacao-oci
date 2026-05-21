# B3 Modernização OCI - Infraestrutura como Código

Este projeto implementa a infraestrutura de modernização dos sistemas legados da B3 utilizando Oracle Cloud Infrastructure (OCI) com Terraform. O foco é em segurança, governança de custos (FinOps) e automação de provisionamento.

## 📁 Estrutura do Projeto.

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
- `instance_id`: OCID da instância de computação
- `instance_private_ip`: IP privado da instância
- `cluster_id`: OCID do cluster OKE

## 🔧 Módulos Disponíveis

### VCN Module
Cria rede virtual com subnets públicas e privadas, NAT gateway e tabelas de roteamento.

### Compute Module
Provisiona instâncias de computação OCI com Docker pre-instalado.

### Monitoring Module
Configura alarmes de CPU e memória com conectores de log via Service Connector Hub.

### OCIR Module
Cria repositório privado de imagens Docker no Oracle Container Image Registry.

### OKE Module
Provisiona cluster Kubernetes gerenciado com node pool configurável.

## ⚠️ Notas Importantes

- Sempre use subnets privadas para aplicações sensíveis
- Mantenha tags de custo atualizadas para FinOps
- Teste mudanças em dev antes de aplicar em produção
- Monitore custos regularmente via OCI Cost Analysis

## 🔐 Configuração de Secrets do GitHub

Para que o workflow do GitHub Actions execute corretamente, configure os seguintes secrets no repositório:

- `OCI_TENANCY_OCID`: OCID da sua tenancy OCI
- `OCI_USER_OCID`: OCID do usuário OCI
- `OCI_FINGERPRINT`: Fingerprint da chave API
- `OCI_PRIVATE_KEY`: Conteúdo da chave privada
- `OCI_REGION`: Região OCI (ex: sa-saopaulo-1)
- `OCI_COMPARTMENT_ID`: OCID do compartimento
- `OCI_IMAGE_ID`: OCID da imagem do sistema operacional
- `OCI_AVAILABILITY_DOMAIN`: Domínio de disponibilidade
- `OCI_LOG_GROUP_ID`: OCID do log group
- `OCI_NOTIFICATION_TOPIC_ID`: OCID do tópico de notificação
- `DATADOG_API_KEY`: Chave de API do Datadog (opcional)
- `OCI_COST_CENTER`: Identificador do centro de custo
- `INFRACOST_API_KEY`: Chave de API do Infracost

## 🔐 Configuração de Secrets do GitHub

Para que o workflow do GitHub Actions execute corretamente, configure os seguintes secrets no repositório:

- `OCI_TENANCY_OCID`: OCID da sua tenancy OCI
- `OCI_USER_OCID`: OCID do usuário OCI
- `OCI_FINGERPRINT`: Fingerprint da chave API
- `OCI_PRIVATE_KEY`: Conteúdo da chave privada (base64 ou texto)
- `OCI_REGION`: Região OCI (ex: sa-saopaulo-1)
- `OCI_COMPARTMENT_ID`: OCID do compartimento
- `OCI_IMAGE_ID`: OCID da imagem do sistema operacional
- `OCI_AVAILABILITY_DOMAIN`: Domínio de disponibilidade
- `OCI_LOG_GROUP_ID`: OCID do log group
- `OCI_NOTIFICATION_TOPIC_ID`: OCID do tópico de notificação
- `DATADOG_API_KEY`: Chave de API do Datadog (opcional)
- `OCI_COST_CENTER`: Identificador do centro de custo
- `INFRACOST_API_KEY`: Chave de API do Infracost (para análise de custos)

## 🤝 Contribuição

1. Faça fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📞 Suporte

Para dúvidas ou problemas, entre em contato com a equipe SRE da B3.