terraform {
  required_version = "~>1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }

backend "s3" {
  bucket         = "recipe-app-3-tfstate"
  key            = "tf.tfstate-deploy"
  workspace_key_prefix = "tf-state-deploy-env"
  region         = "eu-west-2"
  encrypt        = true  
  dynamodb_table = "receipe-app-lock"
  
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
