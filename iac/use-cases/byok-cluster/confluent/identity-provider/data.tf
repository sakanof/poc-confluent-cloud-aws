data "terraform_remote_state" "eks" {
  backend = "local"
  config = {
    path = "../../aws/eks/cluster/terraform.tfstate"
  }
}
