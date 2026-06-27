# EC2
# output "instance_id"        { value = module.ec2.instance_id }
# output "instance_public_ip" { value = module.ec2.instance_public_ip }

# VPC
output "vpc_id"             { value = module.vpc.vpc_id }

# EKS
output "eks_cluster_name"     { value = module.eks.cluster_name }
output "eks_cluster_endpoint" { value = module.eks.cluster_endpoint }
