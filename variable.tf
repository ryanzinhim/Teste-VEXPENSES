# Project and Candidate Variables
variable "projeto" {
  description = "Nome do projeto"
  type        = string
  default     = "VExpenses"
}

variable "candidato" {
  description = "Nome do candidato"
  type        = string
  default     = "SeuNome"
}

# Region Variable - Added for more flexibility
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

# Instance Type Variable
variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}

# Networking Variables
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# Availability Zone Variable
variable "availability_zone" {
  description = "Availability Zone for Subnet"
  type        = string
  default     = "us-east-1a"
}