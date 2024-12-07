
provider "aws" {
  alias  = "s3_region" # Aliased provider
  region = "us-west-1" # The region where the S3 bucket will be created
}

# Create the S3 bucket
resource "aws_s3_bucket" "tf_state" {
<<<<<<< HEAD
  bucket        = "your-unique-tf-state-bucket-name" # Replace with a unique name
=======
  bucket        = "your-unique-tf-state-bucket-s3_002" 
>>>>>>> 1032ba9c3ce989b3904c0c9971c10fe72bc7059d
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
