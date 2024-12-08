module "required_tags" {
  source        = "../../modules/terraform-tags"
  automation    = "terraform"
  business_unit = "terraform-mii-bu"
  application   = "terraform-mii"
  repo_url      = "https://github.com/adikanurprawira/terraform-mii.git"
  repo_path     = "prod/ap-southeast-3/compute/ec2"
  environment   = "Production"
  map-migrated  = "null"
}

resource "aws_key_pair" "terraform-mii_prod_masterkey" {
  key_name   = "terraform-mii-prod-masterkey"
  public_key = var.ssh_public_key

  tags = merge(
    { Name = "terraform-mii-prod-masterkey" },
    module.required_tags.tags
  )
}

resource "aws_instance" "terraform-mii_prod_bastion" {
  ami           = var.bastion_ami
  instance_type = var.bastion_instance_type
  subnet_id     = data.terraform_remote_state.prod_networking_vpc.outputs.private_subnet_ids[0]
  private_ip    = var.bastion_private_ip
  key_name      = aws_key_pair.terraform-mii_prod_masterkey.key_name
  iam_instance_profile = "Terraform-EC2InstanceProfile"
  vpc_security_group_ids = ["sg-0106da795e14b9b63"]
  user_data = file("${path.module}/scripts/userdata-bastion.sh")

  tags = merge(
    { Name = "terraform-mii-prod-bastion" },
    module.required_tags.tags
  )
}

