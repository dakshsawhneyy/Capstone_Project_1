# ── Common ───────────────────────────────────────────────────────────
variable "env" {
  type        = string
  default     = "dev"
  description = "Deployment environment (dev / staging / prod)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Extra tags to apply to all resources"
}

# ── VPC ──────────────────────────────────────────────────────────────
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable "subnet_cidr" {
  type        = string
  default     = "10.0.0.0/24"
  description = "CIDR block for public subnet 1 (AZ-a)"
}

variable "subnet_cidr_2" {
  type        = string
  default     = "10.0.1.0/24"
  description = "CIDR block for public subnet 2 (AZ-b) — required for EKS"
}

# ── EC2 ──────────────────────────────────────────────────────────────
variable "inst_name" {
  type        = string
  default     = "my-server"
  description = "Name tag for the EC2 instance"
}

variable "inst_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type"
}

variable "st_reqd" {
  type        = number
  default     = 8
  description = "Extra EBS storage in GB (0 = no extra volume)"
}

variable "allowed_ssh_cidr" {
  type        = string
  default     = "0.0.0.0/0"
  description = "CIDR allowed to reach port 22 — restrict to your IP in production"
}

# ── EKS ──────────────────────────────────────────────────────────────
variable "cluster_name" {
  type        = string
  default     = "capstone-eks"
  description = "Name of the EKS cluster"
}

variable "k8s_version" {
  type        = string
  default     = "1.32"
  description = "Kubernetes version for the EKS cluster"
}

variable "node_instance_type" {
  type        = string
  default     = "m7i-flex.large"
  description = "EC2 instance type for EKS worker nodes"
}

variable "desired_nodes" {
  type        = number
  default     = 2
  description = "Desired number of worker nodes"
}

variable "min_nodes" {
  type        = number
  default     = 1
  description = "Minimum number of worker nodes"
}

variable "max_nodes" {
  type        = number
  default     = 3
  description = "Maximum number of worker nodes"
}
