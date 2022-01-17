variable "AWS_REGION" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}


# >>>> Work Environment variable
variable "ENVIRONMENT" {
  description = "The Environment i.e: Dev, Staging, Prod"
  type        = string
  default     = "DEV"
}


# >>>> Subnets Availability Zone variable
variable "AVAIL_ZONE" {
  description = "Availability zones of the region"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b"]
}


# >>>> VPC CIDR Block variable
variable "VPC_CIDR_BLOCK" {
  description = "App-VPC Cidr Block"
  type        = string
  default     = "10.1.0.0/16"
}

# >>>> Public subnets CIDR Block variable
variable "public_subnets_cidr_block" {
  description = "Public subnets cidr blocks list of App-VPC"
  type        = list(string)
  default     = ["10.1.1.0/24", "10.1.2.0/24"]
}

# >>>> Private subnets CIDR Block variable
variable "private_subnets_cidr_block" {
  description = "Private subnets cidr blocks list of App-VPC"
  type        = list(string)
  default     = ["10.1.3.0/24", "10.1.4.0/24"]
}

# >>>> AMI Owner varibale
variable "AMI_OWNER" {
  description = "Instance AMI Owner"
  type        = string
  default     = "amazon"
}

# >>>> EC2 Instance Type
variable "EC2_TYPE" {
  description = "Instance Type"
  type        = string
  default     = "t2.micro"
}

# >>>> Public Key location for ssh 
variable "PUBLIC_KEY_LOC" {
  description = "Public key location for SSH"
  type        = string
  default     = "/home/abdelrahman/.ssh/id_rsa.pub"
}


# >>>> S3 bucket name
variable "S3_BUCKET_PREFIX" {
  description = "S3 bucket name, has to be unique"
  type        = string
  default     = "abdelrahman-17993"
}

# >>>> S3 bucket access control list value
# variable "ACL_VALUE" {
#   description = "S3 bucket access control list value (private or public)"
#   type        = string
#   default     = "public-read"
# }
