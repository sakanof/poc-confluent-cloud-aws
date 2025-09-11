resource "aws_iam_role" "eks_msk_read_role" {
  name               = "EksSubscriberReadRole-${var.aws_account}-${var.cluster_name}-${var.topic_name}"
  assume_role_policy = data.aws_iam_policy_document.eks_trust_policy.json
  # description        = "IAM role that EKS pods can assume using ${var.read_service_account} Service Account to Read from ${var.aws_account}-${data.terraform_remote_state.msk.outputs.cluster_uuid}-${var.topic_name} MSK topic."
  description        = "IAM role that EKS pods can assume using ${var.read_service_account} Service Account to Read from ${var.aws_account}-${var.topic_name} MSK topic."
}
