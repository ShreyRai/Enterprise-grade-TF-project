data "aws_availability_zones" "available" {
  state = "available"
}

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

resource "aws_subnet" "prod-private-subnet" {
  count = var.enable_NAT ? var.count_prod_pub_sub : 0
  vpc_id = aws_vpc.vpc-01.id
  cidr_block = cidrsubnet(var.cidr_prod_private, 4, count.index + 3)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    "Name" = format("%s-%d", var.prod_private_subnet_name, count.index + 1)
  }
}