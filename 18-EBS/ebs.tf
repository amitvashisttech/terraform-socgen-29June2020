provider "aws" {
  region = "us-east-1"
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.example.id}"
  instance_id = "${aws_instance.web.id}"
}

resource "aws_instance" "web" {
  ami               = "ami-039a49e70ea773ffc"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"
  key_name          = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  tags {
    Name = "web-ebs-instance"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 50
}


resource "aws_instance" "backend" {
  ami               = "ami-039a49e70ea773ffc"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"

  tags {
    Name = "HelloWorld"
  }
}

