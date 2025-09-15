# Static, account-specific mapping (example only; replace with yours!)
variable "az_name_to_id" {
  type = map(string)
  default = {
    "us-east-1a" = "use1-az6"
    "us-east-1b" = "use1-az1"
    "us-east-1c" = "use1-az2"
  }
}

locals {
  confluent_zone_ids = [
    for n in data.terraform_remote_state.aws_vpc.outputs.azs :
    try(var.az_name_to_id[n],
      (throw("AZ name ${n} missing in az_name_to_id; update the map.")) # fail-fast if missing
    )
  ]
}

module "network" {
  source            = "../../../../modules/confluent/network-aws"

  display_name      = "network-${var.environment}"
  region            = var.region
  zones             = local.confluent_zone_ids
  environment_id    = data.terraform_remote_state.confluent_environment.outputs.id
}
