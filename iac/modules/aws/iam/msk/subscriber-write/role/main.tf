resource "aws_iam_role" "ec2_msk_write_role" {
  name               = "MskSubscriberWriteRole-${var.aws_account}-${var.cluster_name}-${var.topic_name}"
  assume_role_policy = data.aws_iam_policy_document.ec2_trust_policy.json
  description        = "IAM role that an EC2 instance can assume to write to ${var.aws_account}-${data.terraform_remote_state.msk.outputs.cluster_uuid}-${var.topic_name} MSK topic."
}
