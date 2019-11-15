provider "aws" {
  region = "us-west-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "kareem-test-s3-bucket"
  acl    = "public-read"
  policy = file("policy.json")

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

output "s3_bucket_url" {
  value = aws_s3_bucket.b.website_endpoint
}