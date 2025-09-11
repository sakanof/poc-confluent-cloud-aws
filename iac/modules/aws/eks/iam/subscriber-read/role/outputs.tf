output "arn" {
  description = "Role ARN."
  value       = aws_iam_role.eks_msk_read_role.arn
}

output "role_id" {
  description = "Role ID."
  value       = aws_iam_role.eks_msk_read_role.id
}

output "name" {
  description = "Role Name."
  value       = aws_iam_role.eks_msk_read_role.name
}
