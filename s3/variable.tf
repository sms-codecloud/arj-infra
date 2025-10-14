variable "bucket_name" {
  description = "Name of the existing S3 bucket"
  type        = string
}

variable "zip_file_path" {
  description = "Local path to the zip file to upload"
  type        = string
}

variable "s3_key" {
  description = "Key (path) inside the S3 bucket for the uploaded object"
  type        = string
}