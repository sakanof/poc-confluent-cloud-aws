module "identity_provider" {
  source        = "../../../../modules/confluent/identity-provider"

  name          = var.name
  description   = var.name
  issuer        = data.terraform_remote_state.eks.outputs.oidc_provider_url
}