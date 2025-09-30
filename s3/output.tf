output "name" {
  value = aws_s3_bucket.this.bucket.arn
  description = "ARN of the S3 bucket"
}