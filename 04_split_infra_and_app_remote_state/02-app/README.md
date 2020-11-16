# Overview

- Saves state in s3 bucket created in [01-base](../01-base)
- Upload lambda zip file from local path to s3 bucket.
- Deploy lambda.

## Commands

- Deploy the infra:

  ```sh
  terraform init -backend=true -backend-config="bucket=test-tf-state-bucket-1" -backend-config="key=app.tfstate" -backend-config="dynamodb_table=test-tf-state-lock-table-1"

  TF_VAR_lambda_zip_file_path="../../app_code/lambda.zip" terraform plan -out tfplan

  TF_VAR_lambda_zip_file_path="../../app_code/lambda.zip" terraform apply tfplan
  ```

- Destroy the infra:

  ```sh
  TF_VAR_lambda_zip_file_path="../../app_code/lambda.zip" terraform destroy -auto-approve
  ```

## Usage

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| lambda\_description | Lambda function description | `string` | `"Test lambda"` | no |
| lambda\_handler | Lambda function handler | `string` | `"lambda.lambda_handler"` | no |
| lambda\_iam\_policy\_document | Lambda IAM policy document | `string` | `"{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Action\": \"sts:AssumeRole\",\n      \"Principal\": {\n        \"Service\": \"lambda.amazonaws.com\"\n      },\n      \"Effect\": \"Allow\",\n      \"Sid\": \"\"\n    }\n  ]\n}\n"` | no |
| lambda\_name | Lambda function name | `string` | `"test-tf-lambda"` | no |
| lambda\_role | Lambda IAM role name | `string` | `"test-tf-lambda-role"` | no |
| lambda\_runtime | Lambda function runtime | `string` | `"python3.7"` | no |
| lambda\_s3\_bucket | S3 Bucket where lambda code is uploaded | `string` | `"test-tf-lambda-s3"` | no |
| lambda\_timeout | Lambda function timeout | `number` | `60` | no |
| lambda\_zip\_file\_path | Lambda function code zip file path | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| lambda\_function\_invoke\_arn | Lambda function invoke arn |
| lambda\_function\_name | Lambda function |
| lambda\_role\_arn | Lambda role arn |
| lambda\_s3\_id | Lambda S3 bucket name |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
