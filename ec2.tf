resource "aws_instance" "homework_01" {
  ami           = "ami-0cde6390e61a03eee"  # Replace with an AMI ID of your choice
  instance_type = "t2.micro"
  subnet_id     = "subnet-080ae30c3b2f0782f"        # Replace with the actual Subnet ID

  tags = {
    Name = "Homework_EC2Instance"
  }
}


# Security Group allowing SSH access
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
