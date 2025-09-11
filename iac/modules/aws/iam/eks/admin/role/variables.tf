variable "aws_region" {
  type        = string
  description = "AWS region where the MSK cluster and EC2 exist."
}

variable "aws_account" {
  type        = string
  description = "AWS Account ID (12-digit)."
}

variable "github_organization" {
  type        = string
  description = "GitHub Organization."
}

variable "github_repository" {
  type        = string
  description = "GitHub Repository."
}
