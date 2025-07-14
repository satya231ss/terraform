resource "aws_instance" "name" {
  ami = "ami-05ffe3c48a9991133"
  instance_type = "t3.micro"
  tags = {
    Name = "Day3"
  }
}
resource "aws_instance" "test" {
  ami = "ami-05ffe3c48a9991133"
  instance_type = "t3.micro"
  tags = {
    Name = "Day4"
  }
}
