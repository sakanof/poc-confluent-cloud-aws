data "terraform_remote_state" "kms_key" {
  backend = "local"
  config = {
    path = "../key/terraform.tfstate"
  }
}

data "terraform_remote_state" "confluent_byok" {
  backend = "local"
  config = {
    path = "../../../confluent/byok-aws/terraform.tfstate"
  }
}
