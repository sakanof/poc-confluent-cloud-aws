resource "aws_iam_role_policy_attachment" "admin_policy_attachment" {
  role       = data.terraform_remote_state.admin_role.outputs.admin_role_id
  policy_arn = data.terraform_remote_state.admin_policy.outputs.admin_policy_id
}
