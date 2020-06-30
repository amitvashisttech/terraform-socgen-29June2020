provider "aws" {
#  access_key = "ACCESS_KEY"
#  secret_key = "SECRET_KEY"
  region     = "us-east-1"
}

provider "aws" {
  alias      = "us-west-2"
#  access_key = "ACCESS_KEY"
#  secret_key = "SECRET_KEY"
  region     = "us-west-2"
}



variable "us-east-zones" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "us-west-zones" {
  default = ["us-west-2c", "us-west-2b"]
}

variable "multi-region-deployment" {
  default = true
}

variable "environment-name" {
  default = "Terraform-demo"
}

resource "aws_instance" "frontend" {
  tags = {
    Name = "${join("-",list(var.environment-name, "frontend"))}"
  }

  depends_on        = ["aws_instance.backend"]
  availability_zone = "${var.us-east-zones[count.index]}"
  ami               = "ami-039a49e70ea773ffc"
  instance_type     = "t2.micro"
}

resource "aws_instance" "west_frontend" {
  tags = {
    Name = "${join("-",list(var.environment-name, "frontend"))}"
  }

  count             = "${var.multi-region-deployment ? 1 : 0}"
  depends_on        = ["aws_instance.west_backend"]
  provider          = "aws.us-west-2"
  ami               = "ami-008c6427c8facbe08"
  availability_zone = "${var.us-west-zones[count.index]}"
  instance_type     = "t2.micro"
}

resource "aws_instance" "backend" {
  tags = {
    Name = "${join("-", list(var.environment-name, "backend"))}"
  }
  count             = 2
  availability_zone = "${var.us-east-zones[count.index]}"
  ami               = "ami-039a49e70ea773ffc"
  instance_type     = "t2.micro"
}

resource "aws_instance" "west_backend" {
  tags = {
    Name = "${join("-", list(var.environment-name, "backend"))}"
  }

  provider          = "aws.us-west-2"
  ami               = "ami-008c6427c8facbe08"
  count             = "${var.multi-region-deployment ? 2 : 0}"
  availability_zone = "${var.us-west-zones[count.index]}"
  instance_type     = "t2.micro"
}

output "frontend_ip" {
  value = "${aws_instance.frontend.public_ip}"
}

output "backend_ips" {
  value = "${aws_instance.backend.*.public_ip}"
}

output "west_frontend_ip" {
  value = "${aws_instance.west_frontend.*.public_ip}"
}

output "west_backend_ips" {
  value = "${aws_instance.west_backend.*.public_ip}"
}
