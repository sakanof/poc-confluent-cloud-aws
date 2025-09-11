output "id" {
  value = module.eks_cluster.id
}

output "oidc_provider_url" {
  value = module.eks_cluster.oidc_provider_url
}

output "arn" {
  value = module.eks_cluster.arn
}

output "cluster_id" {
  value = module.eks_cluster.cluster_id
}
