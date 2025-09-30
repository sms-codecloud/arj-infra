output "name" {
  value = aws_s3_bucket.this.arn
  description = "ARN of the S3 bucket"
}