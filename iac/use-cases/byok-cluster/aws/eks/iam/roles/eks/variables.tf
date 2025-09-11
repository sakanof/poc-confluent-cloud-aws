variable "aws_account" {
  type          = string
  default       = "891377173254"
  description   = "AWS Account ID (12-digit)."
}

variable "eks_cluster_name" {
  type          = string
  default       = "poc-aws-msk-eks-cluster"
  description   = "EKS Cluster Name."
}
