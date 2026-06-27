resource "aws_vpc" "demo" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true   # required for EKS
  enable_dns_hostnames = true   # required for EKS

  tags = {
    Name = "${var.env}-vpc"
    env  = var.env
  }
}

# ── Subnet 1 (ap-south-1a) ───────────────────────────────────────────
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.demo.id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.az_1
  map_public_ip_on_launch = true

  tags = {
    Name                                        = "${var.env}-subnet-1"
    env                                         = var.env
    "kubernetes.io/role/elb"                    = "1"   # tells EKS this is a public subnet
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

# ── Subnet 2 (ap-south-1b) — EKS needs at least 2 AZs ──────────────
resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.demo.id
  cidr_block              = var.subnet_cidr_2
  availability_zone       = var.az_2
  map_public_ip_on_launch = true

  tags = {
    Name                                        = "${var.env}-subnet-2"
    env                                         = var.env
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

# ── Internet Gateway ─────────────────────────────────────────────────
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "${var.env}-igw"
    env  = var.env
  }
}

# ── Route Table ──────────────────────────────────────────────────────
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.env}-rt"
    env  = var.env
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}
