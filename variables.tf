
variable "project" {
  description = "project"
  type        = string
}

variable "environment" {
  description = "environment"
  type        = map(string)
}

variable "function_name" {
  description = "Function name"
  type        = string
}

variable "lambda_function" {
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
  type        = string
  default     = ""
}

variable "sqs_trigger" {
  description = "enable or disable sqs trigger"
  type        = bool
  default     = false
}

variable "sqs_queue_arn" {
  description = "arn of sqs for trigger"
  type        = string
  default     = ""
}

variable "stage" {
  description = "stage"
  type        = string
  default     = "dev"
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128."
  type        = string
  default     = 128
}

variable "ephemeral_storage" {
  description = "Size of the ephemeral storage for each lambda function. Defined in MB"
  default     = 512
}

variable "vpc_subnet_ids" {
  description = "List of subnet ids when Lambda Function should run in the VPC. Usually private or intra subnets."
  type        = list(string)
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of security group ids when Lambda Function should run in the VPC."
  type        = list(string)
  default     = null
}
