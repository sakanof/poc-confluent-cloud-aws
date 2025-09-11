resource "aws_iam_role" "ec2_msk_admin_role" {
  name                  = "MskAdminRole-${var.aws_account}"
  assume_role_policy    = data.aws_iam_policy_document.admin_trust_policy.json
  description           = "IAM Role to provision a MSK cluster."
}
