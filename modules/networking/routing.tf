resource "aws_internet_gateway" "igw01" {
  vpc_id = aws_vpc.vpc-01.id
  tags = {
    "Name" = var.igw_name
  }
}

resource "aws_route_table" "rt-01" {
    vpc_id = aws_vpc.vpc-01.id
    tags = {
      "Name" = var.route_table_name
    }
  
}

resource "aws_route" "r-01" {
    route_table_id = aws_route_table.rt-01.id
    gateway_id = aws_internet_gateway.igw01.id
    destination_cidr_block = ["0.0.0.0/0"]

}

resource "aws_route_table_association" "rta-01" {
    route_table_id = aws_route_table.rt-01.id
    subnet_id = aws_subnet.public_subnet.id
}