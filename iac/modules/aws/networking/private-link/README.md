# AWS PrivateLink Module

This module creates a PrivateLink VPC interface endpoint and configures DNS records in a private Route53 hosted zone.  
It is intended for use with Confluent Cloud or similar SaaS services that require PrivateLink connectivity.

## Features

- Creates a dedicated security group for PrivateLink traffic (HTTP/S/Kafka TCP).
- Provisions an interface VPC endpoint in provided subnets.
- Creates a private Route53 zone and CNAME records for endpoint DNS.
- Handles multiple subnets and AZs, with wildcard DNS records for multi-AZ setups.

## Usage

```hcl
module "private_link" {
  source                   = "../../modules/aws/private-link"
  vpc_id                   = "vpc-abc123"
  privatelink_service_name = "com.amazonaws.us-east-1.vpce.amazonaws.com"
  subnets_to_privatelink   = {
    "use1-az1" = "subnet-12345"
    "use1-az2" = "subnet-67890"
  }
  dns_domain               = "privatelink.example.internal"
}
```

## Inputs

- `vpc_id`: VPC ID for endpoint and DNS.
- `privatelink_service_name`: Service name for PrivateLink (from provider).
- `subnets_to_privatelink`: Map of AZ IDs to subnet IDs.
- `dns_domain`: Private DNS domain for Route53 zone/records.

## Outputs

- `security_group_id`: Security group for PrivateLink traffic.
- `vpc_endpoint_id`: The AWS PrivateLink VPC endpoint ID.
- `route53_zone_id`: The Route53 private hosted zone ID.
- `route53_zone_name`: The DNS zone name.

## References

- [Confluent Cloud PrivateLink](https://docs.confluent.io/cloud/current/networking/private-links/index.html)
- [Terraform aws_vpc_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint)
- [Terraform aws_route53_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone)
