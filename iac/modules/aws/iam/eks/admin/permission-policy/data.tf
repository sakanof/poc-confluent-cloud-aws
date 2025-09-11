data "aws_iam_policy_document" "eks_admin" {
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
      "eks:DescribeClusterVersions",
      "eks:ListEksAnywhereSubscriptions",
      "eks:DescribeAddonConfiguration",
      "eks:CreateEksAnywhereSubscription",
      "eks:ListAccessPolicies",
      "eks:ListClusters",
      "eks:DescribeAddonVersions",
      "eks:RegisterCluster",
      "eks:CreateCluster"
    ]
    resources = [
      "arn:aws:iam::${var.aws_account}:role/*",
    ]
  }

  statement {
    effect    = "Allow"
    actions   = [
      "eks:*"
    ]
    resources = [
      "arn:aws:eks:*:${var.aws_account}:fargateprofile/*/*/*",
      "arn:aws:eks:*:${var.aws_account}:access-entry/*/*/*/*/*",
      "arn:aws:eks:*:${var.aws_account}:nodegroup/*/*/*",
      "arn:aws:eks:*:${var.aws_account}:identityproviderconfig/*/*/*/*",
      "arn:aws:eks:*:${var.aws_account}:podidentityassociation/*/*",
      "arn:aws:eks:*:${var.aws_account}:addon/*/*/*",
      "arn:aws:eks:*:${var.aws_account}:eks-anywhere-subscription/*",
      "arn:aws:eks:*:${var.aws_account}:cluster/*",
    ]
  }
}
