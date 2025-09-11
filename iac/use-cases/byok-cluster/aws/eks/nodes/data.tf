data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../../networking/vpc/terraform.tfstate"
  }
}

data "terraform_remote_state" "eks_nodes_role" {
  backend = "local"
  config = {
    path = "../iam/roles/eks-nodes/terraform.tfstate"
  }
}
