# Overview

- Saves state in s3 bucket created in [01-base](../01-base)
- Upload lambda zip file from local path to s3 bucket.
- Deploy lambda.

## Commands

- Deploy the infra:

  ```sh
  make init
  make plan
  make apply
  ```

- Destroy the infra:

  ```sh
  make destroy
  ```

- Verify the API GW url:

  ```sh
  sleep 10 && curl $(terraform output -json | jq -r '.base_url.value')test/breakfast
  ```

## Usage

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12, < 0.13, < 1.0 |
| aws |  2.62.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| lambda\_description | n/a | `any` | n/a | yes |
| lambda\_handler | n/a | `any` | n/a | yes |
| lambda\_iam\_policy\_document | n/a | `any` | n/a | yes |
| lambda\_memory\_size | n/a | `any` | n/a | yes |
| lambda\_name | n/a | `any` | n/a | yes |
| lambda\_role | n/a | `any` | n/a | yes |
| lambda\_runtime | n/a | `any` | n/a | yes |
| lambda\_s3\_bucket | n/a | `any` | n/a | yes |
| lambda\_timeout | n/a | `any` | n/a | yes |
| lambda\_zip\_file\_path | n/a | `any` | n/a | yes |
| tags | n/a | `map` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| lambda\_function\_invoke\_arn | Lambda function invoke arn |
| lambda\_function\_name | Lambda function |
| lambda\_role\_arn | Lambda role arn |
| lambda\_s3\_id | Lambda S3 bucket name |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
