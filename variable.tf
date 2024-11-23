# Specify your variables
variable "instance_type" {
  default = "t2.micro" # Free tier eligible, change if needed
}
variable "ami" {
  default = "ami-00306b1f5807af5ae" # Amazon Ubuntu AMI in us-west-2 (check AMI ID in your region)
}
variable "key_name" {
  default = "a1_laptop_key" # Replace with your key pair name
}

# variable "aws_security_group" {
#   default = "ec2_sg002" # Replace with your security group name
# }

variable "aws" {
  default = "us-east-1" # Replace with your region name


}

variable "aws_security_group" {
  default = "sg-07078410103a9e100 - ec2_sg002" # Replace with the actual security group ID
}

# # Specify your variables
# variable "instance_type" {
#   default = "t2.micro" # Free tier eligible, change if needed
# }
# variable "ami" {
#   default = "ami-00306b1f5807af5ae" # Amazon Ubuntu AMI in us-west-2 (check AMI ID in your region)
# }
# variable "key_name" {
#   default = "a1_laptop_key" # Replace with your key pair name
# }

# variable "aws_security_group" {
#   default = "ec2_sg02" # Replace with your security group name
# }

# variable "aws" {
#   default = "us-east-1" # Replace with your region name


# }

# variable "aws_vpc" {
#   default = "vpc-04e141361d59ba12f" # Replace with your VPC ID
# }

# variable "aws_subnet" {
#   default = "subnet-080ae30c3b2f0782f" # Replace with your Subnet  ID
# }