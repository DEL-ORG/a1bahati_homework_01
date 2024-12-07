# module "vpc" {
#   source      = "./vpc_module"
#   aws_region  = "us-east-1"
#   vpc_cidr    = "10.0.0.0/16"
#   vpc_name    = "vpc_03"

#   public_subnets = {
#     a = { cidr_block = "10.0.1.0/24", availability_zone = "us-east-1a" }
#     b = { cidr_block = "10.0.3.0/24", availability_zone = "us-east-1b" }
#     c = { cidr_block = "10.0.5.0/24", availability_zone = "us-east-1c" }
#   }

#   private_subnets = {
#     a = { cidr_block = "10.0.2.0/24", availability_zone = "us-east-1a", nat_gateway = "a" }
#     b = { cidr_block = "10.0.4.0/24", availability_zone = "us-east-1b", nat_gateway = "b" }
#     c = { cidr_block = "10.0.6.0/24", availability_zone = "us-east-1c", nat_gateway = "c" }
#   }

#   nat_gateways = {
#     a = { subnet = "a" }
#     b = { subnet = "b" }
#     c = { subnet = "c" }
#   }
# }
