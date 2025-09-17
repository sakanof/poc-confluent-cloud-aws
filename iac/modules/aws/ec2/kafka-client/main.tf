data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_iam_instance_profile" "profile" {
  name = "poc-aws-msk-${var.client_type}"
  role = var.role_name
}

resource "aws_instance" "resource_owner" {
  ami                           = data.aws_ami.amzn-linux-2023-ami.id
  instance_type                 = var.instance_type
  subnet_id                     = var.subnet_id

  key_name                      = var.key_name

  associate_public_ip_address   = true

  iam_instance_profile          = aws_iam_instance_profile.profile.name

  user_data = data.template_file.user_data.rendered

  security_groups = var.security_groups

  tags = {
    Name = var.tag_name
  }
}
