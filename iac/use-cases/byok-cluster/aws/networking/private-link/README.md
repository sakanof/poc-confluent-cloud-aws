# Use Case: Confluent Cloud PrivateLink with External VPC

This use case provisions a PrivateLink interface endpoint, security group, and private DNS hosted zone in a VPC managed by an external Terraform state.

## How it works

- Loads VPC resources from a local remote state.
- Uses AZ-to-subnet mappings from the external VPC for endpoint placement.
- Provisions PrivateLink resources for Confluent Cloud or similar SaaS services.

## Files

- `data.tf`: Loads VPC outputs (VPC ID, subnet map) using `terraform_remote_state`.
- `main.tf`: Provisions PrivateLink endpoint, security group, Route53 DNS zone/records.
- `outputs.tf`: Exposes useful identifiers.
- `README.md`: Documentation.

## Example VPC remote state outputs

Your external VPC module should output something like:

```hcl
output "vpc_id" {
  value = aws_vpc.main.id
}

output "az_subnet_map" {
  value = {
    "use1-az1" = aws_subnet.az1.id,
    "use1-az2" = aws_subnet.az2.id
  }
}
```

## Usage

1. Set the correct local remote state path in `data.tf`.
2. Update `main.tf` to use the correct service name and DNS domain.
3. Run Terraform:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Outputs

- PrivateLink security group ID
- PrivateLink VPC endpoint ID
- Route53 private hosted zone ID and name

## References

- [Confluent Cloud PrivateLink](https://docs.confluent.io/cloud/current/networking/private-links/index.html)
