# Tadaima module

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
  filename = data.archive_file.dummy.output_path
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
  tags = {
    Project = var.project
    Stages  = var.environment
  }
}
