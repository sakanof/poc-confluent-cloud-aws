variable "name" {
  type        = string
  description = "Name of the Role."
}

variable "description" {
  type        = string
  description = "Description of the Role."
}

variable "assume_role_policy" {
  type        = string
  description = "AssumeRole Policy."
}
