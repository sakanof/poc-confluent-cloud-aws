data "terraform_remote_state" "permission_policy" {
  backend = "local"
  config = {
    path = "../permission-policy/terraform.tfstate"
  }
}

data "terraform_remote_state" "msk" {
  backend = "local"
  config = {
    path = "../../../../msk/terraform.tfstate"
  }
}

data "aws_iam_policy_document" "ec2_trust_policy" {
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
}
