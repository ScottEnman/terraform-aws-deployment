# Print the EC2 Instance ID to the terminal
output "instance_id" {
    description = "ID of the EC2 instance"
    value       = aws_instance.app_instance.id
}

# Print the EC2 Instance Public IP address to the terminal
output "instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value       = aws_instance.app_instance.public_ip
}