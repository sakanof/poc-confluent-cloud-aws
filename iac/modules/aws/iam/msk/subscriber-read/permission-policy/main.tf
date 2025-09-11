resource "aws_iam_policy" "msk_read_policy" {
  name        = "MskSubscriberReadPolicy-${var.aws_account}-${var.cluster_name}-${var.topic_name}"
  description = "Policy granting MSK Read Permissions to ${var.aws_account}-${data.terraform_remote_state.msk.outputs.cluster_uuid}-${var.topic_name} MSK topic."
  policy      = data.aws_iam_policy_document.msk_read_policy.json
}
