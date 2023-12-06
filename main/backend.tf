terraform {
  backend "s3" {
    bucket = "mojdysk01"
    key    = "projektinzynierski.tfstate"
    region = var.region
    dynamodb_table = "dynamotable01"
  }
}