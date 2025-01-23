# aws_api_gateway_method.method_options
resource "aws_api_gateway_method" "method_options" {
  rest_api_id   = var.api_id
  resource_id   = var.api_resource_id
  http_method   = "OPTIONS"
  authorization = "NONE"

  lifecycle {
    create_before_destroy = true
  }
}

# aws_api_gateway_integration.api_integration
resource "aws_api_gateway_integration" "api_integration" {
  rest_api_id = var.api_id
  resource_id = var.api_resource_id
  http_method = aws_api_gateway_method.method_options.http_method
  content_handling = "CONVERT_TO_TEXT"

  type = "MOCK"

  request_templates = {
    "application/json" = "{ \"statusCode\": 200 }"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# aws_api_gateway_integration_response.api_integration_response
resource "aws_api_gateway_integration_response" "api_integration_response" {
  rest_api_id = var.api_id
  resource_id = var.api_resource_id
  http_method = aws_api_gateway_method.method_options.http_method
  status_code = 200

  response_parameters = local.integration_response_parameters

  depends_on = [
    aws_api_gateway_integration.api_integration,
    aws_api_gateway_method_response.api_gateway_method_response,
  ]

  lifecycle {
    create_before_destroy = true
  }
}

# aws_api_gateway_method_response.api_gateway_method_response
resource "aws_api_gateway_method_response" "api_gateway_method_response" {
  rest_api_id = var.api_id
  resource_id = var.api_resource_id
  http_method = aws_api_gateway_method.method_options.http_method
  status_code = 200

  response_parameters = local.method_response_parameters

  response_models = {
    "application/json" = "Empty"
  }

  depends_on = [
    aws_api_gateway_method.method_options,
  ]

  lifecycle {
    create_before_destroy = true
  }
}