terraform {
  required_version = ">=1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }

  backend "s3" {
    bucket = "igor-remote-state"
    key    = "pipeline-gitlab/terraform.tfstate"
    region = "us-east-1"

  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "igorrubio"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "igor-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
