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
  description = "Mapping of public subnets"
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

variable "private_subnets" {
  description = "Mapping of private subnets"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    nat_gateway       = string
  }))
}

variable "nat_gateways" {
  description = "Mapping of NAT gateways"
  type = map(object({
    subnet = string
  }))
}
