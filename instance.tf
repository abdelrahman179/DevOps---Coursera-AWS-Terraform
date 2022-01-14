
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
  key_name   = "emp-dir-app"
  public_key = file(var.PUBLIC_KEY_LOC)

  tags = {
    Name = "${var.APP_PREFIX}-key-pair"
  }
}

# >>>>> Fetching default VPC to use in other resources 
data "aws_vpc" "default-vpc" {
  default = true
}

# >>>>> Programmatically fetching my public ip to use in ssh 
data "http" "my_public_ip" {
  url = "https://ifconfig.me"
}


# >>>>> Configuring the default security group
resource "aws_default_security_group" "default-sg" {
  vpc_id = data.aws_vpc.default-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.my_public_ip.body)}/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}

# >>>>> Creating the EC2 Instance
resource "aws_instance" "coursera_EC2" {
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type               = var.EC2_TYPE
  availability_zone           = var.AWS_REGION_AZ
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.employee-app-profile.name

  vpc_security_group_ids = [aws_default_security_group.default-sg.id]
  key_name               = aws_key_pair.ssh-key.id
  user_data              = <<EOF
  #!/bin/bash
  -ex
  wget https://aws-tc-largeobjects.s3-us-west-2.amazonaws.com/DEV-AWS-MO-GCNv2/FlaskApp.zip
  unzip FlaskApp.zip
  cd FlaskApp/
  yum -y install python3 mysql
  pip3 install -r requirements.txt
  amazon-linux-extras install epel
  yum -y install stress
  export PHOTOS_BUCKET=$SUB_PHOTOS_BUCKET
  export AWS_DEFAULT_REGION=us-west-2
  export DYNAMO_MODE=on
  FLASK_APP=application.py /usr/local/bin/flask run --host=0.0.0.0 --port=80

  EOF
  tags = {
    Name = "${var.APP_PREFIX}-directory"
  }
}

