resource "aws_s3_bucket" "name" {
  bucket = "rajasaty"
  
}

resource "aws_instance" "name" {
  ami = var.ami_id
  instance_type = var.type
  key_name = "test"
}

resource "aws_instance" "day2" {
  ami = var.ami_id
  instance_type = var.type
  key_name = "test"
}