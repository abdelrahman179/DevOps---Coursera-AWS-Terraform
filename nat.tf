resource "aws_eip" "app-vpc-nat" {
  vpc = true
}

resource "aws_nat_gateway" "app-vpc-nat-gw" {
  allocation_id = aws_eip.app-vpc-nat.id
  subnet_id     = aws_subnet.app-public-sub-1-a.id
  depends_on = [
    aws_internet_gateway.app-igw
  ]
  tags = {
    Name = "${var.ENVIRONMENT}-app-nat-gw"
  }
}
