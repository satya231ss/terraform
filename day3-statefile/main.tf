resource "aws_instance" "name" {
  ami = "ami-05ffe3c48a9991133"
  instance_type = "t3.micro"
  key_name = "test"
  tags = {
    Name = "Day3"
  }
}
resource "aws_s3_bucket" "name" {
  bucket = "rajasaty"
}