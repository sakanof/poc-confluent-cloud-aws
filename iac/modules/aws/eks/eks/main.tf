resource "aws_eks_cluster" "eks" {
  name      = var.eks_cluster_name

  version   = var.eks_version

  role_arn  = var.role_arn

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true
    subnet_ids              = var.subnet_ids
  }

  access_config {
    authentication_mode                         = "API"
    bootstrap_cluster_creator_admin_permissions = true
  }
}
