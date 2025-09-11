variable "aws_region" {
  type        = string
  description = "AWS region where the MSK cluster and EC2 exist."
}

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

variable "group_name" {
  type        = string
  description = "Name of the Consumer Group."
}
