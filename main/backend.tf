terraform {
  backend "s3" {
    bucket = "mojdysk01"
    key    = "projektinzynierski.tfstate"
    region = "us-east-1"
    dynamodb_table = "dynamotable"
  }
}