# S3バケット
resource "aws_s3_bucket" "s3bucket" {
  bucket = var.bucket_name
  tags   = var.tags
}

# オブジェクト所有権
resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.s3bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# パブリックアクセスブロック
resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket                  = aws_s3_bucket.s3bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# デフォルト暗号化
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.s3bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# バージョニング
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.s3bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
