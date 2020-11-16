variable "lambda_s3_bucket" {}

variable "lambda_name" {}

variable "lambda_description" {}

variable "lambda_role" {}

variable "lambda_iam_policy_document" {}

variable "lambda_zip_file_path" {}

variable "lambda_handler" {}

variable "lambda_runtime" {}

variable "lambda_memory_size" {}

variable "lambda_timeout" {}

variable "tags" {
  type = map
}
