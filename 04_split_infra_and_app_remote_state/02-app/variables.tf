variable "lambda_s3_bucket" {
  description = "S3 Bucket where lambda code is uploaded"
  default     = "test-tf-lambda-s3"
}

variable "lambda_name" {
  description = "Lambda function name"
  default     = "test-tf-lambda"
}

variable "lambda_role" {
  description = "Lambda IAM role name"
  default     = "test-tf-lambda-role"
}

variable "lambda_iam_policy_document" {
  description = "Lambda IAM policy document"
  default     = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

variable "lambda_zip_file_path" {
  description = "Lambda function code zip file path"
}

variable "lambda_handler" {
  description = "Lambda function handler"
  default     = "lambda.lambda_handler"
}

variable "lambda_runtime" {
  description = "Lambda function runtime"
  default     = "python3.7"
}

variable "lambda_timeout" {
  description = "Lambda function timeout"
  default     = 60
}

variable "lambda_description" {
  description = "Lambda function description"
  default     = "Test lambda"
}
