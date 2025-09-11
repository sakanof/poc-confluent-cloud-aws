resource "aws_iam_role" "eks_admin" {
  name                  = "EKSAdminRole-${var.aws_account}"
  assume_role_policy    = data.aws_iam_policy_document.admin_trust_policy.json
  description           = "IAM Role to provision a EKS cluster."
}
