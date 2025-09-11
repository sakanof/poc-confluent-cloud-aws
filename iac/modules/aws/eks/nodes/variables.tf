variable "eks_version" {
  type          = string
  default       = "1.31"
  description   = "EKS Version (default: 1.31)."
}

variable "name" {
  type          = string
  description   = "EKS Cluter Name."
}

variable "role_arn" {
  type          = string
  description   = "Role ARN."
}

variable "instance_types" {
  type          = list(string)
  default       = ["t3.large"]
  description   = "instance_types"
}

variable "subnet_ids" {
  type          = list(string)
  description   = "Subnet IDs"
}
