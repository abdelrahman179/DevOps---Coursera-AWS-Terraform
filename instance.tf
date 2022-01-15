
# >>>>> Fetching ami image id to use in other resources
data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = [var.AMI_OWNER]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# >>>>> Creating key pairs of use in ec2 resource
resource "aws_key_pair" "ssh-key" {
  key_name   = "Employee directory app key pair"
  public_key = file(var.PUBLIC_KEY_LOC)

  tags = {
    Name = "${var.ENVIRONMENT}-app-key-pair"
  }
}

# >>>>> Programmatically fetching my public ip to use in ssh 
data "http" "my_public_ip" {
  url = "https://ifconfig.me"
}



# >>>>> Creating the EC2 Instance
resource "aws_instance" "employee-directory-app" {
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type               = var.EC2_TYPE
  availability_zone           = var.AVAIL_ZONE[0]
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.employee-app-profile.name
  subnet_id                   = aws_subnet.app-public-sub-1-a.id
  vpc_security_group_ids      = [aws_security_group.web-sg.id]
  key_name                    = aws_key_pair.ssh-key.id
  user_data                   = file("instance-script.sh")
  tags = {
    Name = "${var.ENVIRONMENT}-employee-directory-app"
  }
}

