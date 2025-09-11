output "privatelink_security_group_id" {
  description = "Security group for PrivateLink"
  value       = module.privatelink.security_group_id
}

output "privatelink_vpc_endpoint_id" {
  description = "PrivateLink VPC endpoint ID"
  value       = module.privatelink.vpc_endpoint_id
}

output "privatelink_route53_zone_id" {
  description = "Route53 hosted zone ID"
  value       = module.privatelink.route53_zone_id
}

output "privatelink_route53_zone_name" {
  description = "Route53 hosted zone name"
  value       = module.privatelink.route53_zone_name
}
