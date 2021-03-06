variable "api_name" {
  description = "API Gateway REST API name"
  default     = "test-tf-apigw"
}

variable "resource_names" {
  description = "Resources to create"
  type        = list
  default     = ["breakfast", "lunch", "supper"]
}

variable "burst_limit" {
  description = "API Gateway burst limit"
  default     = 2
}

variable "rate_limit" {
  description = "API Gateway rate limit"
  default     = 5
}

variable "lambda_name" {
  description = "API Gateway integration lambda name"
  default     = "test-tf-lambda"
}

variable "lambda_role" {
  description = "API Gateway integration lambda role"
  default     = "test-tf-lambda-role"
}
