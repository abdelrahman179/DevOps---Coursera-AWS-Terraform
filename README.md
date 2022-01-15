# DevOps---Coursera-AWS-Terraform

** Considering dynamically construct repeatable nested and user environment blocks 
1- Create an IAM role that is assigned to an EC2 instance hosting the employee directory application. 
2- Create two policies: AmazonS3FullAccess & AmazonDynamoDBFullAccess 
3- Create custom vpc 
4- Create 4 subnets "2 public subnets and 2 private subnets" 
5- Create interet gateway to be able to connect to vpc 
6- Create public route table that routes from internet gateway to public subnets and associate it with two public subnets 
7- Create private route table that routes from nat-gateway to private subnets and associate it with two private subnets 
8- Create security group that allow ssh from local machine, http, and https ingress 
9- Launch an EC2 instance using the IAM role created previously
10- Create S3 bucket 
11- Create S3 bucket policy associated with the s3 bucket and use IAM role policy created previously
