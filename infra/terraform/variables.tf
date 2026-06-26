# ── VPC ──────────────────────────────────────────────────────────────
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable "subnet_cidr" {
  type        = string
  default     = "10.0.0.0/24"
  description = "CIDR block for the public subnet"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "Deployment environment (dev / staging / prod)"
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

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Extra tags to apply to resources"
}
