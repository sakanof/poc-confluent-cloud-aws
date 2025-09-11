data "aws_iam_policy_document" "main" {
  statement {
    sid     = "Allow KMS Use"
    effect  = "Allow"
    actions = var.kms_actions

    principals {
      identifiers = var.kms_use_roles
      type        = "AWS"
    }

    resources = ["*"]
  }

  statement {
    sid     = "Enable IAM User Permissions"
    effect  = "Allow"
    actions = ["*"]

    resources = ["*"]

    principals {
      identifiers = [var.aws_root_arn]
      type        = "AWS"
    }
  }
}

resource "aws_kms_key_policy" "main" {
  key_id = var.kms_key_id
  policy = data.aws_iam_policy_document.main.json
}
