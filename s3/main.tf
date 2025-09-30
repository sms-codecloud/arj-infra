# Create S3 bucket
resource "aws_s3_bucket" "this" {
  bucket = "arj-terraform-state"

  tags = {
    Name        = "shankar-arj"
    Environment = "Dev"
  }
}
