variable "aws_account_id" {
  description   = "AWS Account ID for Confluent Private Link"
  default       = "891377173254"
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
