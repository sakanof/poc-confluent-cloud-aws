output "admin_policy_id" {
  description = "Policy ID (ARN)."
  value       = aws_iam_policy.eks_admin.arn
}
