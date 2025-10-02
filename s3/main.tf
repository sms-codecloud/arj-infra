# Create S3 bucket
resource "aws_s3_bucket" "this" {
  bucket = "arj-bootcamp"

  tags = {
    Name        = "shankar-arj"
    Environment = "Dev"
  }
}
