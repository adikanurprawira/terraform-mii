# terraform.tfvars

region                = "ap-southeast-3"  # Jakarta region
vpc_cidr              = "10.0.0.0/16"
vpc_name              = "terraform-mii-vpc"

public_subnet_cidr_a  = "10.0.1.0/24"
public_subnet_cidr_b  = "10.0.2.0/24"
private_subnet_cidr_a = "10.0.3.0/24"
private_subnet_cidr_b = "10.0.4.0/24"
database_subnet_cidr_a = "10.0.5.0/24"
database_subnet_cidr_b = "10.0.6.0/24"
infra_subnet_cidr_a   = "10.0.7.0/28"
infra_subnet_cidr_b   = "10.0.7.16/28"

availability_zone_a   = "ap-southeast-3a"
availability_zone_b   = "ap-southeast-3b"

public_subnet_name_a  = "terraform-mii-subnet-public-a"
public_subnet_name_b  = "terraform-mii-subnet-public-b"
private_subnet_name_a = "terraform-mii-subnet-private-a"
private_subnet_name_b = "terraform-mii-subnet-private-b"
database_subnet_name_a = "terraform-mii-subnet-database-a"
database_subnet_name_b = "terraform-mii-subnet-database-b"
infra_subnet_name_a   = "terraform-mii-subnet-infra-a"
infra_subnet_name_b   = "terraform-mii-subnet-infra-b"

public_rt_name        = "terraform-mii-public-rt"
private_rt_name       = "terraform-mii-private-rt"
database_rt_name      = "terraform-mii-database-rt"
infra_rt_name         = "terraform-mii-infra-rt"

igw_name              = "terraform-mii-igw"
natgw_name            = "terraform-mii-natgw"
natgw_eip_name        = "terraform-mii-natgw-eip"
endpoint_s3_name      = "terraform-mii-endpoint-s3"
