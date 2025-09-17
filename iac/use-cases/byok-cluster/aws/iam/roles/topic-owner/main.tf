module "subscriber_topic_owner_role" {
  source                = "../../../../../../modules/aws/iam/irsa-role/"

  issuer          = data.terraform_remote_state.eks_cluster.outputs.oidc_provider_url
  aws_account     = var.aws_account
  namespace       = "poc-confluent-cloud-aws"
  service_account = "topic-owner"
}
