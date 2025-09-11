output "kms_policy_json" {
  description = "The generated KMS key policy JSON document"
  value       = data.aws_iam_policy_document.main.json
}
