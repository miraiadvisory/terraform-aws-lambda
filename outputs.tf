output "this_lambda_arn" {
  description = "The ARN of the lambda. Will be of format arn:aws:s3:::bucketname."
  value       = element(concat(aws_lambda_function.this_function.*.arn, tolist[("")]), 0)
}

output "this_lambda_invoke_arn" {
  description = "The invoke ARN of the lambda. Will be of format arn:aws:s3:::bucketname."
  value       = element(concat(aws_lambda_function.this_function.*.invoke_arn, tolist[("")]), 0)
}