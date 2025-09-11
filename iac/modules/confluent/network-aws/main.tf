resource "confluent_network" "this" {
  display_name      = var.display_name
  cloud             = "AWS"
  region            = var.region
  connection_types  = ["PRIVATELINK"]
  zones             = var.zones

  dns_config {
    resolution = "PRIVATE"
  }

  environment {
    id = var.environment_id
  }
}
