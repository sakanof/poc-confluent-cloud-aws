# locals {
#   # eks_issuer = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
#   eks_issuer = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
#   # EKS publishes the JWKS at <issuer>/keys
#   eks_jwks   = "${local.eks_issuer}/keys"
# }

resource "confluent_identity_provider" "this" {
  display_name  = var.name
  issuer        = var.issuer
  jwks_uri      = "${var.issuer}/keys"
  # "https://login.microsoftonline.com/${var.tenant_id}/discovery/keys?appid=${var.application_client_id}"
  description   = var.description
}
