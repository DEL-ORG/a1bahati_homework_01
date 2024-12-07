variable "aws_region" {
  description = "AWS region for the resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name for the VPC and related resources"
  type        = string
}

variable "public_subnets" {
  description = "Configuration for public subnets"
  type = map(object({
    cidr_block       = string
    availability_zone = string
  }))
  default = {
    a = { cidr_block = "10.0.1.0/24", availability_zone = "us-east-1a" }
    b = { cidr_block = "10.0.3.0/24", availability_zone = "us-east-1b" }
    c = { cidr_block = "10.0.5.0/24", availability_zone = "us-east-1c" }
  }
}


variable "private_subnets" {
  description = "Configuration for private subnets"
  type = map(object({
    cidr_block       = string
    availability_zone = string
    nat_gateway      = string
  }))
  default = {
    a = { cidr_block = "10.0.2.0/24", availability_zone = "us-east-1a", nat_gateway = "a" }
    b = { cidr_block = "10.0.4.0/24", availability_zone = "us-east-1b", nat_gateway = "b" }
    c = { cidr_block = "10.0.6.0/24", availability_zone = "us-east-1c", nat_gateway = "c" }
  }
}


variable "nat_gateways" {
  description = "Mapping of NAT gateways"
  type = map(object({
    subnet = string
  }))
  default = {
    a = { subnet = "a" }
    b = { subnet = "b" }
    c = { subnet = "c" }
  }
}



