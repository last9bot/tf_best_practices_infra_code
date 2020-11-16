module "lambda" {
  source                     = "git::https://github.com/last9bot/tf_best_practices_sample_module.git//lambda?ref=v0.0.1"
  lambda_s3_bucket           = var.lambda_s3_bucket
  lambda_name                = var.lambda_name
  lambda_description         = var.lambda_description
  lambda_role                = var.lambda_role
  lambda_iam_policy_document = var.lambda_iam_policy_document
  lambda_zip_file_path       = var.lambda_zip_file_path
  lambda_handler             = var.lambda_handler
  lambda_runtime             = var.lambda_runtime
  lambda_memory_size         = var.lambda_memory_size
  lambda_timeout             = var.lambda_timeout
  tags                       = var.tags
}
