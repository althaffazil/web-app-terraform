provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = var.os_ami_id
  instance_type = var.instance_type
  count = 1
  key_name = "SAMPLE_AWS_KEY_ADMIN"
  security_groups = ["launch-wizard-3"]

  tags = {
    Name = "demo-server-${count.index+1}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install docker.io -y",
      "sudo usermod -aG docker ${var.ssh_username} && newgrp docker",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "docker --version",
      "docker pull ${var.docker_image}",
      "docker run -d -p 5000:5000 ${var.docker_image}"
    ]
  }

  connection {
    type = "ssh"
    user = var.ssh_username
    private_key =var.private_key_path
    host = self.public_ip
  }

}

output "instance_public_ip" {
  value = "aws_instance.web.public_ip"
}
