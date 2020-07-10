# Params file for variables

#### GLANCE
variable "image" {
  type    = string
  default = "cirros"
}

#### NEUTRON
variable "external_network" {
  type    = string
  default = "external"
}

# UUID of external gateway
variable "external_gateway" {
  type    = string
  default = "05a9e17f-e625-4932-aaf2-c8c05f0d8bfe"
}

variable "dns_ip" {
  type    = list(string)
  default = ["8.8.8.8", "8.8.8.4"]
}

#### VM parameters
variable "flavor_http" {
  type    = string
  default = "m1.medium"
}

variable "network_http" {
  type    = map(string)
  default = {
    subnet_name = "subnet-http"
    cidr        = "192.168.1.0/24"
  }
}

