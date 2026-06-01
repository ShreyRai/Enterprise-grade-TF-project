resource "aws_vpc" "vpc-01" {
  cidr_block = var.cidr_vpc
  tags = {
    "Name" = var.vpc_name
  }
}