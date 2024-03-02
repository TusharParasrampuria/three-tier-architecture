terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.38"
    }
  }
  required_version = "~> 1.7"
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
  default_tags {
    tags = {
      Environment = "test"
      Managed_by  = "terraform"
    }
  }
}
