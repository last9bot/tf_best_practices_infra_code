output "lambda_function_name" {
  description = "Lambda function"
  value       = module.lambda.lambda_function_name
}

output "lambda_function_invoke_arn" {
  description = "Lambda function invoke arn"
  value       = module.lambda.lambda_function_invoke_arn
}

output "lambda_s3_id" {
  description = "Lambda S3 bucket name"
  value       = module.lambda.lambda_s3_id
}

output "lambda_role_arn" {
  description = "Lambda role arn"
  value       = module.lambda.lambda_role_arn
}
