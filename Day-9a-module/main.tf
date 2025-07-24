module "name" {
  source = "../Day-9-Modules"
  ami_id = "ami-05ffe3c48a9991133"
  instance_type = "t3.micro"
  #key = "test"
  az= "us-east-1a"


}