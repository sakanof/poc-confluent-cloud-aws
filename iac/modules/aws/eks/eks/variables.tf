variable "eks_version" {
  type          = string
  default       = "1.31"
  description   = "EKS Version (default: 1.31)."
}

variable "eks_cluster_name" {
  type          = string
  default       = "poc-aws-msk-eks-cluster"
  description   = "EKS Cluster Name."
}

variable "role_arn" {
  type          = string
  description   = "EKS Role ARN."
}

variable "subnet_ids" {
  type          = list(string)
  description   = "EKS subnet IDs."
}
