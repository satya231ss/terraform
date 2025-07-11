terraform {
  backend "s3" {
    bucket = "rajasaty"
    key = "terraform.tfstate"
    region = "us-east-1"
    
  }
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
}