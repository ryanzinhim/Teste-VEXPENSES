# Descrição Técnica - Infraestrutura Terraform Original

## Visão Geral
Configuração de infraestrutura AWS usando Terraform, criando recursos de rede, segurança e computação para um ambiente básico de nuvem.

## Recursos Criados

### 1. Provedor AWS
- **Região**: us-east-1 (Virginia)
- Configuração básica sem personalização adicional

### 2. Variáveis
- `projeto`: Define nome do projeto (default: "VExpenses")
- `candidato`: Identifica responsável (default: "SeuNome")
- Escopo: Utilizada para nomear e tagear recursos

### 3. Rede (VPC)
#### VPC Principal
- CIDR Block: 10.0.0.0/16
- Suporte a DNS habilitado
- Tags personalizadas

#### Subnet
- CIDR Block: 10.0.1.0/24
- Zona de Disponibilidade: us-east-1a
- Associada à VPC criada

#### Internet Gateway
- Conecta VPC à internet
- Permite comunicação externa

#### Tabela de Roteamento
- Rota padrão para internet (0.0.0.0/0)
- Associada à subnet criada

### 4. Segurança
#### Par de Chaves
- Geração de chave RSA
- 2048 bits de comprimento
- Criação automática de key pair na AWS

#### Grupo de Segurança
- Permite SSH (porta 22) de qualquer origem
- Permite todo tráfego de saída
- Associado à VPC

### 5. Instância EC2
#### Configurações
- AMI: Debian 12 mais recente
- Tipo de Instância: t2.micro
- Subnet: Subnet criada anteriormente
- IP Público: Associado
- Volume Root:
  - 20 GB
  - Tipo gp2
  - Exclusão automática na terminação

#### User Data
- Script básico de atualização do sistema
- Comando simples de update e upgrade

### 6. Outputs
- Chave privada (sensível)
- IP público da instância

## Análise Técnica

### Pontos Positivos
- Uso de variáveis para flexibilidade
- Configuração básica de rede
- Geração automática de chaves
- Grupo de segurança permitindo acesso SSH

### Pontos de Atenção
- Permissão SSH muito aberta (0.0.0.0/0)
- Sem configurações adicionais de segurança
- Nenhuma instalação ou configuração de serviços
- User data extremamente limitado

### Recomendações Iniciais
- Restringir acesso SSH
- Adicionar camadas de segurança
- Automatizar instalação de serviços
- Implementar hardening do sistema

## Considerações Finais
Infraestrutura básica para ambiente de desenvolvimento ou prova de conceito, necessitando refinamentos para uso em produção.
