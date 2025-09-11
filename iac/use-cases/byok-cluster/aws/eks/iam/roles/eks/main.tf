module "eks_cluster_role" {
  source                = "../../../../../../../modules/aws/iam/role/"

  name                  = "EKSRole-${var.aws_account}-poc-aws-msk"
  description           = "IAM Role for the owner of ${var.eks_cluster_name} EKS Cluster."
  assume_role_policy    = data.aws_iam_policy_document.eks_trust_policy.json
}

module "eks_cluster_role_policy_attachment" {
  source        = "../../../../../../../modules/aws/iam/policy-attachment/"

  role_name     = module.eks_cluster_role.name
  policy_arn    = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
