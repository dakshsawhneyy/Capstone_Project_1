variable "subnet_id" {
  type        = string
  description = "ID of the subnet (from VPC module) to launch the EC2 instance in"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC (from VPC module) to attach the security group to"
}

variable "inst_name" {
  type        = string
  description = "Name of the EC2 instance"
}

variable "inst_type" {
  type        = string
  default     = "t2.micro"
  description = "Type of the EC2 instance"
}

variable "st_reqd" {
  type        = number
  default     = 8
  description = "Storage required for the EC2 instance"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags for the EC2 instance"
}