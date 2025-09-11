data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_iam_instance_profile" "profile" {
  name = "poc-aws-msk-producer"
  role = data.terraform_remote_state.write_role.outputs.name
}

resource "aws_instance" "producer" {
  ami                           = data.aws_ami.amzn-linux-2023-ami.id
  instance_type                 = "t2.micro" # free tier eligible
  subnet_id                     = data.terraform_remote_state.vpc.outputs.public_subnet_az1_id

  key_name                      = "ec2-kafka"

  associate_public_ip_address   = true

  iam_instance_profile          = aws_iam_instance_profile.profile.name

  user_data = templatefile("../shared/user-data.sh", {
    bootstrap_brokers_sasl_iam  = data.terraform_remote_state.msk.outputs.bootstrap_brokers_sasl_iam
    ec2_username                = "ec2-user"
    client_type                 = "producer"
  })

  security_groups = [
    data.terraform_remote_state.ssh_sg.outputs.id,
  ]

  tags = {
    Name = "poc-aws-msk-producer"
  }
}
