output "admin_policy_id" {
  description = "Policy ID (ARN)."
  value       = aws_iam_policy.msk_admin_policy.arn
}
