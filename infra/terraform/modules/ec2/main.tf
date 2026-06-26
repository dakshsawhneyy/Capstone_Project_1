resource "aws_security_group" "ec2_sg" {
  description = "Security group for ${var.inst_name} EC2 instance"
  vpc_id      = var.vpc_id

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
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.inst_name  # The key MUST be "Name" with a capital N
    Environment = "dev"
  }
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-019715e0d74f695be"
  instance_type = var.inst_type
  key_name = "general"
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  tags = {
    Name = var.inst_name  # The key MUST be "Name" with a capital N
    Environment = "dev"
  }
  associate_public_ip_address = true
}

resource "aws_ebs_volume" "ebs_volume" {
  count = var.st_reqd > 0 ? 1 : 0
  availability_zone = aws_instance.ec2_instance.availability_zone
  size              = var.st_reqd
  type              = "gp2"
  tags = var.tags
}

resource "aws_volume_attachment" "ebs_attach" {
  count       = var.st_reqd > 0 ? 1 : 0
  device_name = "/dev/sdh"
  volume_id = one(aws_ebs_volume.ebs_volume[*].id)
  instance_id = aws_instance.ec2_instance.id
}