variable "AWS_REGION" {
  description = "AWS provider region"
  type        = string
  default     = "us-west-2"
}

variable "AWS_REGION_AZ" {
  description = "AWS provider region"
  type        = string
  default     = "us-west-2a"
}



variable "AMI_OWNER" {
  description = "Instance AMI Owner"
  type        = string
  default     = "amazon"
}


variable "EC2_TYPE" {
  description = "Instance Type"
  type        = string
  default     = "t2.micro"
}


variable "PUBLIC_KEY_LOC" {
  description = "Public key location"
  type        = string
  default     = "/home/abdelrahman/.ssh/id_rsa.pub"
}

variable "APP_PREFIX" {
  description = "App prefix name"
  type        = string
  default     = "employee-app"
}
