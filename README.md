# poc-confluent-cloud-aws

I have a Confluent Cloud Kafka cluster running on AWS. My producers and consumers will run inside an AWS EKS cluster, and I want them to authenticate using OIDC. Please provide step-by-step guidance on how to:

- Register my EKS cluster as an OIDC identity provider in Confluent Cloud.

- Configure Confluent identity pools that authorize access based on the namespace and service account of my producers and consumers.

- Demonstrate the Kafka client configuration required for producers and consumers to authenticate using OIDC.

The goal is to have fine-grained, namespace - and service-account–based authorization for Kafka producers and consumers running on EKS.
