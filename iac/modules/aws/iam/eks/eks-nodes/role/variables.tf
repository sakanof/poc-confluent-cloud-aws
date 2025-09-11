variable "aws_region" {
  type        = string
  description = "AWS region."
}

variable "aws_account" {
  type        = string
  description = "AWS Account ID (12-digit)."
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster."
}
