output "id" {
  value       = confluent_byok_key.this.id
}

output "roles" {
  value       = confluent_byok_key.this.aws[0].roles
}
