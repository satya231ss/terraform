output "ip" {
  value = aws_instance.name.public_ip
}
output "az" {
  value = aws_instance.day2.availability_zone
}