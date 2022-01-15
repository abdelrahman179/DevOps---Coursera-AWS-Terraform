# >>> Public Routing Table
resource "aws_route_table" "app-vpc-pub-rtb" {
  vpc_id = aws_vpc.app-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app-igw.id
  }

  tags = {
    Name = "${var.ENVIRONMENT}-app-routetable-public"
  }
}

# >>> Public Routing table association with two pub subnets
resource "aws_route_table_association" "app-vpc-pub-sub-1-a" {
  subnet_id      = aws_subnet.app-public-sub-1-a.id
  route_table_id = aws_route_table.app-vpc-pub-rtb.id
}

resource "aws_route_table_association" "app-vpc-pub-sub-2-b" {
  subnet_id      = aws_subnet.app-public-sub-2-b.id
  route_table_id = aws_route_table.app-vpc-pub-rtb.id
}


# >>> Private Routing Table
resource "aws_route_table" "app-vpc-pri-rtb" {
  vpc_id = aws_vpc.app-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.app-vpc-nat-gw.id
  }

  tags = {
    Name = "${var.ENVIRONMENT}-app-routetable-private"
  }
}

# >>> Private Routing table association with two pub subnets
resource "aws_route_table_association" "app-vpc-pri-sub-1-a" {
  subnet_id      = aws_subnet.app-private-sub-1-a.id
  route_table_id = aws_route_table.app-vpc-pri-rtb.id
}

resource "aws_route_table_association" "app-vpc-pri-sub-2-b" {
  subnet_id      = aws_subnet.app-private-sub-2-b.id
  route_table_id = aws_route_table.app-vpc-pri-rtb.id
}
