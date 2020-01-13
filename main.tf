module "trigger_shore_producer" {
  source                     = "./modules/sqs"
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

module "vessel_package_emails" {
  source                     = "./modules/sqs"
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

module "data_arrival_signaling" {
  source                     = "./modules/sqs"
  name                       = "${var.prefix}-data-arrival-signaling"
  visibility_timeout_seconds = 900
  message_retention_seconds  = 300
  max_message_size           = 262144
  receive_wait_time_seconds  = 10
  redrive_policy             = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.dlq_data_arrival_signaling.arn}\",\"maxReceiveCount\":3}"

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "dlq_data_arrival_signaling" {
  name = "${var.prefix}-data-arrival-signaling-dlq"
}

module "data_load_post_signaling" {
  source                     = "./modules/sqs"
  name                       = "${var.prefix}-data-load-post-signaling"
  visibility_timeout_seconds = 900
  message_retention_seconds  = 300
  max_message_size           = 262144
  receive_wait_time_seconds  = 10
  redrive_policy             = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.dlq_data_load_post_signaling.arn}\",\"maxReceiveCount\":3}"

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "dlq_data_load_post_signaling" {
  name = "${var.prefix}-data-load-post-signaling-dlq"
}

module "submit_optimization_job" {
  source                     = "./modules/sqs"
  name                       = "${var.prefix}-submit-optimization-job"
  visibility_timeout_seconds = 900
  message_retention_seconds  = 300
  max_message_size           = 262144
  receive_wait_time_seconds  = 10
  redrive_policy             = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.dlq_submit_optimization_job.arn}\",\"maxReceiveCount\":3}"

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "dlq_submit_optimization_job" {
  name = "${var.prefix}-submit-optimization-job-dlq"
}

module "submit_validation_job" {
  source                     = "./modules/sqs"
  name                       = "${var.prefix}-submit-validation-job"
  visibility_timeout_seconds = 900
  message_retention_seconds  = 300
  max_message_size           = 262144
  receive_wait_time_seconds  = 10
  redrive_policy             = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.dlq_submit_validation_job.arn}\",\"maxReceiveCount\":3}"

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "dlq_submit_validation_job" {
  name = "${var.prefix}-submit-validation-job-dlq"
}

module "retro_netcdf_export_signaling" {
  source                     = "./modules/sqs"
  name                       = "${var.prefix}-retro-netcdf-export-signaling"
  visibility_timeout_seconds = 900
  message_retention_seconds  = 300
  max_message_size           = 262144
  receive_wait_time_seconds  = 10
  redrive_policy             = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.dlq_retro_netcdf_export_signaling.arn}\",\"maxReceiveCount\":3}"

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "dlq_retro_netcdf_export_signaling" {
  name = "${var.prefix}-retro-netcdf-export-signaling-dlq"
}
