terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

module "privatelink" {
  source                            = "../../../../../modules/aws/networking/private-link"

  bootstrap_prefix                  = data.terraform_remote_state.confluent_cluster.outputs.bootstrap_endpoint
  confluent_dns_domain              = data.terraform_remote_state.confluent_network.outputs.dns_domain
  vpc_id                            = data.terraform_remote_state.vpc.outputs.vpc_id
  private_link_endpoint_service     = data.terraform_remote_state.confluent_network.outputs.private_link_endpoint_service

  subnets_to_privatelink            = data.terraform_remote_state.vpc.outputs.private_azs_map
}
