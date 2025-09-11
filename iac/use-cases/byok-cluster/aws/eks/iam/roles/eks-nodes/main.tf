module "eks_cluster_node_role" {
  source                = "../../../../../../../modules/aws/iam/role/"

  name                  = "EKSNodesRole-${var.aws_account}-${var.eks_cluster_name}"
  description           = "IAM Role EKS Nodes Cluster."
  assume_role_policy    = data.aws_iam_policy_document.eks_nodes_trust_policy.json
}

module "eks_cluster_worker_node_policy_attachment" {
  source        = "../../../../../../../modules/aws/iam/policy-attachment/"

  role_name     = module.eks_cluster_node_role.name
  policy_arn    = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

module "eks_cluster_cni_policy_attachment" {
  source        = "../../../../../../../modules/aws/iam/policy-attachment/"

  role_name     = module.eks_cluster_node_role.name
  policy_arn    = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

module "eks_cluster_container_registry_policy_attachment" {
  source        = "../../../../../../../modules/aws/iam/policy-attachment/"

  role_name     = module.eks_cluster_node_role.name
  policy_arn    = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
