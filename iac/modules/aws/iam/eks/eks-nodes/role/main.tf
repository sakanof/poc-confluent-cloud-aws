resource "aws_iam_role" "eks_nodesrole" {
  name               = "EKSNodesRole-${var.aws_account}-${var.cluster_name}"
  assume_role_policy = data.aws_iam_policy_document.eks_nodes_trust_policy.json
  description        = "IAM Role EKS Nodes Cluster."
}
