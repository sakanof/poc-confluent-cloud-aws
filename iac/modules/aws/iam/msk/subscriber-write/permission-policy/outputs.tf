output "policy_id" {
  description = "Policy ID (ARN)."
  value       = aws_iam_policy.permission_policy.arn
}
