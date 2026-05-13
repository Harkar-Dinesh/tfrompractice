resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "my-terraform-lambda-bucket-123456789"
}

resource "aws_s3_object" "lambda_zip" {

  bucket = aws_s3_bucket.lambda_bucket.bucket

  key = "app.zip"

  source = "app.zip"

  etag = filemd5("app.zip")
}

resource "aws_iam_role" "lambda_role" {

  name = "terraform_lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "lambda.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {

  role = aws_iam_role.lambda_role.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "my_lambda" {

  function_name = "terraform-s3-lambda"

  role = aws_iam_role.lambda_role.arn

  runtime = "python3.11"

  handler = "app.lambda_handler"

  s3_bucket = aws_s3_bucket.lambda_bucket.bucket

  s3_key = aws_s3_object.lambda_zip.key

  depends_on = [
    aws_iam_role_policy_attachment.lambda_policy
  ]
}