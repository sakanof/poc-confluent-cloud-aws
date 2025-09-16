terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "2.24.0"
    }
  }
  #required_version = ">= 1.3.0"
}

provider "confluent" {
  cloud_api_key    = var.confluent_api_key
  cloud_api_secret = var.confluent_api_secret
  # organization_id  = "6d8d78e1-8c00-49ab-83ad-fd0364811018"
}
