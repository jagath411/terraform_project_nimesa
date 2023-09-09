# provider "aws" {
#     region ="us-east-1a"
#     access_key = "AKIA432NVPFLYT3RPXQ5"
#     secret_key = "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"
  
# }


// Create a VPC
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"  
  tags ={
    name="nimesaproject"
  }
}

// Create a public subnet
resource "aws_subnet" "publicsubnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"  
  availability_zone       = "us-east-1a"  
}

// Create a private subnet
resource "aws_subnet" "privatesubnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.2.0/24"  
  availability_zone       = "us-east-1a" 
  
}
// crete Internetgate way
resource "aws_internet_gateway" "idw" {
    vpc_id = aws_vpc.myvpc.id
  
}
// Create a security group allowing SSH and all outbound traffic
resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "Allow SSH inbound and all outbound traffic"
  vpc_id =  aws_vpc.myvpc.id
  ingress {
    description = "inbound rules for ssh port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description = "outbound rules of all traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

// Create an EC2 instance in the public subnet
resource "aws_instance" "Assignment" {
  ami           = "ami-01c647eace872fc02"  #AMAZON LINUX AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.publicsubnet.id

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
   
  }

  tags = {
    Name    = "MyInstance"
    purpose = "Assignment"
  }
}