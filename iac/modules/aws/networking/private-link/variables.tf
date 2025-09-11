variable "vpc_id" {
  description = "The ID of the VPC for the PrivateLink endpoint"
  type        = string
}

variable "privatelink_service_name" {
  description = "The AWS service name for PrivateLink (e.g. com.amazonaws.us-east-1.vpce.amazonaws.com)"
  type        = string
}

variable "subnets_to_privatelink" {
  description = "Map of availability zone IDs to subnet IDs for PrivateLink endpoint placement"
  type        = map(string)
}

variable "dns_domain" {
  description = "DNS domain to create Route53 zone/records for PrivateLink"
  type        = string
}
