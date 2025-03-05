# Configuração do Provider AWS
# Define a região padrão para implantação dos recursos
provider "aws" {
  region = var.region # Permite flexibilidade na escolha da região
}

# Configurações de Providers e Restrições de Versão
terraform {
  required_providers {
    # Provider AWS com restrição de versão
    # ~> 5.0 significa usar a versão mais recente da série 5.x
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    # Provider TLS para geração de chaves
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
  #subindo de novo pq deu erro
}