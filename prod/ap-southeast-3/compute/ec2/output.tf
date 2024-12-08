output "bastion_host_private_ip" {
  description = "Private IP address of jenkins EC2 instance"
  value       = aws_instance.terraform-mii_prod_bastion.private_ip
}
