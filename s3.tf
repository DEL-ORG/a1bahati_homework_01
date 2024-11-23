# Define the provider
provider "aws" {
  region = "us-east-1" # Adjust the region as needed
}

# Create the S3 bucket for storing Terraform state
resource "aws_s3_bucket" "tf_state" {
  bucket        = "your-unique-tf-state-bucket-name" # Replace with a globally unique bucket name
  acl           = "private"
  force_destroy = true

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Environment = "Terraform"
    ManagedBy   = "Terraform"
  }
}

# Create the DynamoDB table for state locking
resource "aws_dynamodb_table" "tf_lock" {
  name         = "terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  hash_key = "LockID"

  tags = {
    Environment = "Terraform"
    ManagedBy   = "Terraform"
  }
}

# Configure the backend in Terraform
terraform {
  backend "s3" {
    bucket         = aws_s3_bucket.tf_state.bucket
    key            = "terraform/state/terraform.tfstate"
    region         = "us-east-1" # Adjust the region as needed
    dynamodb_table = aws_dynamodb_table.tf_lock.name
    encrypt        = true
  }
}
