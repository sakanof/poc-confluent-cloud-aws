variable "description" {
  description = "Description for the KMS key"
  type        = string
}

variable "deletion_window_in_days" {
  description = "Waiting period for KMS key deletion"
  type        = number
  default     = 30
}

variable "enable_key_rotation" {
  description = "Enable KMS key rotation"
  type        = bool
  default     = true
}

variable "policy" {
  description = "KMS key policy"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags for KMS key"
  type        = map(string)
  default     = {}
}

variable "multi_region" {
  description = "Enable multi-region KMS key"
  type        = bool
  default     = false
}

variable "alias_name" {
  description = "Alias for the KMS key"
  type        = string
}