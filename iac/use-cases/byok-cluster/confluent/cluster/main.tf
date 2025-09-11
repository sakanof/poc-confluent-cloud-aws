data "azurerm_client_config" "current" {}

module "cluster" {
  source            = "../../../../modules/confluent/cluster"

  cluster_name      = "poc-confluent-cloud-aws"
  availability      = "SINGLE_ZONE"
  cloud             = data.terraform_remote_state.network.outputs.cloud
  region            = data.terraform_remote_state.network.outputs.region
  environment_id    = data.terraform_remote_state.confluent_environment.outputs.id
  network_id        = data.terraform_remote_state.network.outputs.id
  byok_key_id       = data.terraform_remote_state.byok.outputs.id
}
