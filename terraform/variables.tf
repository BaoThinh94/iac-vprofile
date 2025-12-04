variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "clusterName" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "kitops-eks"
}

variable "repository_names" {
  description = "Danh sách các tên ECR repository cần tạo."
  type        = list(string)
  default     = ["vprofiledb", "vprofileapp"]
}