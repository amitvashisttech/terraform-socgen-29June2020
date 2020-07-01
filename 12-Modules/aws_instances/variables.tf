variable "amis" {
  type = "map"
  default = {
    us-east-1 = "ami-039a49e70ea773ffc"
    us-west-2 = "ami-008c6427c8facbe08"
  }
}

variable "region" {
  default="us-east-1"
}

variable "total_instances" {
  default=1
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
