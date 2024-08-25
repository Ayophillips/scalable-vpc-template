resource "aws_eip" "apinfra_nat_eip" {
  count = length(var.public_subnet_cidrs)

  vpc = true

  tags = {
    Name = "apinfra-nat-eip-${count.index + 1}"
  }
}

resource "aws_nat_gateway" "apinfra_nat_gateway" {
  count         = length(var.public_subnet_cidrs)
  allocation_id = aws_eip.apinfra_nat_eip[count.index].id
  subnet_id     = aws_subnet.apinfra_public_subnet[count.index].id

  tags = {
    Name = "apinfra-nat-gateway-${count.index + 1}"
  }
}
