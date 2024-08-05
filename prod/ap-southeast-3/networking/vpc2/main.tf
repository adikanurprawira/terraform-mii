# main.tf

provider "aws" {
  region = var.region
}

# Create the VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = var.igw_name
  }
}

# Create Elastic IP for NAT Gateway
resource "aws_eip" "nat_gw_eip" {
  vpc = true

  tags = {
    Name = var.natgw_eip_name
  }
}

# Create a NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = aws_subnet.public_subnet_a.id

  tags = {
    Name = var.natgw_name
  }
}

# Create VPC Endpoint for S3
resource "aws_vpc_endpoint" "s3" {
  vpc_id           = aws_vpc.my_vpc.id
  service_name     = "com.amazonaws.${var.region}.s3"
  route_table_ids  = [
    aws_route_table.public_rt.id,
    aws_route_table.private_rt.id,
    aws_route_table.database_rt.id,
    aws_route_table.infra_rt.id
  ]

  tags = {
    Name = var.endpoint_s3_name
  }
}

# Create Public Subnets
resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr_a
  availability_zone       = var.availability_zone_a
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_name_a
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr_b
  availability_zone       = var.availability_zone_b
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_name_b
  }
}

# Create Private Subnets
resource "aws_subnet" "private_subnet_a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet_cidr_a
  availability_zone = var.availability_zone_a

  tags = {
    Name = var.private_subnet_name_a
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet_cidr_b
  availability_zone = var.availability_zone_b

  tags = {
    Name = var.private_subnet_name_b
  }
}

# Create Database Subnets
resource "aws_subnet" "database_subnet_a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.database_subnet_cidr_a
  availability_zone = var.availability_zone_a

  tags = {
    Name = var.database_subnet_name_a
  }
}

resource "aws_subnet" "database_subnet_b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.database_subnet_cidr_b
  availability_zone = var.availability_zone_b

  tags = {
    Name = var.database_subnet_name_b
  }
}

# Create Infra Subnets
resource "aws_subnet" "infra_subnet_a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.infra_subnet_cidr_a
  availability_zone = var.availability_zone_a

  tags = {
    Name = var.infra_subnet_name_a
  }
}

resource "aws_subnet" "infra_subnet_b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.infra_subnet_cidr_b
  availability_zone = var.availability_zone_b

  tags = {
    Name = var.infra_subnet_name_b
  }
}

# Create Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.public_rt_name
  }
}

# Associate Public Subnets with Public Route Table
resource "aws_route_table_association" "public_rta_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rta_b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_rt.id
}

# Create Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = var.private_rt_name
  }
}

# Associate Private Subnets with Private Route Table
resource "aws_route_table_association" "private_rta_a" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rta_b" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.private_rt.id
}

# Create Database Route Table
resource "aws_route_table" "database_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = var.database_rt_name
  }
}

# Associate Database Subnets with Database Route Table
resource "aws_route_table_association" "database_rta_a" {
  subnet_id      = aws_subnet.database_subnet_a.id
  route_table_id = aws_route_table.database_rt.id
}

resource "aws_route_table_association" "database_rta_b" {
  subnet_id      = aws_subnet.database_subnet_b.id
  route_table_id = aws_route_table.database_rt.id
}

# Create Infra Route Table
resource "aws_route_table" "infra_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.infra_rt_name
  }
}

# Associate Infra Subnets with Infra Route Table
resource "aws_route_table_association" "infra_rta_a" {
  subnet_id      = aws_subnet.infra_subnet_a.id
  route_table_id = aws_route_table.infra_rt.id
}

resource "aws_route_table_association" "infra_rta_b" {
  subnet_id      = aws_subnet.infra_subnet_b.id
  route_table_id = aws_route_table.infra_rt.id
}
