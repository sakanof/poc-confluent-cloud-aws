data "terraform_remote_state" "role" {
  backend = "local"
  config = {
    path = "../role/terraform.tfstate"
  }
}
