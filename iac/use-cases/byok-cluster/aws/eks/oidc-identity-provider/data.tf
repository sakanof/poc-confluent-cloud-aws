data "terraform_remote_state" "eks_cluster" {
  backend = "local"
  config = {
    path = "../cluster/terraform.tfstate"
  }
}
