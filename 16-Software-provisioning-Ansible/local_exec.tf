provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "backend" {
  availability_zone      = "${var.us-east-zones[count.index]}"
  ami                    = "ami-039a49e70ea773ffc"
  instance_type          = "t2.micro"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.sg-id}"]

  # force Terraform to wait until a connection can be made, so that Ansible doesn't fail when trying to provision
  provisioner "remote-exec" {
    # The connection will use the local SSH agent for authentication
    inline = [
            "echo Successfully connected",
            "sudo apt-get update", 
            "sudo apt-get install sshpass python -y"
           ]

    connection {
      user        = "ubuntu"
      type        = "ssh"
      private_key = "${file(var.pvt_key)}"
    }
  }
}


  

resource "null_resource" "ansible-main" {
  provisioner "local-exec" {
    command = "ansible-playbook -e sshKey=${var.pvt_key} -i '${aws_instance.backend.public_ip},' ./ansible/setup-backend.yaml -v"
  }

  depends_on = ["aws_instance.backend"]
}
