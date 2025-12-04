output "cluster_name" {
  description = "Amazon Web Service EKS Cluster Name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint for Amazon Web Service EKS "
  value       = module.eks.cluster_endpoint
}

output "region" {
  description = "Amazon Web Service EKS Cluster region"
  value       = var.region
}

output "cluster_security_group_id" {
  description = "Security group ID for the Amazon Web Service EKS Cluster "
  value       = module.eks.cluster_security_group_id
}

output "repository_arns" {
  description = "Danh sách ARN của các ECR repository đã tạo."
  value       = { for name, repo in aws_ecr_repository.vprofile_repo : name => repo.arn }
}

output "repository_uris" {
  description = "Danh sách URI (URL) đầy đủ của các ECR repository."
  value       = { for name, repo in aws_ecr_repository.vprofile_repo : name => repo.repository_url }
}
