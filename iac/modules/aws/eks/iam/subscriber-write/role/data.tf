data "terraform_remote_state" "eks" {
  backend = "local"
  config = {
    path = "../../../eks/terraform.tfstate"
  }
}

data "terraform_remote_state" "permission_policy" {
  backend = "local"
  config = {
    path = "../../../../iam/msk/producer/permission-policy/terraform.tfstate"
  }
}

data "terraform_remote_state" "msk" {
  backend = "local"
  config = {
    path = "../../../../msk/terraform.tfstate"
  }
}

locals {
  issuer = replace(data.terraform_remote_state.eks.outputs.oidc_provider_url, "https://", "")
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
      values   = ["system:serviceaccount:${var.application_namespace}:${var.write_service_account}"]
    }
  }
}
