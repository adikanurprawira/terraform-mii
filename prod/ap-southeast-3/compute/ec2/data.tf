data "terraform_remote_state" "prod_networking_vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-mii-tfstate-ap-southeast-3"
    key    = "networking/vpc/terraform.tfstate"
    region = "ap-southeast-3"
  }
}
