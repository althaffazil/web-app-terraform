variable "docker_image" {
  default = "cybervamp/basic_flask_app:latest"
}

variable "ssh_username" {
  default = "ubuntu"
}

variable "private_key_path" {
  default = "D:\\Backup\\SAMPLE_AWS_KEY_ADMIN.pem"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "os_ami_id" {
  default = "ami-04a81a99f5ec58529"
}

variable "instance_type" {
  default = "t2.micro"
}