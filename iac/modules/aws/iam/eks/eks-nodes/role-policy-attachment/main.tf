resource "aws_iam_role_policy_attachment" "amazon_worker_node_policy_attachment" {
  role       = data.terraform_remote_state.role.outputs.role_id
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "amazon_eks_cni_policy_attachment" {
  role       = data.terraform_remote_state.role.outputs.role_id
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "amazon_ec2_container_registry_read_only_policy_attachment" {
  role       = data.terraform_remote_state.role.outputs.role_id
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
