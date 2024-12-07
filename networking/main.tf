# Define provider
provider "aws" {
  region = "us-east-1" # Change to your desired AWS region
}


## Terraform block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
# Create VPC
resource "aws_vpc" "vpc_003" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc_03"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw_003" {
  vpc_id = aws_vpc.vpc_003.id
  tags = {
    Name = "igw_03"
  }
}

# Create Public Subnets
resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.vpc_003.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
    Name = "public-subnet-a"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = aws_vpc.vpc_003.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"
  tags = {
    Name = "public-subnet-b"
  }
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id                  = aws_vpc.vpc_003.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1c"
  tags = {
    Name = "public-subnet-c"
  }
}

# Create Private Subnets
resource "aws_subnet" "private_subnet_a" {
  vpc_id            = aws_vpc.vpc_003.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-subnet-a"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id            = aws_vpc.vpc_003.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-subnet-b"
  }
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id            = aws_vpc.vpc_003.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "private-subnet-c"
  }
}

# Create NAT Gateways
resource "aws_eip" "nat_eip_a" {
  vpc = true
  tags = {
    Name = "nat-eip-a"
  }
}

resource "aws_nat_gateway" "nat_gateway_a" {
  allocation_id = aws_eip.nat_eip_a.id
  subnet_id     = aws_subnet.public_subnet_a.id
  tags = {
    Name = "nat-gateway-a"
  }
}

resource "aws_eip" "nat_eip_b" {
  vpc = true
  tags = {
    Name = "nat-eip-b"
  }
}

resource "aws_nat_gateway" "nat_gateway_b" {
  allocation_id = aws_eip.nat_eip_b.id
  subnet_id     = aws_subnet.public_subnet_b.id
  tags = {
    Name = "nat-gateway-b"
  }
}

resource "aws_eip" "nat_eip_c" {
  vpc = true
  tags = {
    Name = "nat-eip-c"
  }
}

resource "aws_nat_gateway" "nat_gateway_c" {
  allocation_id = aws_eip.nat_eip_c.id
  subnet_id     = aws_subnet.public_subnet_c.id
  tags = {
    Name = "nat-gateway-c"
  }
}

# Create Route Tables
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_003.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_003.id
  }
  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_association_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_association_b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_association_c" {
  subnet_id      = aws_subnet.public_subnet_c.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table" "private_route_table_a" {
  vpc_id = aws_vpc.vpc_003.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_a.id
  }
  tags = {
    Name = "private-route-table-a"
  }
}

resource "aws_route_table_association" "private_association_a" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.private_route_table_a.id
}

resource "aws_route_table" "private_route_table_b" {
  vpc_id = aws_vpc.vpc_003.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_b.id
  }
  tags = {
    Name = "private-route-table-b"
  }
}

resource "aws_route_table_association" "private_association_b" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.private_route_table_b.id
}

resource "aws_route_table" "private_route_table_c" {
  vpc_id = aws_vpc.vpc_003.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_c.id
  }
  tags = {
    Name = "private-route-table-c"
  }
}

resource "aws_route_table_association" "private_association_c" {
  subnet_id      = aws_subnet.private_subnet_c.id
  route_table_id = aws_route_table.private_route_table_c.id
}
