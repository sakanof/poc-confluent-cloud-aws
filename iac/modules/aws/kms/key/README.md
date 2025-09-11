# AWS KMS Key Module

This module provisions an AWS KMS key and attaches an alias.

## Features

- Configurable description, deletion window, and key rotation.
- Optional custom key policy.
- Support for multi-region keys.
- Tags and alias support.

## Usage

```hcl
module "kms" {
  source                  = "../../modules/aws/kms"
  description             = "Confluent Cloud BYOK Key"
  deletion_window_in_days = 30
  enable_key_rotation     = true
  policy                  = "" # Optionally set your policy JSON here
  tags                    = {
    "Environment" = "PoC"
    "Service"     = "Confluent"
  }
  multi_region            = false
  alias_name              = "alias/confluent-byok"
}
```

## Outputs

- `kms_key_id`: The KMS key ID
- `kms_key_arn`: The KMS key ARN
- `kms_alias_arn`: The KMS alias ARN
- `kms_alias_name`: The KMS alias name

## References

- [Terraform aws_kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key)
- [Terraform aws_kms_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias)