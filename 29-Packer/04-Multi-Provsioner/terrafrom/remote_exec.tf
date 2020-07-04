provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "frontend" {
  availability_zone      = "${var.us-east-zones[count.index]}"
  ami                    = "ami-09470870b4f729d09"
  instance_type          = "t2.micro"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  }
