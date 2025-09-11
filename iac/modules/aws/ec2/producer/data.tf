data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../../networking/vpc/terraform.tfstate"
  }
}

data "terraform_remote_state" "ssh_sg" {
  backend = "local"
  config = {
    path = "../../networking/security-groups/ssh/terraform.tfstate"
  }
}

data "terraform_remote_state" "msk_sg" {
  backend = "local"
  config = {
    path = "../../networking/security-groups/msk/terraform.tfstate"
  }
}

data "terraform_remote_state" "write_role" {
  backend = "local"
  config = {
    path = "../../iam/msk/subscriber-write/role/terraform.tfstate"
  }
}

data "terraform_remote_state" "msk" {
  backend = "local"
  config = {
    path = "../../msk/terraform.tfstate"
  }
}
