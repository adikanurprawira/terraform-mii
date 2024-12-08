terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket         = "terraform-mii-tfstate-ap-southeast-3"
    key            = "main/resources/terraform.tfstate"
    dynamodb_table = "terraform-mii-tfstate-lock"
    region         = "ap-southeast-3"
  }
}