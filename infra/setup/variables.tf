variable "project_name" {
  type        = string
  description = "project name"
  default     = "recipeapp-3"
}

variable "contact" {
  type        = string
  description = "contact name"
  default     = "AAA"
}


variable "bucket_name" {
  type        = string
  description = "s3 bucket"
  default     = "recipeapp-3-tfstate"
}

variable "block_public_acls" {
  type        = bool
  description = "access control list to block public"
  default     = true
}

variable "block_public_policy" {
  type        = bool
  description = "this is policy to block public access"
  default     = true
}

variable "region" {
  type        = string
  description = "region to deploy"
  default     = "eu-west-2"
}

variable "kms_key_id" {
  description = "The ID of the KMS key for S3 encryption"
  type        = string
  default     = "receipe-app-kms-key"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
  default     = "receipe-app-lock"
}

variable "ecr_repository_name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "recipeapp-3-ecr"
}

variable "ecr_repository_proxy_name" {
  description = "The name of the ECR repository for proxy"
  type        = string
  default     = "recipeapp-3-ecr-proxy"
}