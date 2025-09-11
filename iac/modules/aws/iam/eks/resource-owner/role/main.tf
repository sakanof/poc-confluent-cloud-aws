resource "aws_iam_role" "ec2_eks_resource_owner" {
  name               = "EKSResourceOwnerRole-${var.aws_account}-${var.cluster_name}"
  assume_role_policy = data.aws_iam_policy_document.ec2_trust_policy.json
  description        = "IAM Role for the owner of ${var.aws_account}-${var.cluster_name} EKS."
}

resource "aws_iam_role_policy_attachment" "eks_resource_owner_policy_attachment" {
  role       = aws_iam_role.ec2_eks_resource_owner.name
  policy_arn = data.terraform_remote_state.permission_policy.outputs.policy_id
}
