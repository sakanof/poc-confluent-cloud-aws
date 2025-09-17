module "ec2_instance" {
  source            = "../../../../../modules/aws/ec2/kafka-client/"

  instance_type     = "t2.micro"
  role_name         = data.terraform_remote_state.role.outputs.name
  subnet_id         = data.terraform_remote_state.vpc.outputs.public_subnet_az1_id
  bootstrap_server  = data.terraform_remote_state.confluent_cluster.outputs.bootstrap_endpoint
  cluster_id        = data.terraform_remote_state.confluent_cluster.outputs.cluster_id
  identity_pool_id  = data.terraform_remote_state.producer_identity_pool.outputs.id
  tag_name          = "poc-aws-msk-producer"
  client_type       = "producer"
  client_key        = var.client_key
  client_secret     = var.client_secret
  security_groups   = [
    data.terraform_remote_state.ssh_sg.outputs.id,
    data.terraform_remote_state.confluent_privatelink.outputs.privatelink_security_group_id
  ]
}
