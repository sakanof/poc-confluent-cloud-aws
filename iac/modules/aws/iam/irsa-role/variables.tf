variable "aws_account" {
  type        = string
  description = "The AWS account ID where the IAM role will be created."
}

variable "issuer" {
  type        = string
  description = "The OIDC issuer URL for the EKS cluster."
}

variable "namespace" {
  type        = string
  description = "The Kubernetes namespace for the service account."
}

variable "service_account" {
  type        = string
  description = "The name of the Kubernetes service account."
}