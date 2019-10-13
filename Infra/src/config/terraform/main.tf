provider "aws" {
  region = "us-west-2"
  shared_credentials_file = "c:\\creds"
  profile = "learning"
}

resource "aws_s3_bucket" "b" {
  bucket = "stas-learning-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
