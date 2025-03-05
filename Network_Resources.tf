# Recurso VPC - Rede Virtual Privada
# Configuração básica de rede com suporte a DNS
resource "aws_vpc" "main_vpc" {
  # Utiliza bloco CIDR definido na variável
  cidr_block           = var.vpc_cidr
  # Habilita suporte e resolução de DNS
  enable_dns_support   = true
  enable_dns_hostnames = true

  # Tags para identificação e gerenciamento
  tags = {
    Name = "${var.projeto}-${var.candidato}-vpc"
    Project = var.projeto
    ManagedBy = "Terraform"
  }
}

# Recurso Subnet - Sub-rede dentro da VPC
resource "aws_subnet" "main_subnet" {
  # Associa a subnet à VPC criada
  vpc_id            = aws_vpc.main_vpc.id
  # Utiliza bloco CIDR definido na variável
  cidr_block        = var.subnet_cidr
  # Define zona de disponibilidade
  availability_zone = var.availability_zone

  # Tags para identificação
  tags = {
    Name = "${var.projeto}-${var.candidato}-subnet"
    Project = var.projeto
    ManagedBy = "Terraform"
  }
}

# Internet Gateway - Permite comunicação entre VPC e internet
resource "aws_internet_gateway" "main_igw" {
  # Associa o gateway à VPC
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.projeto}-${var.candidato}-igw"
    Project = var.projeto
    ManagedBy = "Terraform"
  }
}

resource "aws_route_table" "main_route_table" {
  # Associa a tabela de rota à VPC
  vpc_id = aws_vpc.main_vpc.id

  # Rota padrão para internet
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  # Tags para identificação
  tags = {
    Name = "${var.projeto}-${var.candidato}-route_table"
    Project = var.projeto
    ManagedBy = "Terraform"
  }
}

# Associação da Tabela de Roteamento com a Subnet
resource "aws_route_table_association" "main_association" {
  subnet_id      = aws_subnet.main_subnet.id
  route_table_id = aws_route_table.main_route_table.id
}