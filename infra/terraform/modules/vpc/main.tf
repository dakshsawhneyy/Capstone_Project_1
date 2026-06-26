resource "aws_vpc" "demo" {
  cidr_block = var.vpc_cidr
  tags = {
    env = var.env
  }
}

resource "aws_subnet" "demo" {
  vpc_id = aws_vpc.demo.id
  cidr_block = var.subnet_cidr
  tags = {
    env = var.env
  }
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1a"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demo.id

  tags = {
    env = var.env
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    env = var.env
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.demo.id
  route_table_id = aws_route_table.public.id
}