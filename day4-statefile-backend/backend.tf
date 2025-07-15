terraform {
  backend "s3" {
    bucket = "rajasaty"
    key = "terraform.tfstate"
    region = "us-east-1"
<<<<<<< HEAD
    #use_lockfile = true
    dynamodb_table = "satya"
     encrypt = true
    
=======
    use_lockfile = true
    #dynamodb_table = "satya"
    encrypt = true
>>>>>>> 48d4d03 (new changes)
  }
}

