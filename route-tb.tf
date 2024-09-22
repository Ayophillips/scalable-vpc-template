resource "aws_route_table" "apinfra_rtb_public" {
  vpc_id = aws_vpc.apinfra_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.apinfra_igw.id
  }

  tags = {
    Name = "apinfra-rtb-public"
  }
}

resource "aws_route_table_association" "apinfra_route_table_association" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.apinfra_public_subnet[count.index].id
  route_table_id = aws_route_table.apinfra_route_table.id
}

resource "aws_route_table" "apinfra_rtb_private" {
  vpc_id = aws_vpc.apinfra_vpc.id
  count  = length(var.private_subnet_cidrs)
  tags = {
    Name = "apinfra-rtb-private${count.index + 1}"
  }
}

resource "aws_route_table_association" "apinfra_route_table_association_private" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.apinfra_private_subnet[count.index].id
  route_table_id = aws_route_table.apinfra_rtb_private[count.index].id
}
