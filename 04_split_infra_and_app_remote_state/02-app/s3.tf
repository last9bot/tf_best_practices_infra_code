resource "aws_s3_bucket" "test" {
  bucket = replace(var.lambda_s3_bucket, "_", "-")
  acl    = "private"
  versioning {
    enabled = true
  }
  tags = {
    Name = var.lambda_s3_bucket
  }
}

resource "aws_s3_bucket_object" "test" {
  bucket = aws_s3_bucket.test.id
  key    = "${var.lambda_name}.zip"
  source = var.lambda_zip_file_path
  etag   = filemd5(var.lambda_zip_file_path)
}
