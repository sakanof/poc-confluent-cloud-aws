# AWS KMS Key Policy Module

This module generates and attaches an AWS KMS key policy document to a KMS key.

## Features

- Grants KMS usage permissions to specified AWS IAM roles.
- Enables full permissions to the AWS account root user.

## Usage

```hcl
module "kms_policy" {
  source        = "../../modules/aws/policy"
  kms_key_id    = aws_kms_key.main.id
  kms_use_roles = ["arn:aws:iam::123456789012:role/ConfluentBYOKRole"]
  aws_root_arn  = "arn:aws:iam::123456789012:root"
}
```

## Inputs

- `kms_key_id`: ID of the KMS key to attach the policy to.
- `kms_use_roles`: List of AWS IAM role ARNs allowed to use the key.
- `kms_actions`: List of allowed actions (default: recommended for BYOK).
- `aws_root_arn`: ARN of the AWS account root user.

## Outputs

- `kms_policy_json`: The generated KMS key policy JSON document.

## References

- [AWS KMS Key Policies](https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html)
- [Terraform aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)
- [Terraform aws_kms_key_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy)
