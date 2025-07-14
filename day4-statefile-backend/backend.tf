terraform {
  backend "s3" {
    bucket = "rajasaty"
    key = "terraform.tfstate"
    region = "us-east-1"
    #use_lockfile = true
    dynamodb_table = "satya"
     encrypt = true
    
  }
}

