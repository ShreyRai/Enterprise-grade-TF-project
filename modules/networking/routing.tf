resource "aws_internet_gateway" "igw01" {
  vpc_id = aws_vpc.vpc-01.id
  tags = {
    "Name" = var.igw_name
  }
}

resource "aws_eip" "eip01" {
  domain = "vpc"
  tags = {
    "Name" = var.nat_eip_name
  }
}
resource "aws_nat_gateway" "nat01" {
  allocation_id = aws_eip.eip01.allocation_id
  subnet_id = aws_subnet.public_subnet.id
  depends_on = [aws_internet_gateway.igw01]
  tags = {
    "Name" = var.nat_gateway_name
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
    destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "rta-01" {
    route_table_id = aws_route_table.rt-01.id
    subnet_id = aws_subnet.public_subnet.id
}

resource "aws_route_table" "rt-02" {
    vpc_id = aws_vpc.vpc-01.id
    tags = {
      "Name" = var.route_table_name_2
    }
  
}

resource "aws_route" "r-02" {
    route_table_id = aws_route_table.rt-02.id
    #gateway_id = aws_internet_gateway.igw01.id
    nat_gateway_id = aws_nat_gateway.nat01.id
    destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "rta-02" {
    route_table_id = aws_route_table.rt-02.id
    subnet_id = aws_subnet.private_subnet.id
}