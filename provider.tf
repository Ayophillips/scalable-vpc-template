provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = ">= 1.0.0"
  backend "s3" {
    bucket         = "apinfra-remote-state"
    dynamodb_table = "apinfra-remote-state-locking"
    key            = "global/apinfraStateFile/terraform.tfstate"
    region         = var.aws_region
    encrypt        = true
  }
}
