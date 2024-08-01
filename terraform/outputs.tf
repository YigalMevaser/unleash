output "ecs_cluster_id" {
  value = aws_ecs_cluster.unleash_cluster.id
}

output "ecs_service_name" {
  value = aws_ecs_service.unleash_service.name
}

# output "ecr_repository_url" {
#   value = aws_ecr_repository.unleash.repository_url
# }

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.unleash_vpc.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.unleash_subnet.id
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.unleash_sg.id
}
