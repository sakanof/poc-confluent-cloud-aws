resource "aws_iam_policy" "eks_admin" {
  name          = "EKSAdminPolicy-${var.aws_account}"
  description   = "Policy granting EKS Admin Permissions to ${var.aws_account} account."
  policy        = data.aws_iam_policy_document.eks_admin.json
}
