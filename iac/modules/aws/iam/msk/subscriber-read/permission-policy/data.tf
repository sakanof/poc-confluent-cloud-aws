data "terraform_remote_state" "msk" {
  backend = "local"
  config = {
    path = "../../../../msk/terraform.tfstate"
  }
}

###############################################################################
# Permission Policy Document (MSK read Permissions)
###############################################################################
data "aws_iam_policy_document" "msk_read_policy" {
  statement {
    effect = "Allow"
    actions = [
      "kafka-cluster:Connect",
    ]
    resources = [
      "arn:aws:kafka:${var.aws_region}:${var.aws_account}:cluster/*/${data.terraform_remote_state.msk.outputs.cluster_uuid}"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "kafka-cluster:ReadData",
      "kafka-cluster:DescribeTopic",
      "kafka-cluster:DescribeTopicDynamicConfiguration",
    ]
    resources = [
      "arn:aws:kafka:${var.aws_region}:${var.aws_account}:topic/*/*/${var.topic_name}"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "kafka-cluster:DescribeGroup",
      "kafka-cluster:AlterGroup",
      "kafka-cluster:DeleteGroup",
    ]
    resources = [
      "arn:aws:kafka:${var.aws_region}:${var.aws_account}:group/*/${data.terraform_remote_state.msk.outputs.cluster_uuid}/${var.group_name}"
    ]
  }
}
