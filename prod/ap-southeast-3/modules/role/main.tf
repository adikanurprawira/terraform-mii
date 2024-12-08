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

resource "aws_iam_role" "ec2_role" {
  name               = "Terraform-EC2InstanceRole"
  tags = merge(
    { Name = "Terraform-EC2InstanceRole" },
    module.required_tags.tags
  )
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ssm_access" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "Terraform-EC2InstanceProfile"
  role = aws_iam_role.ec2_role.name
}