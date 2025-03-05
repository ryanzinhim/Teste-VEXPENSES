# Fetch Latest Debian 12 AMI
data "aws_ami" "debian12" {
  most_recent = true
  
  filter {
    name   = "name"
    values = ["debian-12-amd64-*"]
  }
  
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
  # Official Debian AWS account
  owners = ["679593333341"]
}

# EC2 Instance Resource
resource "aws_instance" "debian_ec2" {
  ami           = data.aws_ami.debian12.id
  instance_type = var.instance_type
  
  subnet_id     = aws_subnet.main_subnet.id
  key_name      = aws_key_pair.ec2_key_pair.key_name
  
  # Use list for security groups instead of deprecated name parameter
  vpc_security_group_ids = [aws_security_group.main_sg.id]
  
  associate_public_ip_address = true

  # Root Volume Configuration
  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"  # Upgraded to gp3 for better performance
    delete_on_termination = true
    encrypted             = true   # Add encryption for security
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

  # Ensure user data runs on every terraform apply
  user_data_replace_on_change = true

  tags = {
    Name = "${var.projeto}-${var.candidato}-ec2"
    Project = var.projeto
    ManagedBy = "Terraform"
  }

  # Optional: Monitoring and backups
  monitoring = true
}