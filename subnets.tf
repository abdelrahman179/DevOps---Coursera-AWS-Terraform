# >>> Public Subnet 1 
resource "aws_subnet" "app-public-sub-1-a" {
  vpc_id                  = aws_vpc.app-vpc.id
  cidr_block              = var.public_subnets_cidr_block[0]
  map_public_ip_on_launch = true
  availability_zone       = var.AVAIL_ZONE[0]

  tags = {
    Name = "${var.ENVIRONMENT}-Public-Subnet-1-AZ-A"
  }
}

# >>> Public Subnet 2 
resource "aws_subnet" "app-public-sub-2-b" {
  vpc_id                  = aws_vpc.app-vpc.id
  cidr_block              = var.public_subnets_cidr_block[1]
  map_public_ip_on_launch = true
  availability_zone       = var.AVAIL_ZONE[1]

  tags = {
    Name = "${var.ENVIRONMENT}-Public-Subnet-2-AZ-B"
  }
}

# >>> Private Subnet 1 
resource "aws_subnet" "app-private-sub-1-a" {
  vpc_id                  = aws_vpc.app-vpc.id
  cidr_block              = var.private_subnets_cidr_block[0]
  map_public_ip_on_launch = false
  availability_zone       = var.AVAIL_ZONE[0]

  tags = {
    Name = "${var.ENVIRONMENT}-Private-Subnet-1-AZ-A"
  }
}

# >>> Private Subnet 2 
resource "aws_subnet" "app-private-sub-2-b" {
  vpc_id                  = aws_vpc.app-vpc.id
  cidr_block              = var.private_subnets_cidr_block[1]
  map_public_ip_on_launch = false
  availability_zone       = var.AVAIL_ZONE[1]

  tags = {
    Name = "${var.ENVIRONMENT}-Private-Subnet-2-AZ-B"
  }
}
