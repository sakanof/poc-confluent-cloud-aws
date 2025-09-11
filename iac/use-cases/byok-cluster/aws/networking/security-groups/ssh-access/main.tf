data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../../vpc/terraform.tfstate"
  }
}

module "ssh" {
  source                = "../../../../../../modules/aws/networking/security-group"

  name                  = "ssh-access-sg"
  vpc_id                = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress_cidr          = ["0.0.0.0/0"]
  ingress_from_port     = 22
  ingress_to_port       = 22
  ingress_protocol      = "tcp"

  egress_cidr           = ["0.0.0.0/0"]
  egress_from_port      = 0
  egress_to_port        = 0
  egress_protocol       = "-1"
}

output "id" {
  value = module.ssh.id
}

