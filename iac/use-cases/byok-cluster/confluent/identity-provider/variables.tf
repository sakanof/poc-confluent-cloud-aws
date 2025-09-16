variable "name" {
  description   = "Name of the Identity Provider."
  default       = "aws-eks"
  type          = string
}

variable "confluent_api_key" {
  description   = "Confluent Cloud API Key"
  type          = string
}

variable "confluent_api_secret" {
  description   = "Confluent Cloud API Secret"
  type          = string
}
