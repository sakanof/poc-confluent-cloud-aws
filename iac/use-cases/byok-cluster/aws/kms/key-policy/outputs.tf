output "kms_policy_json" {
  description = "The generated KMS key policy JSON document"
  value       = module.kms_policy.kms_policy_json
}
