resource "aws_api_gateway_rest_api" "test" {
  name = var.api_name
}

resource "aws_api_gateway_resource" "food_options" {
  count       = length(var.resource_names)
  path_part   = var.resource_names[count.index]
  parent_id   = aws_api_gateway_rest_api.test.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.test.id
}

resource "aws_api_gateway_method" "food_options" {
  count         = length(var.resource_names)
  rest_api_id   = aws_api_gateway_rest_api.test.id
  resource_id   = aws_api_gateway_resource.food_options[count.index].id
  http_method   = "GET"
  authorization = "NONE"
}


resource "aws_api_gateway_integration" "lambda" {
  count                   = length(var.resource_names)
  rest_api_id             = aws_api_gateway_rest_api.test.id
  resource_id             = aws_api_gateway_resource.food_options[count.index].id
  http_method             = aws_api_gateway_method.food_options[count.index].http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.test.invoke_arn
}

resource "aws_lambda_permission" "test" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.test.execution_arn}/*/*/*"
}

resource "aws_api_gateway_stage" "test" {
  stage_name    = "test"
  rest_api_id   = aws_api_gateway_rest_api.test.id
  deployment_id = aws_api_gateway_deployment.test.id
}

resource "aws_api_gateway_deployment" "test" {
  depends_on = [
    aws_api_gateway_integration.lambda
  ]
  rest_api_id = aws_api_gateway_rest_api.test.id
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_method_settings" "test" {
  rest_api_id = aws_api_gateway_rest_api.test.id
  stage_name  = aws_api_gateway_stage.test.stage_name
  method_path = "*/*"

  settings {
    throttling_burst_limit = var.burst_limit
    throttling_rate_limit  = var.rate_limit
  }
}
