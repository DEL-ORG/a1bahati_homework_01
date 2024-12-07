# Define the EC2 instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-0866a3c8686eaeeba"  # Ubuntu AMI ID (adjust to your region)
  instance_type = "t2.micro"               # Instance type
  key_name      = "terraform_key"          # Your existing SSH key pair name

  # Reference the subnet and security group
  subnet_id              = aws_subnet.subnet_002.id
  security_groups = [aws_security_group.ec2_sg001.name] # Correctly reference the security group
  associate_public_ip_address = true        # Automatically assign a public IP to the instance

  # Add a Name tag to the instance
  tags = {
    Name = "Homework001_EC2"
  }

  
}
