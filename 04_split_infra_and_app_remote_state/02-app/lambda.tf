resource "aws_iam_role" "lambda" {
  name = var.lambda_role

  assume_role_policy = <<POLICY
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

resource "aws_lambda_function" "test" {
  s3_bucket        = aws_s3_bucket.test.id
  s3_key           = "${var.lambda_name}.zip"
  function_name    = var.lambda_name
  description      = var.lambda_description
  role             = aws_iam_role.lambda.arn
  handler          = var.lambda_handler
  runtime          = var.lambda_runtime
  timeout          = var.lambda_timeout
  source_code_hash = filebase64sha256(var.lambda_zip_file_path)
  depends_on       = [aws_s3_bucket_object.test]
  tags = {
    Name = var.lambda_name
  }
}
