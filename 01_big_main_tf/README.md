# Overview

One main.tf to rule them all. Does the following:

- Deploys a test lambda from local zip file.
- Deploys an API Gateway with lambda integration.

## Commands

- Zip the lambda code:

  ```sh
  zip lambda.zip lambda.py
  ```

- Deploy the infra:

  ```sh
  terraform init
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
| lambda\_name | API Gateway integration lambda name | `string` | `"test-tf-lambda"` | no |
| lambda\_role | API Gateway integration lambda role | `string` | `"test-tf-lambda-role"` | no |
| rate\_limit | API Gateway rate limit | `number` | `5` | no |
| resource\_names | Resources to create | `list` | <pre>[<br>  "breakfast",<br>  "lunch",<br>  "supper"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| base\_url | AWS API Gateway base url |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
