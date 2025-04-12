variable "prefix" {
  type        = string
  description = "prefix for all resources"
  default     = "raa-3"
  
}
variable "bucket_name" {
  type        = string
  description = "s3 bucket"
  default     = "recipeapp-3-tfstate"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
  default     = "recipe-app-lock"
}

variable "project_name" {
  type        = string
  description = "project name"
  default     = "recipe-app-3"
}

variable "contact" {
  type        = string
  description = "contact name"
  default     = "AAA@example.com"
}


variable "region" {
  type        = string
  description = "region to deploy"
  default     = "eu-west-2"
}


variable "ecr_repository_name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "recipe-app-3-ecr"
}

variable "ecr_repository_proxy_name" {
  description = "The name of the ECR repository for proxy"
  type        = string
  default     = "recipe-app-3-ecr-proxy"
}