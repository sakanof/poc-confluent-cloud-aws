module "private_link" {
  source                = "../../../../modules/confluent/private-link-aws"

  display_name          = "Azure Private Link Access"
  environment_id        = data.terraform_remote_state.confluent_environment.outputs.id
  network_id            = data.terraform_remote_state.network.outputs.id
  aws_account_id        = var.aws_account_id
}
