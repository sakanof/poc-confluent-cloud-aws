resource "confluent_identity_pool" "this" {
  identity_provider {
    id = var.identity_provider_id
  }

  display_name      = var.name
  identity_claim    = "claims.sub"
  filter            = "claims.aud==\"sts.amazonaws.com\" && claims.sub==\"system:serviceaccount:${var.namespace}:${var.service_account}\""
  description       = "asdasd"
}