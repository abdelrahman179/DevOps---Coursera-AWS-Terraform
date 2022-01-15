# >>> Internet Gateway
resource "aws_internet_gateway" "app-igw" {
  vpc_id = aws_vpc.app-vpc.id

  tags = {
    Name = "${var.ENVIRONMENT}-app-igw"
  }
}
