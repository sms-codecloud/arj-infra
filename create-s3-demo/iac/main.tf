resource "aws_s3_bucket" "this" {
  bucket        = "arj-bucket-via-iac"
  force_destroy = true
}