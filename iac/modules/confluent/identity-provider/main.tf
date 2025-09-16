resource "confluent_identity_provider" "this" {
  display_name      = var.name
  issuer            = "${var.issuer}/.well-known/openid-configuration"
  jwks_uri          = "${var.issuer}/keys"
  description       = var.description
  identity_claim    = "claims.sub"
}
