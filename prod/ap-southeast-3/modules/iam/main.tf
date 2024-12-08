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

# Create the IAM user
resource "aws_iam_user" "adika_user" {
  name = "adika.nurprawira@mii.co.id"
  tags = merge(
    { Name = "adika.nurprawira@mii.co.id" },
    module.required_tags.tags
  )
}

# Attach a policy to allow console access (modify as needed)
resource "aws_iam_user_policy_attachment" "adika_user_policy" {
  user       = aws_iam_user.adika_user.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess" # Replace with a suitable policy for your use case
}
