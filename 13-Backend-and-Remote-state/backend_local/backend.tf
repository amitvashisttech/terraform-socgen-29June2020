terraform {
  backend "local" {
    path = "/tmp/terraform-local/backend/terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-039a49e70ea773ffc"
  instance_type = "t2.micro"
}
