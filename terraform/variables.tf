variable "aws_region" {
  description = "The AWS region to deploy the resources in"
  default     = "us-west-2"
}

variable "docker_image" {
  description = "The Docker image to pull from Docker Hub"
  type        = string
  default     = "your-dockerhub-username/basic_flask_app:latest"
}

variable "ssh_username" {
  description = "SSH username for connecting to the EC2 instance"
  type        = string
  default     = "ec2-user"
}

variable "private_key_path" {
  description = "Path to the private SSH key file (.pem)"
  type        = string
  default     = "path_to_pem_file"  # Update to the path of your .pem key file
}

variable "aws_ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami_id"  # Update to the AMI ID for your region
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}
