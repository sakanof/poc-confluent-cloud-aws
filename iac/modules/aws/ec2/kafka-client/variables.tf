variable "instance_type" {
  type          = string
  default       = "t2.micro"
  description   = "EC2 Tnstance Type (default: t2.micro)"
}

# variable "role_name" {
#   type          = string
#   description   = "Role Name."
# }

variable "subnet_id" {
  type          = string
  description   = "Subnet ID."
}

variable "key_name" {
  type          = string
  default       = "ec2-kafka"
  description   = "Keypair Name (default: ec2-kafka)."
}

variable "bootstrap_server" {
  type          = string
  description   = "Bootstrap Server for SASL IAM Authentication."
}

variable "security_groups" {
  type          = list(string)
  description   = "Security Group List."
}

variable "client_type" {
  type          = string
  description   = "Client Type (`resource-owner`, `producer`, `consumer` and `monitoring`)."
}

variable "client_key" {
  type          = string
  description   = "The client key used for authentication."
}

variable "client_secret" {
  type          = string
  description   = "The client secret used for authentication."
}

variable "tag_name" {
  type          = string
  description   = "Tag Name."
}
