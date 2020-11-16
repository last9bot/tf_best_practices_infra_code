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
  filename         = "lambda.zip"
  function_name    = var.lambda_name
  role             = aws_iam_role.lambda.arn
  handler          = "lambda.lambda_handler"
  runtime          = "python3.6"
  source_code_hash = filebase64sha256("lambda.zip")
}
