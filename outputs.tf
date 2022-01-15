
# Print the output of the ami id
output "aws_ami_id" {
  value = data.aws_ami.latest-amazon-linux-image.id
}

# Print the output of current public IP
output "my_ip_addr" {
  value = data.http.my_public_ip.body
}
