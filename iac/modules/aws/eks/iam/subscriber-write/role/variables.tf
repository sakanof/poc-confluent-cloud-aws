variable "aws_account" {
  type        = string
  description = "AWS Account ID (12-digit)."
}

variable "cluster_name" {
  type        = string
  description = "Name of the MSK cluster."
}

variable "topic_name" {
  type        = string
  description = "Name of the Kafka topic."
}

variable "application_namespace" {
  type        = string
  description = "Application's Namespace."
}

variable "write_service_account" {
  type        = string
  description = "EKS Write Service Account."
}
