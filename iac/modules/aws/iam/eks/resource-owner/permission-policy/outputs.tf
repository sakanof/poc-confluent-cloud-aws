output "policy_id" {
  description = "Policy ID (ARN)."
  value       = aws_iam_policy.eks_resource_owner.arn
}
