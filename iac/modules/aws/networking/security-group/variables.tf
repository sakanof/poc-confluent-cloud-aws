variable "name" {
  type        = string
  description = "Name of the Security Group."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID."
}

variable "ingress_cidr" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "Ingress CIDR."
}

variable "ingress_from_port" {
  type        = string
  description = "Ingress from port."
}

variable "ingress_to_port" {
  type        = string
  description = "Ingress to port."
}

variable "ingress_protocol" {
  type        = string
  description = "Ingress protocol."
}

variable "egress_cidr" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "egress CIDR."
}

variable "egress_from_port" {
  type        = string
  default     = "0"
  description = "egress from port."
}

variable "egress_to_port" {
  type        = string
  default     = "0"
  description = "egress to port."
}

variable "egress_protocol" {
  type        = string
  default     = "-1"                    # Allows all outbound traffic
  description = "egress protocol."
}
