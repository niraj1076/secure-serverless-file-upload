output "s3_bucket_name" {
  value = aws_s3_bucket.uploads.bucket
}

output "dynamodb_table" {
  value = aws_dynamodb_table.file_logs.name
}

output "sns_topic_arn" {
  value = aws_sns_topic.upload_notifications.arn
}


output "lambda_role_arn" {
  value = aws_iam_role.lambda_role.arn
}

