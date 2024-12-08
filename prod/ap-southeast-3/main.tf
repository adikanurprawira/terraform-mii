module "s3_module" {
  source  = "./modules/s3"
}

module "iam_module" {
  source  = "./modules/iam"
}

module "role_module" {
  source  = "./modules/role"
}

module "sg_module" {
  source  = "./modules/security-group"
}
