

output "name" {
  description = "Role ID (Name)."
  value       = aws_iam_role.ec2_eks_resource_owner.id
}
