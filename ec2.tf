# #Create an EC2 instance
# resource "aws_instance" "homework_02" {
#   ami           = var.ami
#   instance_type = var.instance_type
#   key_name      = var.key_name
#   # Security group allowing inbound SSH access
#   vpc_security_group_ids = [aws_security_group.allow_ssh.id]
# }


# resource "aws_instance" "homework_02" {
#   ami                    = var.ami
#   instance_type          = var.instance_type
#   key_name               = var.key_name
#   aws_vpc                = var.ec2_sg02.id
#   vpc_security_group_ids = var.aws_security_group

#  subnet_id = "subnet_002" # 
# }


resource "aws_instance" "homework_02" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name

  # Directly use the security group ID from the variable
  vpc_security_group_ids = [var.aws_security_group.Work-VPC]

  # Reference the created subnet
  subnet_id              = aws_subnet.subnet_002.id

  tags = {
    Name = "Homework-EC2"
  }
}


