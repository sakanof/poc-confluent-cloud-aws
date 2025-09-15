module "ec2_instance" {
  source                = "../../../../modules/ec2/kafka-client/"

  instance_type     = "t2.micro"
  role_name         = data.terraform_remote_state.role.outputs.name
  subnet_id         = data.terraform_remote_state.vpc.outputs.public_subnet_az1_id
  bootstrap_server  = data.terraform_remote_state.msk.outputs.bootstrap_brokers_sasl_iam
  tag_name          = "poc-aws-msk-producer"
  client_type       = "producer"
  security_groups   = [
    data.terraform_remote_state.ssh_sg.outputs.id,
    data.terraform_remote_state.msk_sg.outputs.id
  ]
}
