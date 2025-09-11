data "terraform_remote_state" "admin_policy" {
  backend = "local"
  config = {
    path = "../permission-policy/terraform.tfstate"
  }
}

data "terraform_remote_state" "admin_role" {
  backend = "local"
  config = {
    path = "../role/terraform.tfstate"
  }
}
