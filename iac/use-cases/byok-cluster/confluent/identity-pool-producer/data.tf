data "terraform_remote_state" "identity_provider" {
  backend = "local"
  config = {
    path = "../identity-provider/terraform.tfstate"
  }
}
