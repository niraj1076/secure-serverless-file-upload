resource "aws_dynamodb_table" "file_logs" {
  name         = "FileLogs"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "fileID"


  attribute {
    name = "fileID"
    type = "S"
  }
}
