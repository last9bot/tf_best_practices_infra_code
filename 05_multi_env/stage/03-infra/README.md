# Overview

- Saves state in s3 bucket created in [01-base](../01-base)
- Deploy AWS API gateway with lambda integration.
- Refers to the lambda created in [02-app](./02-app)

## Commands

- Deploy the infra:

  ```sh
  make init
  make plan
  make apply
  ```

- Verify the API GW url:

  ```sh
  sleep 10 && curl $(terraform output -json | jq -r '.base_url.value')test/breakfast
  ```

- Destroy the infra:

  ```sh
  make destroy
  ```

## Usage

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12, < 0.13, < 1.0 |
| aws | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| terraform | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| api\_name | n/a | `any` | n/a | yes |
| burst\_limit | n/a | `any` | n/a | yes |
| rate\_limit | n/a | `any` | n/a | yes |
| resource\_names | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| base\_url | AWS API Gateway base url |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
