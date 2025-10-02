# Create S3 bucket
resource "aws_s3_bucket" "this" {
  bucket = "arj-bootcamp"
  force_destroy = true

  tags = {
    Name        = "shankar-arj"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "ui" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}