## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| archive | n/a |
| aws | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [archive_file](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) |
| [aws_lambda_event_source_mapping](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_event_source_mapping) |
| [aws_lambda_function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | description of the lambda function to run | `string` | n/a | yes |
| environment | environment | `map(string)` | n/a | yes |
| filename | lambda filename | `string` | `""` | no |
| function\_name | Function name | `string` | n/a | yes |
| handler | handler | `string` | `"lambda_function.lambda_handler"` | no |
| lambda\_function | name of the lambda file | `string` | n/a | yes |
| lambda\_version | version | `string` | `"v1"` | no |
| project | project | `string` | n/a | yes |
| role | Role to run | `string` | n/a | yes |
| runtime | runtime lib | `string` | `"python3.6"` | no |
| sqs\_queue\_arn | arn of sqs for trigger | `string` | `""` | no |
| sqs\_trigger | enable or disable sqs trigger | `bool` | `false` | no |
| stage | stage | `string` | `"dev"` | no |
| timeout | timeout lambdas | `string` | `10` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_lambda\_arn | The ARN of the lambda. Will be of format arn:aws:s3:::bucketname. |
| this\_lambda\_invoke\_arn | The invoke ARN of the lambda. Will be of format arn:aws:s3:::bucketname. |
