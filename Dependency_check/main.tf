provider "aws" {
    region = "us-east-1"
  
}

resource "aws_s3_bucket" "tfstate" {
    bucket = "tf-state-enterprise-grade-1"
}