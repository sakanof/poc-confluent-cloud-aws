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

module "kms" {
  source                  = "../../../../../modules/aws/kms/key"
  description             = "Confluent Cloud BYOK Key"
  deletion_window_in_days = 30
  enable_key_rotation     = true
  policy                  = "" # You can put your JSON policy here if needed
  tags                    = {
    "Environment" = "PoC"
    "Service"     = "Confluent"
  }
  multi_region            = false
  alias_name              = "alias/confluent-byok"
}
