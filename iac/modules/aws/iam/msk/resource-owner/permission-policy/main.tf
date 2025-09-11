resource "aws_iam_policy" "msk_resource_owner_policy" {
  name        = "MskResourceOwnerPolicy-${var.aws_account}-${var.cluster_name}-${var.topic_name}"
  description = "Policy granting Resource Owner Permissions to ${var.aws_account}-${data.terraform_remote_state.msk.outputs.cluster_uuid}-${var.topic_name} MSK Topic."
  policy      = data.aws_iam_policy_document.msk_resource_owner_policy.json
}
