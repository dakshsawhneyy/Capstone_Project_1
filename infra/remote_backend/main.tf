################ S3 Bucket ################
resource "aws_s3_bucket" "demo" {
  bucket = var.bucket_name
}

################ DynamoDB Lock ################
resource "aws_dynamodb_table" "terraform_lock" {
  name = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}