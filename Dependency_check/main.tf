provider "aws" {
    region = "us-east-1"
  
}

resource "aws_s3_bucket" "tfstate" {
    bucket = "tf-state-bucket-enterprise-grade"
}

resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1"
  ]
}

resource "aws_iam_role" "github_actions_role" {
  name = "terraform-enterprise-s3-role-1"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"

        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = [
              #"repo:<ORG>/<REPO>:ref:refs/heads/main",
              "repo:ShreyRai/Enterprise-grade-TF-project:*"
            ]
          }
        }
      }
    ]
  })
}