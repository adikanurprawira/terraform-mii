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

resource "aws_s3_bucket" "adika-terraform-mii" {
  bucket = "adika-terraform-mii"

  tags = merge(
    { Name = "terraform-mii-prod-s3" },
    module.required_tags.tags
  )
}