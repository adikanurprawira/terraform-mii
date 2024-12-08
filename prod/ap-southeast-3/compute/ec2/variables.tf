variable "ssh_public_key" {
  type        = string
  description = "public key used for ec2 instances"
}

variable "ssh_cidr_whitelist" {
  type        = list(string)
  description = "Allow SSH from CIDRs listed"
}

variable "bastion_private_ip" {
  type = string
  description = "Prefered private ip for bastion host"
}

variable "bastion_instance_type" {
  type = string
  description = "Instance type of bastion EC2"
}

variable "bastion_ami" {
  type = string
  description = "AMI of bastion EC2 instance"
}