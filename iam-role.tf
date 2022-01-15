# >>>>>>>> S3 IAM Role, policy, attachment, and instance profile

resource "aws_iam_role" "S3DynamoDBFullAccessRole" {
  name               = "S3DynamoDBFullAccessRole"
  assume_role_policy = file("assumerolepolicy.json")

  tags = {
    Name = "${var.ENVIRONMENT}-IAM-Role"
  }
}

resource "aws_iam_policy" "S3DynamoDBFullAccessPolicy" {
  name        = "S3DynamoDBFullAccessPolicy"
  description = "S3DynamoDB full access policy"
  policy      = file("policyS3DB.json")

  tags = {
    Name = "${var.ENVIRONMENT}-IAM-Policy"
  }
}

resource "aws_iam_policy_attachment" "ec2-instance-attach" {
  name       = "EmployeeAppS3DynamoDBEC2PolicyAttachment"
  roles      = ["${aws_iam_role.S3DynamoDBFullAccessRole.name}"]
  policy_arn = aws_iam_policy.S3DynamoDBFullAccessPolicy.arn
}

resource "aws_iam_instance_profile" "employee-app-profile" {
  name = "EmployeeAppEC2S3DynamoDBProfile"
  role = aws_iam_role.S3DynamoDBFullAccessRole.name
}
