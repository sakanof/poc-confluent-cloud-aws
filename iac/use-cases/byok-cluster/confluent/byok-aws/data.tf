data "terraform_remote_state" "aws_kms_key" {
  backend = "local"
  config = {
    path = "../../aws/kms/key/terraform.tfstate"
  }
}
