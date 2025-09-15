output "id" {
  description = "Role ID."
  value       = aws_iam_role.this.id
}

output "arn" {
  description = "Role ARN."
  value       = aws_iam_role.this.arn
}

output "name" {
  description = "Role Name."
  value       = aws_iam_role.this.name
}