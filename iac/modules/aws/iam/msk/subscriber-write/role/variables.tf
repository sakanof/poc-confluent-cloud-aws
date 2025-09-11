variable "aws_account" {
  type        = string
  description = "AWS Account ID (12-digit)."
}

variable "cluster_name" {
  type        = string
  description = "Name of the MSK cluster."
}

variable "cluster_uuid" {
  type        = string
  description = "ID of the MSK cluster."
}

variable "topic_name" {
  type        = string
  description = "Name of the Kafka topic to which EC2 can write."
}
