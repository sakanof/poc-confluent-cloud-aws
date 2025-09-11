module "kms" {
  source                  = "../../../../modules/aws/kms"
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
