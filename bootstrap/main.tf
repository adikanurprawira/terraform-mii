resource "aws_s3_bucket" "rpp-prod-tfstate-ap-southeast-3" {
  bucket = "terraform-mii-tfstate-ap-southeast-3"
}

resource "aws_dynamodb_table" "terraform-lock" {
  name           = "terraform-mii-tfstate-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Name" = "DynamoDB Terraform state lock table"
  }
}