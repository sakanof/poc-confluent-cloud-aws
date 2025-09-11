output "kms_key_id" {
  description = "The KMS key ID"
  value       = aws_kms_key.main.id
}

output "kms_key_arn" {
  description = "The ARN of the KMS key"
  value       = aws_kms_key.main.arn
}

output "kms_alias_arn" {
  description = "The ARN of the KMS key alias"
  value       = aws_kms_alias.main.arn
}

output "kms_alias_name" {
  description = "The name of the KMS key alias"
  value       = aws_kms_alias.main.name
}