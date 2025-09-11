module "network" {
  source            = "../../../../modules/confluent/network-aws"

  display_name      = "network-${var.environment}"
  region            = var.region
  zones             = data.terraform_remote_state.aws_vpc.outputs.azs
  environment_id    = data.terraform_remote_state.confluent_environment.outputs.id
}
