variable "aws_region" {
  type = string
  description = "The AWS region to deploy to"
}

# variable "subnet_id" {
#   type = string
#   description = "The subnet ID to deploy the ECS service in"
# }

# variable "security_group_id" {
#   type = string
#   description = "The security group ID to attach to the ECS service"
# }


variable "vpc_cidr" {
  type = string
  description = "The CIDR block for the VPC"
}

variable "subnet_cidr" {
  type = string
  description = "The CIDR block for the subnet"
}


variable "ecr_repository_name" {
  type = string
}


variable "bucket_name" {
  type        = string
}