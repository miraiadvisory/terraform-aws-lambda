# Tadaima module
locals {
    lambda_filename = var.filename == "" ? data.archive_file.dummy.output_path : var.filename
}

### DATA DEFINITION ###
data "archive_file" "dummy" {
  type = "zip"
  output_path = "${path.module}/dummy.zip"

  source {
    content = "hello"
    filename = "dummy.txt"
  }
}

### LAMBDA FUNCTION ###
resource "aws_lambda_function" "this_function" {
  filename = local.lambda_filename
  lifecycle {
    ignore_changes = [
      filename
    ]
  }
  environment {
    variables = {
      environment              = var.environment
      bucket                   = var.deploy_bucket
      service_role             = var.service_role
      job_flow_role            = var.job_flow_role
      ec2_key_name             = var.ec2_key_name
      ec2_subnet_id            = var.ec2_subnet_id
      additional_emr_master_sg = var.additional_emr_master_sg
      additional_emr_slave_sg  = var.additional_emr_slaves_sg
      emr_service_access       = var.emr_service_access
      slaves_capacity          = var.slaves_capacity
    }
  }

  function_name = "${var.lambda_function}-${var.lambda_version}"
  description   = var.description
  role          = var.role
  handler       = var.handler
  runtime       = var.runtime
  timeout       = var.timeout
  tags = {
    Project = var.project
    Stages  = var.environment
  }
}

### LAMBDA TRIGGERS ###
resource "aws_lambda_event_source_mapping" "this_sqs_trigger" {
  count = var.sqs_trigger? 1 : 0 

  event_source_arn = "var.sqs_queue_arn"
  function_name    = "${aws_lambda_function.this_function.arn}"
}
