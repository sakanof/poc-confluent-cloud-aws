data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

# resource "aws_iam_instance_profile" "profile" {
#   name = "poc-aws-msk-${var.client_type}"
#   role = var.role_name
# }

resource "aws_instance" "resource_owner" {
  ami                           = data.aws_ami.amzn-linux-2023-ami.id
  instance_type                 = var.instance_type
  subnet_id                     = var.subnet_id

  key_name                      = var.key_name

  associate_public_ip_address   = true

  # iam_instance_profile          = aws_iam_instance_profile.profile.name

  user_data = data.template_file.user_data.rendered

  # user_data = templatefile("../shared/user-data.sh", {
  #   bootstrap_brokers_sasl_iam  = var.bootstrap_server
  #   ec2_username                = "ec2-user"
  #   client_type                 = "resource-owner"
  # })

  # user_data = <<-EOF
  #   #!/bin/bash
  #   
  #   sudo yum update -y
  #   sudo yum install -y telnet
  #   sudo yum install -y java-17-amazon-corretto.x86_64
  #   
  #   cd /opt
  #   
  #   wget https://downloads.apache.org/kafka/3.9.0/kafka_2.13-3.9.0.tgz
  #   tar -xzf kafka_2.13-3.9.0.tgz
  #   ln -s kafka_2.13-3.9.0 kafka
  #   rm -f kafka_2.13-3.9.0.tgz
  #   wget https://github.com/aws/aws-msk-iam-auth/releases/download/v2.2.0/aws-msk-iam-auth-2.2.0-all.jar -P /opt/kafka/libs
  #   
  #   cat <<EOF > /opt/kafka/config/client_sasl_iam.properties
  #   security.protocol=SASL_SSL
  #   sasl.mechanism=AWS_MSK_IAM
  #   sasl.jaas.config=software.amazon.msk.auth.iam.IAMLoginModule required;
  #   sasl.client.callback.handler.class=software.amazon.msk.auth.iam.IAMClientCallbackHandler
  #   EOF
  #   
  #   echo "export BOOTSTRAP_SERVERS_SASL_IAM=${var.bootstrap_server}" >> /home/ec2-user/.bash_profile
  #   echo "export CLASSPATH=\"/opt/kafka/libs/\"" >> /home/ec2-user/.bash_profile
  #   
  #   if [[ "${var.client_type}" == "consumer" ]]; then
  #       echo "alias start_consumer=\"/opt/kafka/bin/kafka-console-consumer.sh --topic tname --group gname --bootstrap-server ${var.bootstrap_server} --consumer.config /opt/kafka/config/client_sasl_iam.properties\"" >> /home/ec2-user/.bash_profile
  #   elif [[ "${var.client_type}" == "producer" ]]; then
  #       echo "alias start_producer=\"/opt/kafka/bin/kafka-console-producer.sh --topic tname --bootstrap-server ${var.bootstrap_server} --producer.config /opt/kafka/config/client_sasl_iam.properties\"" >> /home/ec2-user/.bash_profile
  #   elif [[ "${var.client_type}" == "resource-owner" ]]; then
  #       echo "alias create_topic=\"/opt/kafka/bin/kafka-topics.sh --create --topic tname --partitions 2 --replication-factor 2 --bootstrap-server ${var.bootstrap_server}\"" >> /home/ec2-user/.bash_profile
  #       echo "alias list_topics=\"/opt/kafka/bin/kafka-topics.sh --list --bootstrap-server ${var.bootstrap_server}\"" >> /home/ec2-user/.bash_profile
  #   fi
  # EOF

  security_groups = var.security_groups

  tags = {
    Name = var.tag_name
  }
}
