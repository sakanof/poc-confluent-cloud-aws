data "terraform_remote_state" "admin_policy" {
  backend = "local"
  config = {
    path = "../permission-policy/terraform.tfstate"
  }
}

###############################################################################
# Trust Policy (EC2 Principal)
###############################################################################
data "aws_iam_policy_document" "admin_trust_policy" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }

  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRoleWithWebIdentity",
    ]

    principals {
      type        = "Federated"
      identifiers = [
        "arn:aws:iam::${var.aws_account}:oidc-provider/token.actions.githubusercontent.com"
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:${var.github_organization}/${var.github_repository}:*"]
    }
  }
}
