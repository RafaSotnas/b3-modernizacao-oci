terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.0"
    }
  }
  # Recomendado para B3: Estado remoto no Object Storage
  # backend "s3" {
  #   bucket   = "terraform-state-dev"
  #   key      = "b3-modernizacao/dev.tfstate"
  #   region   = "sa-saopaulo-1"
  #   endpoint = "https://<namespace>.compat.objectstorage.sa-saopaulo-1.oraclecloud.com"
  #   skip_region_validation      = true
  #   skip_credentials_validation = true
  # }
}