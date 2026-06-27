output "vpc_id" {
  value = aws_vpc.demo.id
}

output "subnet_id" {
  description = "Primary public subnet (AZ-a) — used by EC2 module"
  value       = aws_subnet.public_1.id
}

output "subnet_ids" {
  description = "All public subnet IDs — used by EKS module"
  value       = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}
