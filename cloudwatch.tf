#resource "aws_cloudwatch_event_rule" "scheduler" {
#  name                = "${var.prefix}_${var.project}_scheduler_subscription_processor"
#  schedule_expression = "rate(5 minutes)"
#}
#
#resource "aws_cloudwatch_event_target" "five_minutes" {
#  rule      = "${aws_cloudwatch_event_rule.scheduler.name}"
#  arn       = "${module.trigger_vessel_producer.this_sqs_queue_arn}"
#  target_id = "scheduler-subscription-processor"
#
#  input = <<INPUT
#  {
#    "EventSource": "cloudwatch",
#    "Tenant": "maersk"
#  }
#  INPUT
#}
#
#resource "aws_sqs_queue_policy" "scheduler_subscription_processor" {
#  queue_url = "${module.trigger_vessel_producer.this_sqs_queue_id}"
#
#  policy = <<POLICY
#{
#  "Version": "2012-10-17",
#  "Id": "sqspolicy",
#  "Statement": [
#    {
#      "Sid": "TrustCWEToSendEventsToQueue",
#      "Effect": "Allow",
#      "Principal": {
#         "Service": "events.amazonaws.com"
#      },
#      "Action": "sqs:SendMessage",
#      "Resource": "${module.trigger_vessel_producer.this_sqs_queue_arn}",
#      "Condition": {
#        "ArnEquals": {
#          "aws:SourceArn": "${aws_cloudwatch_event_rule.scheduler.arn}"
#        }
#      }
#    }
#  ]
#}
#POLICY
#}
