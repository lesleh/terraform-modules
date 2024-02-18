data "archive_file" "current_time_zip" {
  type        = "zip"
  source_file = "${path.module}/current_time.js"
  output_path = "${path.module}/current_time.zip"
}

resource "aws_lambda_function_url" "current_time_url" {
  function_name      = aws_lambda_function.current_time_function.function_name
  authorization_type = "NONE"
}

resource "aws_lambda_function" "current_time_function" {
  function_name = "current_time"

  filename         = data.archive_file.current_time_zip.output_path
  source_code_hash = data.archive_file.current_time_zip.output_base64sha256

  handler = "current_time.handler"
  runtime = "nodejs20.x"

  role = aws_iam_role.iam_for_current_time.arn
}

resource "aws_iam_role" "iam_for_current_time" {
  name = "iam_for_lambda"

  assume_role_policy = file("${path.module}/iam_role_policy.json")
}
