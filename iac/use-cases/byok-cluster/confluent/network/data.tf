data "terraform_remote_state" "confluent_environment" {
  backend = "local"
  config = {
    path = "../environment/terraform.tfstate"
  }
}

data "terraform_remote_state" "aws_vpc" {
  backend = "local"
  config = {
    path = "../../../aws/networking/vpc/terraform.tfstate"
  }
}
