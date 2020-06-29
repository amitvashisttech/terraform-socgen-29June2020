provider "aws" {
 # access_key = "Access Key"
 # secret_key = "Secrey Key"
  region     = "us-west-2"
}
resource "aws_instance" "example" {
  ami           = "ami-008c6427c8facbe08"
  instance_type = "t2.micro"
}
