data "terraform_remote_state" "msk" {
  backend = "local"
  config = {
    path = "../../../../msk/terraform.tfstate"
  }
}

data "aws_iam_policy_document" "msk_write_to_specific_topic" {
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
      "kafka-cluster:WriteData",
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
      "kafka-cluster:DescribeTransactionalId",
      "kafka-cluster:AlterTransactionalId",
    ]
    # The ARN format for a transactional ID typically includes a slash
    resources = [
      "arn:aws:kafka:${var.aws_region}:${var.aws_account}:transactional-id/*/${data.terraform_remote_state.msk.outputs.cluster_uuid}/${var.transaction_id}"
    ]
  }
}
