resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"
  tags                 = var.vpc_tag

}


resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.subnet_az
  tags              = var.vpc_tag

}

#Creating internet Gateway
resource "aws_internet_gateway" "shivani-gateway" {
  vpc_id =aws_vpc.vpc.id
  tags = {
    Name    = "shivani-subnet"
    Owner   = "shivani.sharma@cloudeq.com"
    Purpose = "training"
  }
}


# This is my Route
resource "aws_route_table" "shivani-route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.shivani-gateway.id
  }

  tags = {
    Name    = "shivani-route"
    Owner   = "shivani.sharma@cloudeq.com"
    Purpose = "training"
  }
}

#for subnet-1
resource "aws_route_table_association" "shivani-crta-public-subnet-1" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.shivani-route.id
}


# Creating aws Security Group
resource "aws_security_group" "shivani-security" {
  vpc_id = aws_vpc.vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "shivani-security"
    Owner   = "shivani.sharma@cloudeq.com"
    Purpose = "training"
  }
}