#module "trigger_vessel_producer" {
#  source                     = "git::https://github.com/MeteoGroup/infra-modules-terraform.git//modules/sqs?ref=master"
#  name                       = "${var.prefix}-trigger-vessel-producer"
#  visibility_timeout_seconds = 900
#  message_retention_seconds  = 300
#  max_message_size           = 262144
#  receive_wait_time_seconds  = 10
#  redrive_policy             = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.dlq_vessel_producer.arn}\",\"maxReceiveCount\":3}"
#
#  tags = "${var.tags}"
#}

#resource "aws_sqs_queue" "dlq_vessel_producer" {
#  name = "${var.prefix}-trigger-vessel-producer-dlq"
#}

module "trigger_shore_producer" {
  source                     = "git::https://github.com/MeteoGroup/infra-modules-terraform.git//modules/sqs?ref=master"
  name                       = "${var.prefix}-trigger-shore-producer"
  visibility_timeout_seconds = 900
  message_retention_seconds  = 300
  max_message_size           = 262144
  receive_wait_time_seconds  = 10
  redrive_policy             = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.dlq_shore_producer.arn}\",\"maxReceiveCount\":3}"

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "dlq_shore_producer" {
  name = "${var.prefix}-trigger-shore-producer-dlq"
}

module "create_subscription_packages" {
  source                     = "git::https://github.com/MeteoGroup/infra-modules-terraform.git//modules/sqs?ref=master"
  name                       = "${var.prefix}-create-subscription-packages"
  visibility_timeout_seconds = 900
  message_retention_seconds  = 300
  max_message_size           = 262144
  receive_wait_time_seconds  = 10
  redrive_policy             = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.dlq_subscription_packages.arn}\",\"maxReceiveCount\":3}"

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "dlq_subscription_packages" {
  name = "${var.prefix}-create-subscription-packages-dlq"
}

module "vessel_package_emails" {
  source                     = "git::https://github.com/MeteoGroup/infra-modules-terraform.git//modules/sqs?ref=master"
  name                       = "${var.prefix}-vessel-package-emails"
  visibility_timeout_seconds = 900
  message_retention_seconds  = 300
  max_message_size           = 262144
  receive_wait_time_seconds  = 10
  redrive_policy             = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.dlq_package_emails.arn}\",\"maxReceiveCount\":3}"

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "dlq_package_emails" {
  name = "${var.prefix}-vessel-package-emails-dlq"
}
