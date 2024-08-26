resource "aws_security_group" "apinfra_public_sg" {
  name        = "apinfra-public-sg"
  description = "Public security group for apinfra"
  vpc_id      = aws_vpc.apinfra_vpc.id
  tags = {
    Name = "apinfra-public-sg"
  }
}

resource "aws_security_group" "apinfra_private_sg" {
  name        = "apinfra-private-sg"
  description = "Private security group for apinfra"
  vpc_id      = aws_vpc.apinfra_vpc.id
  tags = {
    Name = "apinfra-private-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "apinfra_public_sg_ingress_http" {
  security_group_id = aws_security_group.apinfra_public_sg.id
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "apinfra_public_sg_ingress_https" {
  security_group_id = aws_security_group.apinfra_public_sg.id
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "apinfra_public_sg_egress" {
  security_group_id = aws_security_group.apinfra_public_sg.id
  ip_protocol       = "-1"
  from_port         = 0
  to_port           = 0
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "apinfra_private_sg_ingress_postgres" {
  security_group_id = aws_security_group.apinfra_private_sg.id
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_ipv4         = aws_vpc.apinfra_vpc.cidr_block
}

resource "aws_vpc_security_group_egress_rule" "apinfra_private_sg_egress" {
  security_group_id = aws_security_group.apinfra_private_sg.id
  ip_protocol       = "-1"
  from_port         = 0
  to_port           = 0
  cidr_ipv4         = "0.0.0.0/0"
}
