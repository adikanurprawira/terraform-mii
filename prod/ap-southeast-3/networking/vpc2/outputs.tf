# outputs.tf

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public_subnet_a.id,
    aws_subnet.public_subnet_b.id
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_subnet_a.id,
    aws_subnet.private_subnet_b.id
  ]
}

output "database_subnet_ids" {
  value = [
    aws_subnet.database_subnet_a.id,
    aws_subnet.database_subnet_b.id
  ]
}

output "infra_subnet_ids" {
  value = [
    aws_subnet.infra_subnet_a.id,
    aws_subnet.infra_subnet_b.id
  ]
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gw.id
}

output "nat_gateway_eip_id" {
  value = aws_eip.nat_gw_eip.id
}

output "vpc_endpoint_s3_id" {
  value = aws_vpc_endpoint.s3.id
}
