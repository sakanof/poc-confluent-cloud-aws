resource "confluent_identity_provider" "this" {
  display_name      = var.name
  issuer            = "${var.issuer}"
  jwks_uri          = "${var.issuer}/keys"
  description       = var.description
  identity_claim    = "claims.sub"
}
