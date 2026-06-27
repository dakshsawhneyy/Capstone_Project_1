variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "k8s_version" {
  type        = string
  default     = "1.32"
  description = "Kubernetes version for the EKS cluster"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs (min 2, different AZs) for the EKS cluster and node group"
}

variable "node_instance_type" {
  type        = string
  default     = "t3.small"
  description = "EC2 instance type for worker nodes (t3.micro is too small for K8s)"
}

variable "desired_nodes" {
  type        = number
  default     = 2
  description = "Desired number of worker nodes"
}

variable "min_nodes" {
  type        = number
  default     = 2
  description = "Minimum number of worker nodes"
}

variable "max_nodes" {
  type        = number
  default     = 3
  description = "Maximum number of worker nodes"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to all EKS resources"
}
