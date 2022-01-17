resource "aws_dynamodb_table" "employees" {
  name           = "Employees"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  # primary key
  hash_key = "id"
  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name = "${var.ENVIRONMENT}-app-employees-table"
  }
}
