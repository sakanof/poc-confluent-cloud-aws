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

data "terraform_remote_state" "msk_console_sg" {
  backend = "local"
  config = {
    path = "../../networking/security-groups/msk-console/terraform.tfstate"
  }
}

data "terraform_remote_state" "msk_sg" {
  backend = "local"
  config = {
    path = "../../networking/security-groups/msk/terraform.tfstate"
  }
}

data "terraform_remote_state" "resource_owner_role" {
  backend = "local"
  config = {
    path = "../../iam/msk/topic-owner/role/terraform.tfstate"
  }
}

data "terraform_remote_state" "msk" {
  backend = "local"
  config = {
    path = "../../msk/terraform.tfstate"
  }
}
