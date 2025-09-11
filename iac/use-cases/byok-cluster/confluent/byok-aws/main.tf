module "byok" {
  source            = "../../../../modules/confluent/byok-aws"

  aws_kms_key_arn   = data.terraform_remote_state.aws_kms_key.outputs.kms_key_arn
}
