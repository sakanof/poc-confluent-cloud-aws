resource "aws_iam_role_policy_attachment" "policy_attachment" {
  role       = data.terraform_remote_state.role.outputs.role_id
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
