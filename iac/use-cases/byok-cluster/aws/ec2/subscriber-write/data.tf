data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../../../main-account/networking/vpc/terraform.tfstate"
  }
}

data "terraform_remote_state" "msk" {
  backend = "local"
  config = {
    path = "../../../main-account/msk-cluster/terraform.tfstate"
  }
}

data "terraform_remote_state" "ssh_sg" {
  backend = "local"
  config = {
    path = "../../../main-account/networking/security-groups/ssh-access/terraform.tfstate"
  }
}

data "terraform_remote_state" "msk_sg" {
  backend = "local"
  config = {
    path = "../../../main-account/networking/security-groups/msk-access/terraform.tfstate"
  }
}

data "terraform_remote_state" "role" {
  backend = "local"
  config = {
    path = "../../iam/roles/subscriber-write/terraform.tfstate"
  }
}
