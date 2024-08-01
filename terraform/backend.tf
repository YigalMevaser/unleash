terraform {
  backend "s3" {
    bucket         = "unleashtfstatebucket"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "terraform"
  }
}