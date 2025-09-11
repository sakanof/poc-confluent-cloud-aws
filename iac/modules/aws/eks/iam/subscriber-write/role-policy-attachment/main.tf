resource "aws_iam_role_policy_attachment" "eks_subscriber_write_policy_attachment" {
  role       = data.terraform_remote_state.role.outputs.role_id
  policy_arn = data.terraform_remote_state.policy.outputs.policy_id
}
