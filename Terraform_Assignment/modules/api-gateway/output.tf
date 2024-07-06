output "api_gateway_url" {
  description = "The URL of the API Gateway"
  value       = "${aws_api_gateway_deployment.moso_interior_deployment.invoke_url}/${var.environment}"
}
