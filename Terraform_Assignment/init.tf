terraform {
   required_version = ">= 1.2.0, <= 1.9.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.55.0"  
    }
  }
}

# The Cloud provider moso-interior is hosting the static website on
provider "aws" {
  region = var.aws_region
}
