provider "aws" {
  region = "us-east-1"
}

# data "aws_sqs_queue" "test-sqs" {
#   name = "test-sqs"
# }

# data "aws_sqs_queue" "test-sqs1" {
#   name = "test-sqs1"
# }

resource "aws_sqs_queue" "test-sqs" {
  name                      = "test-sqs"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  # redrive_policy = "{\"deadLetterTargetArn\":\"${data.aws_sqs_queue.test-sqs1.arn}\",\"maxReceiveCount\":4}"

  tags = {
    Environment = "production"
  }
}

resource "aws_sqs_queue" "test-sqs1" {
  name                      = "test-sqs1"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  # redrive_policy = <<POLICY
  # {
  # "deadLetterTargetArn":"${data.aws_sqs_queue.test-sqs.arn}",
  # "maxReceiveCount":4
  # }
  # POLICY

  tags = {
    Environment = "production"
  }
}

