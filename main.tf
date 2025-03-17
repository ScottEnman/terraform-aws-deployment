# Add the AWS Provider
provider "aws" {
  profile = "default"
  region = "us-east-1"
}

# Create a Virtual Private Cloud (VPC)
resource "aws_vpc" "test_vpc" {
    cidr_block = var.vpc_cidr

    tags = {
        Name = var.vpc_name
    }
}

# Create a Subnet
resource "aws_subnet" "test_subnet" {
    vpc_id = aws_vpc.test_vpc.id
    cidr_block = var.subnet_cidr

    tags = {
        Name = var.subnet_name
    }
}

# Create an Internet Gateway (route to the internet)
resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.test_vpc.id

    tags = {
        Name = var.igw_name
    }
}

# Create a route table for the Internet Gateway
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.test_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ig.id
    }

    tags = {
        Name = var.igw_name
    
    }
}

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "public_1_rt_assoc" {
    subnet_id = aws_subnet.test_subnet.id
    route_table_id = aws_route_table.public_rt.id
}

# Create a new Security Group open to HTTP traffic
resource "aws_security_group" "app_sg" {
    name = "HTTP"
    vpc_id = aws_vpc.test_vpc.id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# Create an EC2 instance for our web server
resource "aws_instance" "app_instance" {
    ami = var.ec2_ami
    instance_type = "t2.micro"

    subnet_id = aws_subnet.test_subnet.id
    vpc_security_group_ids = [aws_security_group.app_sg.id]
    associate_public_ip_address = true

    user_data = <<-EOF
    #!/bin/bash -ex

    sudo yum install nginx -y
    echo "<h1>This is an NGINX server</h1>" > /usr/share/nginx/html/index.html
    sudo systemctl enable nginx
    sudo systemctl start nginx
    EOF

    tags = {
        "Name" : var.ec2_name
    }
}