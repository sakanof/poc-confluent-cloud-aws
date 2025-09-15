# confluent_kafka_cluster.dedicated.bootstrap_endpoint
variable "bootstrap_prefix" {
  type        = string
}

# locals {
#   dns_domain = confluent_network.private-link.dns_domain
# }
variable "confluent_dns_domain" {
  type        = string
}

variable "vpc_id" {
  type        = string
}

# confluent_network.private-link.aws[0].private_link_endpoint_service
variable "private_link_endpoint_service" {
  type        = string
}

variable "subnets_to_privatelink" {
  description = "Map of availability zone IDs to subnet IDs for PrivateLink endpoint placement"
  type        = map(string)
}
