variable "s3_bucket" {
  description = "bucket of the lambda"
  type        = string
}

variable project {
  description = "project"
  type        = string
}

variable environment {
  description = "environment"
  type        = string
}

variable deploy_bucket {
  description = "deploy bucket"
  type        = string
}

variable service_role {
  description = "EMR Service Role"
  type        = string
  default     = "EMR_DefaultRole"
}

variable job_flow_role {
  description = "EMR Job EC2 Role"
  type        = string
  default     = "EMR_EC2_DefaultRole"
}

variable ec2_key_name {
  description = "EC2 KEY"
  type        = string
  default     = "emr-ec2"
}

variable ec2_subnet_id {
  description = "ec2 subnet id"
  type        = string
  default     = "eu-west-2a"
}

variable additional_emr_master_sg {
  description = "SG for master EMR"
  type        = string
  default     = ""
}

variable additional_emr_slaves_sg {
  description = "SG for slaves EMR"
  type        = string
}

variable emr_service_access {
  description = "SG for EMR Service"
  type        = string
}

variable slaves_capacity {
  description = "Slaves Instances Capacity"
  type        = string
  default = 1
}

variable function_name {
  description = "Function name"
  type        = string
}

variable lambda_function {
  description = "name of the lambda file"
  type        = string
}

variable "description" {
  description = "description of the lambda function to run"
  type        = string
}

variable "lambda_version" {
  description = "version"
  type        = string
  default     = "v1"
}

variable "role" {
  description = "Role to run"
  type        = string
}

variable "handler" {
  description = "handler"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "runtime" {
  description = "runtime lib"
  type        = string
  default     = "python3.6"
}

variable "timeout" {
  description = "timeout lambdas"
  type        = string
  default     = 10
}
variable "filename" {
  description = "lambda filename"
  type = string
}