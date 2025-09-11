resource "aws_eks_node_group" "general" {
  cluster_name      = var.name
  version           = var.eks_version
  node_group_name   = "general"
  node_role_arn     = var.role_arn

  subnet_ids        = var.subnet_ids

  capacity_type     = "ON_DEMAND"
  instance_types    = var.instance_types

  scaling_config {
    desired_size    = 1
    max_size        = 10
    min_size        = 0
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "general"
  }

  # Allow external changes without terraform plan difference
  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }
}
