terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "privatelink" {
  source                   = "../../../../../modules/aws/networking/private-link"
  vpc_id                   = data.terraform_remote_state.vpc.outputs.vpc_id
  privatelink_service_name = "com.amazonaws.us-east-1.vpce.amazonaws.com"
  subnets_to_privatelink   = data.terraform_remote_state.vpc.private_subnets
  dns_domain               = "confluentcloud.poc.internal"
}
