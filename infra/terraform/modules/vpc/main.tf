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
}