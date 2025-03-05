# Variável para definir o nome do projeto
# Usada para prefixar recursos e facilitar identificação
variable "projeto" {
  description = "Nome do projeto"
  type        = string
  default     = "VExpenses"
}

# Variável para identificar o candidato/responsável
# Utilizada para tags e identificação personalizada
variable "candidato" {
  description = "Nome do candidato"
  type        = string
  default     = "Ryan"
}

# Variável para definir a região AWS
# Permite configurar facilmente a região sem alterar o código principal
variable "region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}

# Variável para definir o tipo de instância EC2
# Flexibilidade para escolher o tamanho/tipo da instância
variable "instance_type" {
  description = "Tipo de Instância EC2"
  type        = string
  default     = "t2.micro"
}

# Variáveis de rede para configuração de VPC e Subnet
variable "vpc_cidr" {
  description = "Bloco CIDR para VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Bloco CIDR para Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# Variável para definir a zona de disponibilidade
# Permite escolher onde os recursos serão implantados
variable "availability_zone" {
  description = "Zona de Disponibilidade para Subnet"
  type        = string
  default     = "us-east-1a"
}