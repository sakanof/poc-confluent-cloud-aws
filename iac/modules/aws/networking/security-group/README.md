# Security Group Module

This module is used to create and manage AWS Security Groups.

## Usage

```hcl
module "security_group" {
    source = "./modules/aws/networking/security-group"

    name        = "example-security-group"
    description = "Security group for example resources"
    vpc_id      = "vpc-12345678"

    ingress_rules = [
        {
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]

    egress_rules = [
        {
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
}
```

## Inputs

| Name                     | Description                                              | Type   | Default        | Required |
|--------------------------|----------------------------------------------------------|--------|----------------|----------|
| `name`               | Name to assign to the VPC                                | string | n/a            | yes      |
| `vpc_id`             | CIDR block defining the VPC's IP range                   | string | `10.0.0.0/16`  | no       |
| `ingress_cidr`  | CIDR block for the public subnet in Availability Zone 1  | string | `10.0.0.0/20`  | no       |
| `ingress_from_port`  | CIDR block for the public subnet in Availability Zone 2  | string | `10.0.16.0/20` | no       |
| `ingress_to_port`  | CIDR block for the public subnet in Availability Zone 3  | string | `10.0.32.0/20` | no       |
| `ingress_protocol` | CIDR block for the private subnet in Availability Zone 1 | string | `10.0.48.0/20` | no       |
| `egress_cidr` | CIDR block for the private subnet in Availability Zone 2 | string | `10.0.64.0/20` | no       |
| `egress_from_port` | CIDR block for the private subnet in Availability Zone 3 | string | `10.0.80.0/20` | no       |

## Outputs

| Name                     | Description                                            |
|--------------------------|--------------------------------------------------------|
| `vpc_id`                 | ID of the created VPC                                  |
| `public_route_table_id`  | ID of the public route table                           |
| `private_route_table_id` | ID of the private route table                          |
| `private_zones_map`      | Mapping of private subnets to their availability zones |
| `public_subnets`         | IDs of the created public subnets                      |
| `private_subnets`        | IDs of the created private subnets                     |
| `public_subnet_az1_id`   | ID of the public subnet in Availability Zone 1         |
| `public_subnet_az2_id`   | ID of the public subnet in Availability Zone 2         |
| `public_subnet_az3_id`   | ID of the public subnet in Availability Zone 3         |
| `private_subnet_az1_id`  | ID of the private subnet in Availability Zone 1        |
| `private_subnet_az2_id`  | ID of the private subnet in Availability Zone 2        |
| `private_subnet_az3_id`  | ID of the private subnet in Availability Zone 3        |