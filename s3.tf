# >>> Fetch IAM user account id
data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

# >>> S3 Bucket 
resource "aws_s3_bucket" "employee-bucket" {
  bucket = "${var.S3_BUCKET_PREFIX}-employee-photo-bucket"
  #   acl    = var.ACL_VALUE
  tags = {
    Name = "${var.ENVIRONMENT}-employee-directory-app-s3"
  }
}

# >>> S3 bucket policy
resource "aws_s3_bucket_policy" "employee-bucket-policy" {
  bucket = aws_s3_bucket.employee-bucket.id
  policy = <<POLICY
    {
    "Version": "2012-10-17",
    "Statement": [{
        "Sid": "AllowS3ReadAccess",
        "Effect": "Allow",
        "Principal": {
            "AWS": "arn:aws:iam::${local.account_id}:role/S3DynamoDBFullAccessRole"
        },
        "Action": "s3:*",
        "Resource": [
            "arn:aws:s3:::abdelrahman-17993-employee-photo-bucket",
            "arn:aws:s3:::abdelrahman-17993-employee-photo-bucket/*"
        ]
    }]
}
  POLICY
}
