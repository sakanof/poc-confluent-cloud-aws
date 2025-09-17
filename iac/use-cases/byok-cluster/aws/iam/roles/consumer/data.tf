data "terraform_remote_state" "eks_cluster" {
  backend = "local"
  config = {
    path = "../../../eks/cluster/terraform.tfstate"
  }
}
