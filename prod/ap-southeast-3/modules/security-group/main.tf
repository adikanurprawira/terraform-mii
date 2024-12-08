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

resource "aws_security_group" "allow_ssh" {
  #vpc_id      = data.terraform_remote_state.prod_networking_vpc.outputs.vpc_id
  vpc_id      = "vpc-02667db81b54736ba"
  name        = "terraform-mii-prod-bastion-ssh"
  description = "Security group that allow ssh and all egress traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  tags = merge(
    { Name = "terraform-mii-prod-allow-ssh" },
    module.required_tags.tags
  )
}