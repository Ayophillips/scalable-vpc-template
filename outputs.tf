output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.apinfra_vpc.id
}

output "public_subnets" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.apinfra_public_subnet[*].id
}

output "private_subnets" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.apinfra_private_subnet[*].id
}

output "nat_gateways" {
  description = "The IDs of the NAT Gateways"
  value       = aws_nat_gateway.apinfra_nat_gateway[*].id
}

output "security_groups" {
  description = "The IDs of the security groups"
  value = [
    aws_security_group.apinfra_public_sg.id,
    aws_security_group.apinfra_private_sg.id
  ]
}
