# Overview

- Saves state in s3 bucket created in [01-base](../01-base)
- Upload lambda zip file from local path to s3 bucket.
- Deploy lambda.

## Commands

- Deploy the infra:

  ```sh
  terraform init -backend=true -backend-config="bucket=test-tf-state-bucket-1" -backend-config="key=app.tfstate"

  terraform plan -var-file ../../common/common.tfvars -var-file ../../common/lambda.tfvars -var-file input.tfvars -out tfplan && terraform apply tfplan
  ```

- Destroy the infra:

  ```sh
  terraform destroy -auto-approve -var-file ../../common/common.tfvars -var-file ../../common/lambda.tfvars -var-file input.tfvars
  ```

## Usage

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12, < 0.13, < 1.0 |
| aws | ~> 2.0 |

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
