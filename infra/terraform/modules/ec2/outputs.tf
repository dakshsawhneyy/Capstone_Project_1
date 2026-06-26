output "instance_id" {
  value = aws_instance.ec2_instance.id
}

output "instance_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "instance_private_ip" {
  value = aws_instance.ec2_instance.private_ip
}

output "instance_security_group_id" {
  value = aws_security_group.ec2_sg.id
}

output "instance_type" {
  value = aws_instance.ec2_instance.instance_type
}