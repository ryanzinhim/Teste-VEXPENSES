# Provider Configuration
# Specifies the AWS provider and region
provider "aws" {
  region = var.region # Use a variable for more flexibility
}

# Specify required providers and version constraints
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use latest 5.x version
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
  # Optional: Configure backend for state management
  # backend "s3" {
  #   bucket = "your-terraform-state-bucket"
  #   key    = "vexpenses/terraform.tfstate"
  #   region = "us-east-1"
  # }
}