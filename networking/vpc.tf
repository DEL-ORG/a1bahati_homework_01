# # Define provider
# provider "aws" {
#   region = "us-east-1" # Change to your desired AWS region
# }

# # Create VPC
# resource "aws_vpc" "vpc_003" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "vpc_03"
#   }
# }

# # Create Internet Gateway
# resource "aws_internet_gateway" "igw_003" {
#   vpc_id = aws_vpc.vpc_003.id
#   tags = {
#     Name = "igw_03"
#   }
# }

# # Create Public Subnet
# resource "aws_subnet" "public_subnet" {
#   vpc_id                  = aws_vpc.vpc_003.id
#   cidr_block              = "10.0.1.0/24"
#   map_public_ip_on_launch = true
#   availability_zone       = "us-east-1a" # Change as needed
#   tags = {
#     Name = "public-subnet"
#   }
# }

# # Create Private Subnet
# resource "aws_subnet" "private_subnet" {
#   vpc_id            = aws_vpc.vpc_003.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "us-east-1a" # Change as needed
#   tags = {
#     Name = "private-subnet"
#   }
# }

# # Create Route Table
# resource "aws_route_table" "public_route_table" {
#   vpc_id = aws_vpc.vpc_003.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw_003.id
#   }
#   tags = {
#     Name = "public-route-table"
#   }
# }
# # Associate Public Route Table with Public Subnet
# resource "aws_route_table_association" "public_association" {
#   subnet_id      = aws_subnet.public_subnet.id
#   route_table_id = aws_route_table.public_route_table.id
# }

# # Private Route Table (Optional for demonstration)
# resource "aws_route_table" "private_route_table" {
#   vpc_id = aws_vpc.vpc_003.id
#     route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw_003.id
#   }
#     tags = {
#     Name = "private-route-table"
#   }
# }

# # Associate Private Route Table with Private Subnet
# resource "aws_route_table_association" "private_association" {
#   subnet_id      = aws_subnet.private_subnet.id
#   route_table_id = aws_route_table.private_route_table.id
# }
