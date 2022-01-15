
# Print the output of the ami id
output "aws_ami_id" {
  value = data.aws_ami.latest-amazon-linux-image.id
}

# Print the output of current public IP
output "my_ip_addr" {
  value = data.http.my_public_ip.body
}


# Print the account id numbet
output "account_id" {
  value = local.account_id
}


output "s3_bucket_domain_name" {
  value = aws_s3_bucket.employee-bucket.bucket_domain_name
}
