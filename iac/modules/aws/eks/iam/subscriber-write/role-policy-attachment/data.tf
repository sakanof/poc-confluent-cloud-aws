data "terraform_remote_state" "policy" {
  backend = "local"
  config = {
    path = "../../../../iam/msk/subscriber-write/permission-policy/terraform.tfstate"
  }
}

data "terraform_remote_state" "role" {
  backend = "local"
  config = {
    path = "../role/terraform.tfstate"
  }
}
