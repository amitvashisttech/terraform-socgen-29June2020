provider "aws" {
 # access_key = "ACCESS_KEY"
 # secret_key = "SECRET_KEY"
  region     = "us-west-2"
}


resource "aws_instance" "base" {
  ami           = "ami-0a243dbef00e96192"
  instance_type = "t2.micro"
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_instance" "frontend" {
  depends_on    = ["aws_instance.backend"]
  ami           = "ami-008c6427c8facbe08"
  instance_type = "t2.micro"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "backend" {
  count         = 2
  ami           = "ami-008c6427c8facbe08"
  instance_type = "t2.micro"
  timeouts {
    create = "60m"
    delete = "2h"
  }
}



