variable "display_name" {
  description = "Display Name of the Private Link"
  type        = string
}

variable "environment_id" {
  description = "ID of Confluent Environment."
  type        = string
}

variable "network_id" {
  description = "ID of Confluent Network."
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID for Private Link access"
  type        = string
}
