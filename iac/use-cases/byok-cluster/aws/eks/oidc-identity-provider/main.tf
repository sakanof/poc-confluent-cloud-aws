module "eks_oidc_provider" {
  source        = "../../../../../modules/aws/iam/oidc-identity-provider/"

  url           = data.terraform_remote_state.eks_cluster.outputs.oidc_provider_url
  client_ids    = ["sts.amazonaws.com"]
  tag_name      = "EKSOIDCProvider"
}
