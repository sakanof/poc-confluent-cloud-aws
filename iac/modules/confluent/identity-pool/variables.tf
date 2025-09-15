variable "identity_provider_id" {
  type        = string
  description = "The ID of the identity provider to be used."
}

variable "name" {
  type        = string
  description = "The name of the identity pool."
}

variable "namespace" {
  type        = string
  description = "The namespace for the identity pool resources."
}

variable "service_account" {
  type        = string
  description = "The service account associated with the identity pool."
}