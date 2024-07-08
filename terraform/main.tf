provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami           = var.aws_ami_id
  instance_type = var.instance_type
  key_name = "default" # Add your security group
#   count = 1

  tags = {
    Name = "web-server"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y docker",
      "sudo service docker start",
      "sudo usermod -aG docker ${var.ssh_username}",
      "sudo docker --version",
      "sudo docker pull ${var.docker_image}",
      "sudo docker run -d -p 5000:5000 ${var.docker_image}",
    ]
  }

  connection {
    type        = "ssh"
    user        = var.ssh_username
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
}
