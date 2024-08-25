resource "aws_internet_gateway" "apinfra_igw" {
  vpc_id = aws_vpc.apinfra_vpc.id

  tags = {
    Name = "apinfra-igw"
  }
}
