# VPC
module "vpc" {
  source            = "./modules/vpc"
  vpc_cidr          = var.vpc_cidr
  subnet_cidr       = var.subnet_cidr
  env               = var.env
}

# EC2
module "ec2" {
  source    = "./modules/ec2"
  inst_name = var.inst_name
  inst_type = var.inst_type
  st_reqd   = var.st_reqd
  tags      = var.tags

  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
}
