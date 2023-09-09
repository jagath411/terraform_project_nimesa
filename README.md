# terraform_project_nimesaTerraform AWS VPC and EC2 Instance
This project uses Terraform to create a VPC with one private subnet and one public subnet. It then creates an EC2 instance in the public subnet and attaches a security group to the instance. The security group will allow SSH traffic from anywhere and all outbound traffic.

Requirements
Terraform
An AWS account
Instructions
Clone the repository to your local machine.
Install the dependencies by running the following command:
terraform init


3. Create the resources by running the following command:

terraform apply

The resources will be created in your AWS account. You can SSH into the EC2 instance by using the public IP address.
License
This project is licensed under the MIT License.
