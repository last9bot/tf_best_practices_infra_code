lambda_s3_bucket           = "test-tf-lambda-s3"
lambda_name                = "test-tf-lambda"
lambda_description         = "Test lambda"
lambda_role                = "test-tf-lambda-role"
lambda_handler             = "lambda.lambda_handler"
lambda_runtime             = "python3.7"
lambda_zip_file_path       = "../../../app_code/lambda.zip"
lambda_timeout             = 60
lambda_memory_size         = 128
lambda_iam_policy_document = <<POLICY
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
