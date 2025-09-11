variable "kms_key_id" {
  description = "ID of the KMS key to attach the policy to"
  type        = string
}

variable "kms_use_roles" {
  description = "List of AWS IAM role ARNs allowed to use the KMS key"
  type        = list(string)
}

variable "kms_actions" {
  description = "Actions allowed for the KMS use roles"
  type        = list(string)
  default     = [
    "kms:Encrypt",
    "kms:Decrypt",
    "kms:ReEncrypt*",
    "kms:GenerateDataKey*",
    "kms:DescribeKey",
    "kms:CreateGrant",
    "kms:ListGrants",
    "kms:RevokeGrant"
  ]
}

variable "aws_root_arn" {
  description = "ARN of the AWS account root user"
  type        = string
}
