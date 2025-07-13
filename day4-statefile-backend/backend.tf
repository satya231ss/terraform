terraform {
  backend "s3" {
    bucket = "rajasaty"
    key = "terraform.tfstate"
    region = "us-east-1"
    
  }
}

