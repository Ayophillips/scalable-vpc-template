resource "aws_route_table" "apinfra_route_table" {
  vpc_id = aws_vpc.apinfra_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.apinfra_igw.id
  }

  tags = {
    Name = "apinfra-route-table"
  }
}

resource "aws_route_table_association" "apinfra_route_table_association" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.apinfra_public_subnet[count.index].id
  route_table_id = aws_route_table.apinfra_route_table.id
}
