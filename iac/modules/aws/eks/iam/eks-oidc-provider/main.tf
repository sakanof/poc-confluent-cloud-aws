resource "aws_iam_openid_connect_provider" "eks_oidc_provider" {
  url = data.terraform_remote_state.eks.outputs.oidc_provider_url

  client_id_list = [
    "sts.amazonaws.com"
  ]

  tags = {
    Name = "EKSOIDCProvide-poc-aws-msk"
  }
}

