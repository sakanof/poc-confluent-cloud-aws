terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "main_account"
}

# Attach a policy to the KMS key
module "kms_policy" {
  source         = "../../../../../modules/aws/kms/key-policy"
  kms_key_id     = data.terraform_remote_state.kms_key.outputs.kms_key_id
  # kms_use_roles  = ["arn:aws:iam::123456789012:role/ConfluentBYOKRole"]
  kms_use_roles  = data.terraform_remote_state.confluent_byok.outputs.roles
  aws_root_arn   = "arn:aws:iam::891377173254:root"
  # Optionally, you can override kms_actions if needed
}
