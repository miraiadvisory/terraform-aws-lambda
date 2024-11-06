# Tadaima module
locals {
  lambda_filename = var.filename == "" ? data.archive_file.dummy.output_path : var.filename
  env_vars = {
    for item in keys(var.environment) :
    item => element(values(var.environment), index(keys(var.environment), item))
  }
}

### DATA DEFINITION ###
data "archive_file" "dummy" {
  type        = "zip"
  output_path = "${path.module}/dummy.zip"

  source {
    content  = "hello"
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
    variables = local.env_vars
  }

  function_name = "${var.lambda_function}-${var.lambda_version}"
  description   = var.description
  role          = var.role
  handler       = var.handler
  runtime       = var.runtime
  timeout       = var.timeout
  memory_size   = var.memory_size
  
  ephemeral_storage {
    size = var.ephemeral_storage
  }

  dynamic "vpc_config" {
    for_each = var.vpc_subnet_ids != null && var.vpc_security_group_ids != null ? [true] : []
    content {
      security_group_ids          = var.vpc_security_group_ids
      subnet_ids                  = var.vpc_subnet_ids
    }
  }

  tags = {
    Project = var.project
    Stages  = var.stage
  }
}

### LAMBDA TRIGGERS ###
resource "aws_lambda_event_source_mapping" "this_sqs_trigger" {
  count = var.sqs_trigger ? 1 : 0

  event_source_arn = var.sqs_queue_arn
  function_name    = aws_lambda_function.this_function.arn
}
