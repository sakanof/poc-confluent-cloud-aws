resource "aws_iam_policy" "permission_policy" {
  name        = "MskSubscriberWritePolicy-${var.aws_account}-${var.cluster_name}-${var.topic_name}"
  description = "Policy granting Write permissions to ${var.aws_account}-${data.terraform_remote_state.msk.outputs.cluster_uuid}-${var.topic_name} MSK Topic."
  policy      = data.aws_iam_policy_document.msk_write_to_specific_topic.json
}
