resource "aws_iam_role" "ec2_msk_resource_owner_role" {
  name               = "MskResourceOwnerRole-${var.aws_account}-${var.cluster_name}-${var.topic_name}"
  assume_role_policy = data.aws_iam_policy_document.ec2_trust_policy.json
  description        = "IAM Role for the owner of ${var.cluster_name}-${var.topic_name} MSK topic."
}
