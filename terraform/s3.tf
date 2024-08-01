resource "aws_s3_bucket" "unleash_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "unleash_bucket"
  }
}