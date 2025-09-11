data "terraform_remote_state" "msk" {
  backend = "local"
  config = {
    path = "../../../../msk/terraform.tfstate"
  }
}

data "aws_iam_policy_document" "msk_resource_owner_policy" {
  statement {
    effect = "Allow"
    actions = [
      "kafka-cluster:Connect",
      "kafka-cluster:WriteDataIdempotently",
    ]
    resources = [
      "arn:aws:kafka:${var.aws_region}:${var.aws_account}:cluster/*/${data.terraform_remote_state.msk.outputs.cluster_uuid}"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "kafka-cluster:CreateTopic",
      "kafka-cluster:DescribeTopic",
      "kafka-cluster:AlterTopic",
      "kafka-cluster:AlterTopicDynamicConfiguration",
      "kafka-cluster:DeleteTopic",
      "kafka-cluster:DescribeTopicDynamicConfiguration",
      "kafka-cluster:ReadData",
      "kafka-cluster:WriteData"
    ]
    resources = [
      "arn:aws:kafka:${var.aws_region}:${var.aws_account}:topic/*/*/${var.topic_name}"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "kafka-cluster:DescribeTransactionalId",
      "kafka-cluster:AlterTransactionalId",
    ]
    # The ARN format for a transactional ID typically includes a slash
    resources = [
      "arn:aws:kafka:${var.aws_region}:${var.aws_account}:transactional-id/*/${data.terraform_remote_state.msk.outputs.cluster_uuid}/${var.transaction_id}"
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
      "arn:aws:kafka:${var.aws_region}:${var.aws_account}:group/*/${data.terraform_remote_state.msk.outputs.cluster_uuid}/*"
    ]
  }
}
