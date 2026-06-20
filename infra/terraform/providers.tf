terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "global/s3/terraform.tfstate"
    region         = var.region
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }

  required_version = "~> 1.15.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.51.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}
