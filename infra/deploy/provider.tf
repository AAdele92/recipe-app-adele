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
  key            = "tf-state-deploy"
  workspace_key_prefix = "tf-state-deploy-env"
  region         = "eu-west-2"
  encrypt        = true  
  dynamodb_table = "recipe-app-3-lock"
  } 
}


provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Environment = "terraform.workspace"
      BillingID = "recipe Account"
      Project   = var.project_name
      ManagedBy = "Terraform/deploy"
      Contact   =  var.contact
    }
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  }

  data "aws_region" "current" {}
