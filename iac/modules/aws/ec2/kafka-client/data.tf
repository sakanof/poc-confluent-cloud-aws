data "template_file" "user_data" {
  template = <<-EOF
    #!/bin/bash
    
    sudo yum update -y
    sudo yum install -y telnet
    sudo yum install -y java-17-amazon-corretto.x86_64
    
    cd /opt
    
    wget https://downloads.apache.org/kafka/3.9.0/kafka_2.13-3.9.0.tgz
    tar -xzf kafka_2.13-3.9.0.tgz
    ln -s kafka_2.13-3.9.0 kafka
    rm -f kafka_2.13-3.9.0.tgz
    wget https://github.com/aws/aws-msk-iam-auth/releases/download/v2.2.0/aws-msk-iam-auth-2.2.0-all.jar -P /opt/kafka/libs
    
    cat <<EOT > /opt/kafka/config/client_sasl_iam.properties
    security.protocol=SASL_SSL
    sasl.mechanism=OAUTHBEARER
    sasl.oauthbearer.token.file=/var/run/secrets/eks.amazonaws.com/serviceaccount/token
    sasl.login.callback.handler.class=io.confluent.oauth.aws.serviceaccount.OAuthBearerLoginCallbackHandler
    sasl.jaas.config= \
       org.apache.kafka.common.security.oauthbearer.OAuthBearerLoginModule required \
           clientId='ignored' \
           clientSecret='ignored' \
           extension_logicalCluster='${var.cluster_id}' \
           extension_identityPoolId='${var.identity_pool_id}';
    EOT

    cat <<EOT > /opt/kafka/config/client_sasl_scram.properties
    security.protocol=SASL_SSL
    sasl.mechanism=PLAIN
    sasl.jaas.config=org.apache.kafka.common.security.scram.ScramLoginModule required username="${var.client_key}" password="${var.client_secret}";
    EOT

    echo "export var.bootstrap_serverS_SASL_IAM=${var.bootstrap_server}" >> /home/ec2-user/.bash_profile
    echo "export CLASSPATH=\"/opt/kafka/libs/\"" >> /home/ec2-user/.bash_profile
    
        echo "alias start_consumer=\"/opt/kafka/bin/kafka-console-consumer.sh --topic test-topic --group gname --bootstrap-server ${var.bootstrap_server} --consumer.config /opt/kafka/config/client_sasl_iam.properties\"" >> /home/ec2-user/.bash_profile

        echo "alias start_consumer_sasl_scram=\"/opt/kafka/bin/kafka-console-consumer.sh --topic test-topic --group gname --bootstrap-server ${var.bootstrap_server} --consumer.config /opt/kafka/config/client_sasl_scram.properties\"" >> /home/ec2-user/.bash_profile
        echo "alias start_producer=\"/opt/kafka/bin/kafka-console-producer.sh --topic test-topic --bootstrap-server ${var.bootstrap_server} --producer.config /opt/kafka/config/client_sasl_iam.properties\"" >> /home/ec2-user/.bash_profile

        echo "alias start_producer_sasl_scram=\"/opt/kafka/bin/kafka-console-producer.sh --topic test-topic --bootstrap-server ${var.bootstrap_server} --producer.config /opt/kafka/config/client_sasl_scram.properties\"" >> /home/ec2-user/.bash_profile
        echo "alias create_topic=\"/opt/kafka/bin/kafka-topics.sh --create --topic test-topic --partitions 2 --replication-factor 3 --bootstrap-server ${var.bootstrap_server}\"" >> /home/ec2-user/.bash_profile
        echo "alias list_topics=\"/opt/kafka/bin/kafka-topics.sh --list --bootstrap-server ${var.bootstrap_server}\"" >> /home/ec2-user/.bash_profile

        echo "alias create_topic_sasl_scra=\"/opt/kafka/bin/kafka-topics.sh --create --topic test-topic --partitions 2 --replication-factor 3 --bootstrap-server ${var.bootstrap_server} --command-config /opt/kafka/config/client_sasl_scram.properties\"" >> /home/ec2-user/.bash_profile
        echo "alias list_topics_sasl_scra=\"/opt/kafka/bin/kafka-topics.sh --list --bootstrap-server ${var.bootstrap_server} --command-config /opt/kafka/config/client_sasl_scram.properties\"" >> /home/ec2-user/.bash_profile
  EOF
}
