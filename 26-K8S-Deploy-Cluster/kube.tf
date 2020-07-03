module "kubernetes" {
  source = "./kubernetes"
  region = "us-east1"

  project_id_map = {
    default = "cool-beanbag-272708"
  }
}

output "connection-command" {
  value = "${module.kubernetes.connect-string}"
}
