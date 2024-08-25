provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

terraform {
  required_version = ">= 1.0.0"
  backend "s3" {
    bucket  = var.terraform_state_bucket
    key     = var.terraform_state_key
    region  = var.aws_region
    encrypt = true
  }
}
