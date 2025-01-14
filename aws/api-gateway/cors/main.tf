module "cors" {
  source = "squidfunk/api-gateway-enable-cors/aws"
  version = "0.3.3"
  allow_headers = [
    "Authorization",
    "Content-Type",
    "X-Amz-Date",
    "X-Amz-Security-Token",
    "X-Api-Key",
    "X-Blueflag-Service-Name"
  ]
  api_id          = var.api_id
  api_resource_id = var.api_resource_id
}