output "role_id" {
  description = "Role ID."
  value       = aws_iam_role.eks_nodesrole.id
}

output "arn" {
  description = "Role ARN."
  value       = aws_iam_role.eks_nodesrole.arn
}

output "name" {
  description = "Role Name."
  value       = aws_iam_role.eks_nodesrole.name
}
