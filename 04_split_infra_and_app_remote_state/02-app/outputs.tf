output "lambda_function_name" {
  description = "Lambda function"
  value       = aws_lambda_function.test.function_name
}

output "lambda_function_invoke_arn" {
  description = "Lambda function invoke arn"
  value       = aws_lambda_function.test.invoke_arn
}

output "lambda_s3_id" {
  description = "Lambda S3 bucket name"
  value       = aws_s3_bucket.test.id
}

output "lambda_role_arn" {
  description = "Lambda role arn"
  value       = aws_iam_role.lambda.arn
}
