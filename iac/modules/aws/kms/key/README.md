# Use Case: AWS KMS Key Provisioning (BYOK)

This use case demonstrates a direct provisioning of an AWS KMS key and alias for Bring Your Own Key (BYOK) integration with Confluent Cloud.  
**No variables are used**; all inputs are hardcoded for simplicity.

## Usage

1. Run Terraform:

   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

2. Check Outputs:
   - `kms_key_id`: The KMS key ID.
   - `kms_key_arn`: The KMS key ARN.
   - `kms_alias_arn`: The KMS key alias ARN.
   - `kms_alias_name`: The KMS key alias name.

## Next Steps

Use the `kms_key_arn` output for Confluent Cloud BYOK integration.
