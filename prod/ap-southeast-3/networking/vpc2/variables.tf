# variables.tf

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "public_subnet_cidr_a" {
  description = "CIDR block for the public subnet in AZ A"
  type        = string
}

variable "public_subnet_cidr_b" {
  description = "CIDR block for the public subnet in AZ B"
  type        = string
}

variable "private_subnet_cidr_a" {
  description = "CIDR block for the private subnet in AZ A"
  type        = string
}

variable "private_subnet_cidr_b" {
  description = "CIDR block for the private subnet in AZ B"
  type        = string
}

variable "database_subnet_cidr_a" {
  description = "CIDR block for the database subnet in AZ A"
  type        = string
}

variable "database_subnet_cidr_b" {
  description = "CIDR block for the database subnet in AZ B"
  type        = string
}

variable "infra_subnet_cidr_a" {
  description = "CIDR block for the infra subnet in AZ A"
  type        = string
}

variable "infra_subnet_cidr_b" {
  description = "CIDR block for the infra subnet in AZ B"
  type        = string
}

variable "availability_zone_a" {
  description = "Availability zone A"
  type        = string
}

variable "availability_zone_b" {
  description = "Availability zone B"
  type        = string
}

variable "public_subnet_name_a" {
  description = "Name for public subnet in AZ A"
  type        = string
}

variable "public_subnet_name_b" {
  description = "Name for public subnet in AZ B"
  type        = string
}

variable "private_subnet_name_a" {
  description = "Name for private subnet in AZ A"
  type        = string
}

variable "private_subnet_name_b" {
  description = "Name for private subnet in AZ B"
  type        = string
}

variable "database_subnet_name_a" {
  description = "Name for database subnet in AZ A"
  type        = string
}

variable "database_subnet_name_b" {
  description = "Name for database subnet in AZ B"
  type        = string
}

variable "infra_subnet_name_a" {
  description = "Name for infra subnet in AZ A"
  type        = string
}

variable "infra_subnet_name_b" {
  description = "Name for infra subnet in AZ B"
  type        = string
}

variable "public_rt_name" {
  description = "Name for the public route table"
  type        = string
}

variable "private_rt_name" {
  description = "Name for the private route table"
  type        = string
}

variable "database_rt_name" {
  description = "Name for the database route table"
  type        = string
}

variable "infra_rt_name" {
  description = "Name for the infra route table"
  type        = string
}

variable "igw_name" {
  description = "Name for the internet gateway"
  type        = string
}

variable "natgw_name" {
  description = "Name for the NAT gateway"
  type        = string
}

variable "natgw_eip_name" {
  description = "Name for the NAT gateway EIP"
  type        = string
}

variable "endpoint_s3_name" {
  description = "Name for the S3 VPC endpoint"
  type        = string
}
