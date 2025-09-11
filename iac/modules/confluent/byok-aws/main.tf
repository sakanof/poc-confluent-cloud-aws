resource "confluent_byok_key" "this" {
     aws {
         key_arn = var.aws_kms_key_arn
     }
}