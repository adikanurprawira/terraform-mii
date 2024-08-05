terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.21"
    }
  }

  backend "s3" {
    bucket         = "terraform-mii-tfstate-ap-southeast-3"
    key            = "networking/vpc/terraform.tfstate"
    dynamodb_table = "terraform-mii-tfstate-lock"
    region         = "ap-southeast-3"
  }
}