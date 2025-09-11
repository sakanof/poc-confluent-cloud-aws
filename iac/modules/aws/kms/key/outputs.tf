output "kms_key_id" {
  description = "The KMS key ID"
  value       = module.kms.kms_key_id
}

output "kms_key_arn" {
  description = "The ARN of the KMS key"
  value       = module.kms.kms_key_arn
}

output "kms_alias_arn" {
  description = "The ARN of the KMS key alias"
  value       = module.kms.kms_alias_arn
}

output "kms_alias_name" {
  description = "The name of the KMS key alias"
  value       = module.kms.kms_alias_name
}
