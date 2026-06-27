variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR block for public subnet 1 (AZ-a)"
}

variable "subnet_cidr_2" {
  type        = string
  default     = "10.0.1.0/24"
  description = "CIDR block for public subnet 2 (AZ-b) — required for EKS"
}

variable "env" {
  type        = string
  description = "Deployment environment label (dev / staging / prod)"
}

variable "az_1" {
  type        = string
  description = "First availability zone for subnet 1 (passed from root locals)"
}

variable "az_2" {
  type        = string
  description = "Second availability zone for subnet 2 (passed from root locals)"
}

variable "cluster_name" {
  type        = string
  default     = ""
  description = "EKS cluster name — used to tag subnets for EKS auto-discovery"
}
