# Data source for existing IAM role
data "aws_iam_role" "lambda_role" {
  name = "${var.environment}-${var.project}-api"
}

# Lambda function
resource "aws_lambda_function" "main" {
  filename         = data.archive_file.lambda_zip.output_path
  function_name    = "${var.environment}-${var.project}-api"
  role             = data.aws_iam_role.lambda_role.arn
  handler          = "index.lambda_handler"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "python3.12"
  memory_size      = 128
  timeout          = 3

  environment {
    variables = {
      ENVIRONMENT = var.environment
      PROJECT     = var.project
    }
  }
}

# Archive for Lambda deployment package
data "archive_file" "lambda_zip" {
  type                    = "zip"
  source_content          = <<EOF
import json

def lambda_handler(event, context):
    return {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json'
        },
        'body': json.dumps({
            'message': 'Hello from Lambda!',
            'environment': '${var.environment}',
            'project': '${var.project}'
        })
    }
EOF
  source_content_filename = "index.py"
  output_path             = "${path.module}/lambda_function.zip"
}

# Lambda Function URL
resource "aws_lambda_function_url" "main" {
  function_name      = aws_lambda_function.main.function_name
  authorization_type = "NONE"
}

# CloudWatch Log Group
resource "aws_cloudwatch_log_group" "main" {
  name              = "/aws/lambda/${var.environment}-${var.project}-api"
  retention_in_days = 7
}
