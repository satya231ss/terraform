module "dev" {
  source = "../Day2-all-config-files"
  ami_id = "ami-05ffe3c48a9991133"
  type   = "t3.micro"

}