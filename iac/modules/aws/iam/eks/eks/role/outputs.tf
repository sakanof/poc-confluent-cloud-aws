output "role_id" {
  description = "Role ID."
  value       = aws_iam_role.eks_role.id
}

output "arn" {
  description = "Role ARN."
  value       = aws_iam_role.eks_role.arn
}

output "name" {
  description = "Role Name."
  value       = aws_iam_role.eks_role.name
}
