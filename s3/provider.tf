terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 6.10.0"
        }
    }
    backend "local" {
        path = "D:\\Git-CodeCloud\\terraform_states\\arj-infra\\terraform.tfstate"
      
    }
}

provider "aws" {
  region     = "ap-south-1" # Change to your preferred region
}