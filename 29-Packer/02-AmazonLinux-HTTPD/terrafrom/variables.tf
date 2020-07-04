variable "key_name" {
  default = "terrafrom_key_pair"
}

variable "pvt_key" {
  default = "/root/.ssh/terrafrom_key_pair.pem"
}

variable "us-east-zones" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "sg-id" {
  default = "sg-06c7fd1337728e001"
}
