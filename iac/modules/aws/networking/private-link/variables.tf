variable "vpc_id" {
  description = "The ID of the VPC where the PrivateLink endpoints will be created"
  type        = string
}

variable "private_link_endpoint_service" {
  description = "The name of the PrivateLink endpoint service to connect to"
  type        = string
}

variable "subnets_to_privatelink" {
  description = "Map of availability zone IDs to subnet IDs for PrivateLink endpoint placement"
  type        = map(string)
}

variable "bootstrap_prefix" {
  description = "The prefix used for bootstrap servers in the Confluent Cloud configuration"
  type        = string
}

variable "confluent_dns_domain" {
  description = "The DNS domain name for the Confluent Cloud environment"
  type        = string
}