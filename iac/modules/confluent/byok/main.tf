resource "confluent_byok_key" "this" {
     aws {
         key_arn = "arn:aws:kms:us-west-2:111111111111:key/11111111-1111-1111-1111-111111111111"
     }
}

data "aws_iam_policy_document" "main" {
  statement {
    sid    = "Allow KMS Use"
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:RevokeGrant"

    ]
    principals {
      identifiers = confluent_byok_key.main.aws[0].roles
      type        = "AWS"
    }

    resources = [
      "*"
    ]
  }

  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    actions = [
      "*"
    ]
    resources = [
      "*"
    ]
    principals {
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      ]
      type = "AWS"
    }
  }
}

resource "aws_kms_key_policy" "main" {
  key_id = aws_kms_key.main.id
  policy = data.aws_iam_policy_document.main.json
}

