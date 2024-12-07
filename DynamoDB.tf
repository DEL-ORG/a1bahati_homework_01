
# Create the DynamoDB table for state locking
resource "aws_dynamodb_table" "tf_lock" {
  name         = "terraform-state-lock" # Table name
  billing_mode = "PAY_PER_REQUEST"      # On-demand capacity

  attribute {
    name = "LockID" # Primary key for the table
    type = "S"      # Type is string
  }

  hash_key = "LockID"

  tags = {
    Environment = "Terraform"
    ManagedBy   = "Terraform"
  }
}
