resource "aws_instance" "homework_01" {
  ami           = "ami-0cde6390e61a03eee"  # Replace with an AMI ID of your choice
  instance_type = "t2.micro"
  subnet_id     = "subnet-080ae30c3b2f0782f"        # Replace with the actual Subnet ID

  tags = {
    Name = "Homework_EC2Instance"
  }
}


