resource "aws_kms_key" "main" {
  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  policy                  = var.policy
  multi_region            = var.multi_region
  tags                    = var.tags
}

resource "aws_kms_alias" "main" {
  name          = var.alias_name
  target_key_id = aws_kms_key.main.id
}