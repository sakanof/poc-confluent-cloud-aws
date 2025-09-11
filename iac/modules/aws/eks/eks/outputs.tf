output "id" {
  value = aws_eks_cluster.eks.id
}

output "oidc_provider_url" {
  value = aws_eks_cluster.eks.identity[0].oidc[0].issuer
}

output "arn" {
  value = aws_eks_cluster.eks.arn
}

output "cluster_id" {
  value = aws_eks_cluster.eks.cluster_id
}
