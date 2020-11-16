# Overview

- Saves state in s3 bucket created in [01-base](../01-base)
- Deploy AWS API gateway with lambda integration.
- Refers to the lambda created in [02-app](./02-app)

## Commands

- Deploy the infra:

  ```sh
  terraform init -backend=true -backend-config="bucket=test-tf-state-bucket-1" -backend-config="key=infra.tfstate" -backend-config="dynamodb_table=test-tf-state-lock-table-1"

  terraform plan -out tfplan && terraform apply tfplan
  ```

- Verify the API GW url:

  ```sh
  sleep 10 && curl $(terraform output -json | jq -r '.base_url.value')test/breakfast
  ```

- Destroy the infra:

  ```sh
  terraform destroy -auto-approve
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
| api\_name | API Gateway REST API name | `string` | `"test-tf-apigw"` | no |
| burst\_limit | API Gateway burst limit | `number` | `2` | no |
| lambda\_name | Lambda function name | `string` | `"test-tf-lambda"` | no |
| rate\_limit | API Gateway rate limit | `number` | `5` | no |
| resource\_names | Resources to create | `list` | <pre>[<br>  "breakfast",<br>  "lunch",<br>  "supper"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| base\_url | AWS API Gateway base url |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
