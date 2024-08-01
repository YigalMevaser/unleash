
# Create a new VPC
resource "aws_vpc" "unleash_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "unleash_vpc"
  }
}

# Create a subnet within the VPC
resource "aws_subnet" "unleash_subnet" {
  vpc_id                  = aws_vpc.unleash_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "unleash_subnet"
  }
}

# Create an internet gateway for the VPC to allow internet access
resource "aws_internet_gateway" "unleash_igw" {
  vpc_id = aws_vpc.unleash_vpc.id

  tags = {
    Name = "unleash_igw"
  }
}


# Create a security group for the ECS tasks
resource "aws_security_group" "unleash_sg" {
  name        = "unleash_sg"
  description = "Security group for ECS tasks"
  vpc_id      = aws_vpc.unleash_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "unleash_sg"
  }
}

resource "aws_security_group" "unleash_sg_ecs" {
  name        = "unleash_sg_ecs"
  description = "Security group for ECS tasks"
  vpc_id      = aws_vpc.unleash_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "unleash_sg_ecs"
  }
}

resource "aws_vpc_endpoint" "ecr-dkr-endpoint" {
 vpc_id       = aws_vpc.unleash_vpc.id
 private_dns_enabled = true
 service_name = "com.amazonaws.${var.aws_region}.ecr.dkr"
 vpc_endpoint_type = "Interface"
 security_group_ids = [aws_security_group.unleash_sg_ecs.id]
 subnet_ids = [aws_subnet.unleash_subnet.id]

}

resource "aws_vpc_endpoint" "ecr-api-endpoint" {
  vpc_id       = aws_vpc.unleash_vpc.id
  service_name = "com.amazonaws.${var.aws_region}.ecr.api"
 vpc_endpoint_type = "Interface"
 private_dns_enabled = true
 security_group_ids = [aws_security_group.unleash_sg_ecs.id]
 subnet_ids = [aws_subnet.unleash_subnet.id]
}