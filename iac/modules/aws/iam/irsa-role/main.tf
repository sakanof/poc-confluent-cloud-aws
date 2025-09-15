locals {
  issuer = replace(var.issuer, "https://", "")
}

data "aws_iam_policy_document" "eks_trust_policy" {
  statement {
    effect    = "Allow"
    actions   = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${var.aws_account}:oidc-provider/${local.issuer}"]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.issuer}:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.issuer}:sub"
      values   = ["system:serviceaccount:${var.namespace}:${var.service_account}"]
    }
  }
}

resource "aws_iam_role" "this" {
  name = "eks-${var.aws_account}-${var.namespace}-${var.service_account}-role"
  assume_role_policy = data.aws_iam_policy_document.app_assume_role.json
}