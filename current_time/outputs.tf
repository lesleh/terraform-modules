output "lambda_function_url" {
  description = "The URL of the current time Lambda function"
  value       = aws_lambda_function_url.current_time_url.function_url
}
