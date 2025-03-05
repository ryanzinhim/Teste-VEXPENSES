# Geração de Chave Privada SSH
# Utiliza algoritmo RSA com 2048 bits
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Criação de Par de Chaves AWS
resource "aws_key_pair" "ec2_key_pair" {
  # Nome único baseado em projeto e candidato
  key_name   = "${var.projeto}-${var.candidato}-key"
  # Usa chave pública gerada anteriormente
  public_key = tls_private_key.ec2_key.public_key_openssh

  # Tags para identificação
  tags = {
    Name = "${var.projeto}-${var.candidato}-key"
    Project = var.projeto
    ManagedBy = "Terraform"
  }
}

# Grupo de Segurança - Define regras de firewall
resource "aws_security_group" "main_sg" {
  # Nome único baseado em projeto e candidato
  name        = "${var.projeto}-${var.candidato}-sg"
  description = "Permitir SSH de qualquer lugar e todo o tráfego de saída"
  # Associa o grupo de segurança à VPC
  vpc_id      = aws_vpc.main_vpc.id

  # Regra de entrada - Permite conexão SSH
  ingress {
    description      = "Allow SSH from anywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # Regra de saída - Permite todo tráfego de saída
  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # Tags para identificação
  tags = {
    Name = "${var.projeto}-${var.candidato}-sg"
    Project = var.projeto
    ManagedBy = "Terraform"
  }
}