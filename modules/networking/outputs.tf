output "vpc_id" {
    value = aws_vpc.vpc-01.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "igw_id" {
  value = aws_internet_gateway.igw01.id
}
