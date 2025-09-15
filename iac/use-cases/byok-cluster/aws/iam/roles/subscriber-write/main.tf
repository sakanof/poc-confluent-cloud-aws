module "subscriber_write_role" {
  source                = "../../../../../../modules/aws/iam/irsa-role/"

  issuer          = data.terraform_remote_state.eks_cluster.outputs.oidc_provider_url
  aws_account     = var.aws_account
  namespace       = "subscriber"
  service_account = "write"
}