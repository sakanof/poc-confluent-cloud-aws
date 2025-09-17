data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../../networking/vpc/terraform.tfstate"
  }
}

data "terraform_remote_state" "ssh_sg" {
  backend = "local"
  config = {
    path = "../../networking/security-groups/ssh-access/terraform.tfstate"
  }
}

data "terraform_remote_state" "confluent_privatelink" {
  backend = "local"
  config = {
    path = "../../networking/private-link/terraform.tfstate"
  }
}

data "terraform_remote_state" "confluent_cluster" {
  backend = "local"
  config = {
    path = "../../../confluent/cluster/terraform.tfstate"
  }
}

data "terraform_remote_state" "producer_identity_pool" {
  backend = "local"
  config = {
    path = "../../../confluent/identity-pool-producer/terraform.tfstate"
  }
}

data "terraform_remote_state" "role" {
  backend = "local"
  config = {
    path = "../../iam/roles/producer/terraform.tfstate"
  }
}
