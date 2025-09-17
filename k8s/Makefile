APPLICATION_NAMESPACE=poc-confluent-cloud-aws
SERVICE_ACCOUNT_TOPIC_OWNER=topic-owner
SERVICE_ACCOUNT_READ=read
SERVICE_ACCOUNT_WRITE=write
TEST_TOPIC_NAME=test-topic

EKS_CLUSTER_NAME 				:= $(shell jq -r '.outputs.id.value' ../iac/use-cases/byok-cluster/aws/eks/cluster/terraform.tfstate)
CLUSTER_ID						:= $(shell jq -r '.outputs.cluster_id.value' ../iac/use-cases/byok-cluster/confluent/cluster/terraform.tfstate)
BOOTSTRAP_SERVERS				:= $(shell jq -r '.outputs.bootstrap_endpoint.value' ../iac/use-cases/byok-cluster/confluent/cluster/terraform.tfstate)

EKS_TOPIC_OWNER_ROLE_ARN		:= $(shell jq -r '.outputs.arn.value' ../iac/use-cases/byok-cluster/aws/iam/roles/topic-owner/terraform.tfstate)
EKS_WRITE_ROLE_ARN				:= $(shell jq -r '.outputs.arn.value' ../iac/use-cases/byok-cluster/aws/iam/roles/producer/terraform.tfstate)
EKS_READ_ROLE_ARN				:= $(shell jq -r '.outputs.arn.value' ../iac/use-cases/byok-cluster/aws/iam/roles/consumer/terraform.tfstate)

CONSUMER_IDENTITY_POOL_ID		:= $(shell jq -r '.outputs.id.value' ../iac/use-cases/byok-cluster/confluent/identity-pool-consumer/terraform.tfstate)
PRODUCER_IDENTITY_POOL_ID		:= $(shell jq -r '.outputs.id.value' ../iac/use-cases/byok-cluster/confluent/identity-pool-producer/terraform.tfstate)
TOPIC_OWNER_IDENTITY_POOL_ID	:= $(shell jq -r '.outputs.id.value' ../iac/use-cases/byok-cluster/confluent/identity-pool-topic-owner/terraform.tfstate)

get-pods:
	kubectl get pods --namespace ${APPLICATION_NAMESPACE}

setup-kubconfig:
	aws eks update-kubeconfig --region us-east-1 --name ${EKS_CLUSTER_NAME} --profile main_account

create-namespace:
	kubectl create namespace ${APPLICATION_NAMESPACE}

delete-namespace:
	kubectl delete namespace ${APPLICATION_NAMESPACE}

create-service-accounts:
	APPLICATION_NAMESPACE=${APPLICATION_NAMESPACE}							\
	SERVICE_ACCOUNT_TOPIC_OWNER=${SERVICE_ACCOUNT_TOPIC_OWNER}				\
	SERVICE_ACCOUNT_READ=${SERVICE_ACCOUNT_READ}							\
	SERVICE_ACCOUNT_WRITE=${SERVICE_ACCOUNT_WRITE}							\
	EKS_TOPIC_OWNER_ROLE_ARN=${EKS_TOPIC_OWNER_ROLE_ARN}					\
	EKS_READ_ROLE_ARN=${EKS_READ_ROLE_ARN}									\
	EKS_WRITE_ROLE_ARN=${EKS_WRITE_ROLE_ARN}								\
		envsubst < ./deployments/service-account.yml | kubectl apply -f -

get-service-accounts:
	kubectl get sa --namespace ${APPLICATION_NAMESPACE} ${SERVICE_ACCOUNT_READ} -o yaml
	kubectl get sa --namespace ${APPLICATION_NAMESPACE} ${SERVICE_ACCOUNT_WRITE} -o yaml
	kubectl get sa --namespace ${APPLICATION_NAMESPACE} ${SERVICE_ACCOUNT_TOPIC_OWNER} -o yaml

delete-service-accounts:
	kubectl delete sa --namespace ${APPLICATION_NAMESPACE} ${SERVICE_ACCOUNT_READ}
	kubectl delete sa --namespace ${APPLICATION_NAMESPACE} ${SERVICE_ACCOUNT_WRITE}

create-client-properties-configmap:
	APPLICATION_NAMESPACE=${APPLICATION_NAMESPACE}							\
	CLUSTER_ID=${CLUSTER_ID}												\
	TOPIC_OWNER_IDENTITY_POOL_ID=${TOPIC_OWNER_IDENTITY_POOL_ID}			\
	CONSUMER_IDENTITY_POOL_ID=${CONSUMER_IDENTITY_POOL_ID}					\
	PRODUCER_IDENTITY_POOL_ID=${PRODUCER_IDENTITY_POOL_ID}					\
		envsubst < ./deployments/client-properties.yml | kubectl apply -f -

deploy-kafka-clients: create-client-properties-configmap
	TEST_TOPIC_NAME=${TEST_TOPIC_NAME}										\
	APPLICATION_NAMESPACE=${APPLICATION_NAMESPACE}							\
	SERVICE_ACCOUNT_READ=${SERVICE_ACCOUNT_READ} 							\
	SERVICE_ACCOUNT_WRITE=${SERVICE_ACCOUNT_WRITE}							\
	BOOTSTRAP_SERVER=${BOOTSTRAP_SERVERS}									\
	APPLICATION_CLIENT_ID=${APPLICATION_CLIENT_ID}							\
		envsubst < ./deployments/kafka-clients.yml | kubectl apply -f -

delete-kafka-clients:
	kubectl delete pod --namespace ${APPLICATION_NAMESPACE} kafka-producer kafka-consumer kafka-topic-owner

check-kafka-clients-identities:
	kubectl exec --namespace ${APPLICATION_NAMESPACE} -it kafka-topic-owner -- env
	kubectl exec --namespace ${APPLICATION_NAMESPACE} -it kafka-producer -- env
	kubectl exec --namespace ${APPLICATION_NAMESPACE} -it kafka-consumer -- env

cp-confluent-dependency-to-pods:
	kubectl cp ${CONFLUENT_OAUTH_EXTENSIONS_LIB_PATH} ${APPLICATION_NAMESPACE}/kafka-producer:/opt/kafka/libs/
	kubectl cp ${CONFLUENT_OAUTH_EXTENSIONS_LIB_PATH} ${APPLICATION_NAMESPACE}/kafka-consumer:/opt/kafka/libs/
	kubectl cp ${CONFLUENT_OAUTH_EXTENSIONS_LIB_PATH} ${APPLICATION_NAMESPACE}/kafka-topic-owner:/opt/kafka/libs/

run-kafka-producer:
	kubectl exec --namespace ${APPLICATION_NAMESPACE} -it kafka-producer -- bash

run-kafka-consumer:
	kubectl exec --namespace ${APPLICATION_NAMESPACE} -it kafka-consumer -- bash

run-kafka-topic-owner:
	kubectl exec --namespace ${APPLICATION_NAMESPACE} -it kafka-topic-owner -- bash
