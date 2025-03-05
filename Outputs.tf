# Sensitive Outputs
output "private_key" {
  description = "Chave privada para acessar a instância EC2"
  value       = tls_private_key.ec2_key.private_key_pem
  sensitive   = true
}

# Public IP Output
output "ec2_public_ip" {
  description = "Endereço IP público da instância EC2"
  value       = aws_instance.debian_ec2.public_ip
}

# Additional Useful Outputs
output "instance_id" {
  description = "ID da instância EC2"
  value       = aws_instance.debian_ec2.id
}

output "vpc_id" {
  description = "ID da VPC"
  value       = aws_vpc.main_vpc.id
}

output "subnet_id" {
  description = "ID da Subnet"
  value       = aws_subnet.main_subnet.id
}