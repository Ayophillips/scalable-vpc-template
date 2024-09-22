resource "aws_s3_bucket" "apinfra_remote_state_bucket" {
  bucket = var.terraform_state_bucket
}

resource "aws_s3_bucket_versioning" "apinfra_remote_state_bucket_versioning" {
  bucket = aws_s3_bucket.apinfra_remote_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "apinfra_remote_state_bucket_encryption" {
  bucket = aws_s3_bucket.apinfra_remote_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "apinfra_remote_state_locking" {
  name     = var.dynamo_db_table
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
  point_in_time_recovery {
    enabled = true
  }
  server_side_encryption {
    enabled = true
  }
}
