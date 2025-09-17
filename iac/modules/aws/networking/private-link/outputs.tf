output "security_group_id" {
  description = "The ID of the security group for PrivateLink"
  value       = aws_security_group.privatelink.id
}

output "vpc_endpoint_id" {
  description = "The PrivateLink VPC endpoint ID"
  value       = aws_vpc_endpoint.privatelink.id
}

output "route53_zone_id" {
  description = "The Route53 Private Hosted Zone ID"
  value       = aws_route53_zone.privatelink.zone_id
}

output "route53_zone_name" {
  description = "The Route53 Private Hosted Zone name"
  value       = aws_route53_zone.privatelink.name
}