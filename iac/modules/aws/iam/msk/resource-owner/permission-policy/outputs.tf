output "policy_id" {
  description = "Policy ID (ARN)."
  value       = aws_iam_policy.msk_resource_owner_policy.arn
}
