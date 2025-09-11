output "id" {
  description = "Role ID."
  value       = aws_iam_role.role.id
}

output "arn" {
  description = "Role ARN."
  value       = aws_iam_role.role.arn
}

output "name" {
  description = "Role Name."
  value       = aws_iam_role.role.name
}
