data "aws_subnet" "sub" {
    filter {
      name = "tag:Name"
      values = ["dev"]
    }
  
}

resource "aws_instance" "name" {
  ami = "ami-05ffe3c48a9991133"
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.sub.id
  tags = {
    name = "frontend"
  }
}