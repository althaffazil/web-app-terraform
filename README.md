# Flask Application Deployment with Terraform and Docker

This project demonstrates how to deploy a basic Flask application on an AWS EC2 instance using Terraform and Docker. The Terraform configuration will set up an EC2 instance, install Docker, and run a Docker container with your Flask application.

## Prerequisites

Before you begin, ensure you have the following:

- An AWS account.
- AWS CLI installed and configured with your credentials.
- Terraform installed on your machine.
- A Docker image of your Flask application pushed to Docker Hub.
- A private SSH key file (`.pem`), which you can use to connect to your EC2 instance.

1. **Initialize Terraform**

   Navigate to the directory containing your Terraform files and initialize Terraform:

   ```bash
   terraform init
   ```

2. **Validate the Configuration**
   
   Validate your Terraform configuration to ensure there are no errors:
   
   ```bash
   terraform validate
   ```

3. **Plan the Deployment**
   
   Create an execution plan to see what actions Terraform will take:
   ```bash
   terraform plan
   ```

4. **Apply the Configuration**

   Apply the Terraform configuration to create the resources:
   ```bash
   terraform apply
   ```
   When prompted, type `yes` to confirm the application.


5. **Access the Flask Application**
   
   After the Terraform apply command completes, you should see the public IP address of your EC2 instance in the output:
   ```bash
   Outputs:
   instance_public_ip = <your-ec2-public-ip>
   ```
   Use this IP address to access your Flask application in a web browser:
   
   ```bash
   http://<your-ec2-public-ip>:5000
   ```

