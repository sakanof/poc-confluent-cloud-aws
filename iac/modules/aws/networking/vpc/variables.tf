variable "vpc_name" {
  type          = string
  description   = "VPC Tag Name."
}

variable "cidr_block" {
  type          = string
  default       = "10.0.0.0/16"
  description   = "CIDR block (default: 10.0.0.0/16)."
}

variable "public_az1_cidr_block" {
  type          = string
  default       = "10.0.0.0/20"
  description   = "Public AZ A CIDR Block (default: 10.0.0.0/20)."
}

variable "public_az2_cidr_block" {
  type          = string
  default       = "10.0.16.0/20"
  description   = "Public AZ B CIDR Block (default: 10.0.16.0/20)."
}

variable "public_az3_cidr_block" {
  type          = string
  default       = "10.0.32.0/20"
  description   = "Public AZ C CIDR Block (default: 10.0.32.0/20)."
}

variable "private_az1_cidr_block" {
  type          = string
  default       = "10.0.48.0/20"
  description   = "Private AZ A CIDR Block (default: 10.0.48.0/20)."
}

variable "private_az2_cidr_block" {
  type          = string
  default       = "10.0.64.0/20"
  description   = "Private AZ B CIDR Block (default: 10.0.64.0/20)."
}

variable "private_az3_cidr_block" {
  type          = string
  default       = "10.0.80.0/20"
  description   = "Private AZ C CIDR Block (default: 10.0.80.0/20)."
}

variable "eks_name" {
  type          = string
  description   = "The name of the EKS cluster. This value is essential for Kubernetes to identify and associate the subnets with the correct cluster. It is used to define mandatory tags on networking resources, such as subnets, allowing EKS to automatically manage the associated resources."
}