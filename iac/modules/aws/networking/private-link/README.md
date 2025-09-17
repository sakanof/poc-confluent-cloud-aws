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

- `vpc_id`: The ID of the VPC where the PrivateLink endpoints will be created.
- `private_link_endpoint_service`: The name of the PrivateLink endpoint service to connect to.
- `subnets_to_privatelink`: Map of availability zone IDs to subnet IDs for PrivateLink endpoint placement.
- `bootstrap_prefix`: The prefix used for bootstrap servers in the Confluent Cloud configuration.
- `confluent_dns_domain`: The DNS domain name for the Confluent Cloud environment.

## Outputs

- `security_group_id`: The ID of the security group for PrivateLink.
- `vpc_endpoint_id`: The PrivateLink VPC endpoint ID.
- `route53_zone_id`: The Route53 Private Hosted Zone ID.
- `route53_zone_name`: The Route53 Private Hosted Zone name.

## References

- [Confluent Cloud PrivateLink](https://docs.confluent.io/cloud/current/networking/private-links/index.html)
- [Terraform aws_vpc_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint)
- [Terraform aws_route53_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone)
