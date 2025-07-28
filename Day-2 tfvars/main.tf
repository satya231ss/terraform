resource "aws_instance" "day2" {
  ami = var.ami_id
  instance_type = var.type
  #key_name = "test"
}
