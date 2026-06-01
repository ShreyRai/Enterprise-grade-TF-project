resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc-01.id
  cidr_block = var.cidr_public
  tags = {
    "Name" = var.public_subnet_name
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc-01.id
  cidr_block = var.cidr_private
  tags = {
    "Name" = var.private_subnet_name
  }
}