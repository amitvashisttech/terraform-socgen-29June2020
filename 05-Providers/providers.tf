provider "aws" {
 # access_key = "ACCESS_KEY"
 # secret_key = "SECRET_KEY"
  region     = "us-west-2"
}

provider "aws" {
  # access_key = "ACCESS_KEY"
  # secret_key = "SECRET_KEY"
  alias      = "us-east-1"
  region     = "us-east-1"
}

resource "aws_instance" "us_east_example" {
  provider      = "aws.us-east-1"
  ami           = "ami-039a49e70ea773ffc"
  instance_type = "t2.micro"
}

resource "aws_instance" "us_west_example" {
  ami           = "ami-008c6427c8facbe08"
  instance_type = "t2.micro"
}
