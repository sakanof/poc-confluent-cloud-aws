data "aws_iam_policy_document" "msk_admin" {
  version = "2012-10-17"
  statement {

    effect    = "Allow"
    actions   = [
      "ec2:DeleteVpcEndpoints",
      "ec2:DescribeVpcs",
      "ec2:CreateVpcEndpoint",
      "ec2:CreateTags",
      "ec2:DescribeVpcEndpoints",
      "ec2:DescribeSubnets",
      "ec2:DescribeVpcAttribute",
      "ec2:DescribeRouteTables",
      "ec2:DescribeSecurityGroups",
    ]
    resources = ["arn:aws:ec2:*:${var.aws_account}:*"]
  }

  statement {
    effect    = "Allow"
    actions   = [
      "iam:CreateServiceLinkedRole",
      "iam:AttachRolePolicy",
      "iam:PutRolePolicy",
    ]
    resources = [
      "arn:aws:iam::${var.aws_account}:role/*",
    ]
  }

  statement {
    effect    = "Allow"
    actions   = [
      "kms:DescribeKey",
      "kms:RetireGrant",
      "kms:CreateGrant",
    ]
    resources = [
      "arn:aws:kms:*:${var.aws_account}:key/*",
    ]
  }

  statement {
    effect    = "Allow"
    actions   = [
      "kafka:*",
    ]
    resources = [
      "arn:aws:kafka:*:${var.aws_account}:cluster/*/*",
      "arn:aws:kafka:*:${var.aws_account}:replicator/*/*",
      "arn:aws:kafka:*:${var.aws_account}:configuration/*/*",
      "arn:aws:kafka:*:${var.aws_account}:vpc-connection/*/*/*",
    ]
  }
}
