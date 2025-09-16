variable "name" {
  type        = string
  description = "The name of the identity provider."
}

variable "description" {
  type        = string
  description = "A brief description of the identity provider."
}

variable "issuer" {
  type        = string
  description = "The issuer URL for the identity provider."
}
