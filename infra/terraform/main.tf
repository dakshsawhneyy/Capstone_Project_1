# VPC
module "vpc" {
  source            = "./modules/vpc"
  vpc_cidr          = var.vpc_cidr
  subnet_cidr       = var.subnet_cidr
  env               = var.env
  az_1 = local.az_1
  az_2 = local.az_2
  cluster_name = var.cluster_name
}

# EC2
# module "ec2" {
#   source    = "./modules/ec2"
#   inst_name = var.inst_name
#   inst_type = var.inst_type
#   st_reqd   = var.st_reqd
#   tags      = var.tags

#   vpc_id    = module.vpc.vpc_id
#   subnet_id = module.vpc.subnet_id
# }

module "eks" {
  source             = "./modules/eks"
  cluster_name       = var.cluster_name
  k8s_version        = var.k8s_version
  subnet_ids         = module.vpc.subnet_ids   # both subnets from VPC module
  node_instance_type = var.node_instance_type
  desired_nodes      = var.desired_nodes
  min_nodes          = var.min_nodes
  max_nodes          = var.max_nodes
  tags               = var.tags
}
