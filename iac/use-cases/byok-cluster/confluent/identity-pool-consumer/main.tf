module "identity_pool" {
  source                = "../../../../modules/confluent/identity-pool"

  name                  = var.name
  identity_provider_id  = data.terraform_remote_state.identity_provider.outputs.id
  namespace             = "poc-confluent-cloud-aws"
  service_account       = "read"
}
