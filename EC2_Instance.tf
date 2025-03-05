# Busca a AMI mais recente do Debian 12
data "aws_ami" "debian12" {
 # Seleciona a AMI mais recente
  most_recent = true
  # Filtros para encontrar a imagem correta
  filter {
    name   = "name"
    values = ["debian-12-amd64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  # ID da conta oficial do Debian na AWS
  owners = ["679593333341"]
}

# Recurso de Instância EC2
resource "aws_instance" "debian_ec2" {
  # Usa a AMI do Debian 12 encontrada
  ami                    = data.aws_ami.debian12.id
  # Tipo de instância definido por variável
  instance_type          = var.instance_type
  # Associa à subnet criada
  subnet_id              = aws_subnet.main_subnet.id
  # Usa o par de chaves criado
  key_name               = aws_key_pair.ec2_key_pair.key_name
  # Associa o grupo de segurança
  vpc_security_group_ids = [aws_security_group.main_sg.id]
  # Atribui IP público
  associate_public_ip_address = true

  # Configuração do volume root
  root_block_device {
    volume_size           = 20  # Tamanho em GB
    volume_type           = "gp3"  # Tipo de volume com melhor performance
    delete_on_termination = true
    encrypted             = true  # Criptografia do volume
  }

  # User Data for Initial Setup
  user_data = <<-EOF
    #!/bin/bash
    set -e

    # Update and Upgrade
    apt-get update -y
    apt-get upgrade -y

    # Install Nginx
    apt-get install -y nginx

    # Nginx Basic Security Configuration
    sed -i 's/server_tokens on;/server_tokens off;/' /etc/nginx/nginx.conf

    # Create a simple index.html
    echo "<html><body><h1>VExpenses Challenge - Nginx Working!</h1></body></html>" > /var/www/html/index.html

    # Start and Enable Nginx
    systemctl start nginx
    systemctl enable nginx

    # Basic system hardening
    echo "* hard maxlogins 10" >> /etc/security/limits.conf

    # Cleanup
    apt-get autoremove -y
    apt-get clean

    echo "Setup Complete" >> /var/log/user-data.log
  EOF

  # Garante que user data seja executado em cada apply
  user_data_replace_on_change = true

  tags = {
    Name      = "${var.projeto}-${var.candidato}-ec2"
    Project   = var.projeto
    ManagedBy = "Terraform"
  }

  # Habilita monitoramento detalhado
  monitoring = true
}
