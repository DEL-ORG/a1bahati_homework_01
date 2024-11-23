

# Create a new VPC
resource "aws_vpc" "Homework_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Work-VPC"
  }
}

# Create a new subnet in the VPC
resource "aws_subnet" "subnet_002" {
  vpc_id                  = aws_vpc.Homework_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "New-Subnet"
  }
}

