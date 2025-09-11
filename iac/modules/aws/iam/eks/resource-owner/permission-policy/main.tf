resource "aws_iam_policy" "eks_resource_owner" {
  name        = "EKSResourceOwnerPolicy-${var.aws_account}-${var.cluster_name}"
  description = "Policy granting Resource Owner Permissions to ${var.aws_account}-${var.cluster_name} EKS."
  policy      = data.aws_iam_policy_document.eks_resource_owner.json
}
