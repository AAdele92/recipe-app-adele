terraform {
  required_version = "~>1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }

backend "s3" {
  bucket         = var.bucket_name
  key            = "terraform.tfstate"
  encrypt        = true  
  dynamodb_table = var.dynamodb_table_name
  } 
}


provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Environment = "terraform.workspace"
      BillingID = "recipe Account"
      Project   = var.project_name
      ManagedBy = "Terraform/setup"
      Contact   =  var.contact
    }
  }
}
