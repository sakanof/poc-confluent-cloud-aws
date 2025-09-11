# Use Case: AWS KMS Key Provisioning (BYOK)

This use case demonstrates how to provision an AWS KMS key and alias for Bring Your Own Key (BYOK) integration with Confluent Cloud.

## Features

- Provisions a KMS key with configurable description, deletion window, and key rotation.
- Optionally sets a key policy and tags.
- Supports multi-region keys.
- Creates an alias for the KMS key.

## How to Use

1. **Configure Variables**  
   Edit `variables.tf` or provide values via `terraform.tfvars`.

2. **Initialize and Apply Terraform**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

3. **Outputs**  
   - `kms_key_id`: The KMS key ID.
   - `kms_key_arn`: The KMS key ARN.
   - `kms_alias_arn`: The KMS key alias ARN.
   - `kms_alias_name`: The KMS key alias name.

## Next Steps

Use the `kms_key_arn` output to integrate with Confluent Cloud BYOK-enabled clusters.
