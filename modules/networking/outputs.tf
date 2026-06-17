output "vpc_id" {
    value = aws_vpc.vpc-01.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "prod_private_subnet_ids" {
  value = aws_subnet.prod-private-subnet[*].id
}