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
<<<<<<< HEAD
    Name = "Day4"
  }
}
=======
  Name = "Day4"
  }
} 
resource "aws_vpc" "vc" {
  cidr_block = "10.0.1.0/24"
}
>>>>>>> 48d4d03 (new changes)
