resource "aws_vpc" "apinfra_vpc" {
  cidr_block           = 
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "apinfra-vpc"
  }
}
