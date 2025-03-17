# Set variables
variable "vpc_cidr" {
    description = "Value of the CIDR range for the VPC"
    type = string
    default = "10.0.0.0/16"
}

variable "vpc_name" {
    description = "Value of the Name for the VPC"
    type = string
    default = "TestVPC"
}

variable "subnet_cidr" {
    description = "Value of the subnet CIDR for the VPC"
    type = string
    default = "10.0.1.0/24"
}

variable "subnet_name" {
    description = "Value of the subnet name for the VPC"
    type = string
    default = "TestSubnet"
}

variable "igw_name" {
    description = "Value of the Internet Gateway for the VPC"
    type = string
    default = "TestIGW"
}

variable "ec2_ami" {
    description = "Value of the AMI ID for the EC2 Instance"
    type = string
    default = "YOUR-EC2-AMI"
}

variable "ec2_name" {
    description = "Value of the Name for the EC2 Instance"
    type = string
    default = "TestEC2"
}