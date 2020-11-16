module "apigw" {
  source            = "git::https://github.com/last9bot/tf_best_practices_sample_module.git//apigw?ref=v0.0.1"
  api_name          = var.api_name
  resource_names    = var.resource_names
  lambda_name       = data.terraform_remote_state.app.outputs.lambda_function_name
  lambda_invoke_arn = data.terraform_remote_state.app.outputs.lambda_function_invoke_arn
  burst_limit       = var.burst_limit
  rate_limit        = var.rate_limit
}
