output "network" {
  description = "Confluent Network"
  value       = confluent_network.this
}

output "id" {
  description = "The ID of the created Confluent Network"
  value       = confluent_network.this.id
}

output "cloud" {
  value       = confluent_network.this.cloud
}

output "private_link_endpoint_service" {
  description = "Confluent Private Link"
  value       = confluent_network.this.aws[0].private_link_endpoint_service
}

output "dns_domain" {
  description = "DNS Domain"
  value       = confluent_network.this.dns_domain
}
