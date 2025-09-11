data "aws_iam_policy_document" "eks_resource_owner" {
  statement {
    effect = "Allow"
    actions = [
      "eks:*",
    ]
    resources = [
      "arn:aws:eks:${var.aws_region}:${var.aws_account}:cluster/${var.cluster_name}",
      "arn:aws:eks:${var.aws_region}:${var.aws_account}:nodegroup/${var.cluster_name}/*",
      "arn:aws:eks:${var.aws_region}:${var.aws_account}:addon/${var.cluster_name}/*",
      "arn:aws:eks:${var.aws_region}:${var.aws_account}:fargateprofile/${var.cluster_name}/*",
      "arn:aws:eks:${var.aws_region}:${var.aws_account}:identityproviderconfig/${var.cluster_name}/*",
      "arn:aws:eks:${var.aws_region}:${var.aws_account}:podidentityassociation/${var.cluster_name}/*",
      "arn:aws:eks:${var.aws_region}:${var.aws_account}:access-entry/${var.cluster_name}/*",
    ]
  }
}
