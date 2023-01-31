# main.tf | Main Configuration

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.43.0"
    }
  }

  backend "s3" {
    bucket = "xpfarm-{{cookiecutter.project_name}}-terraform-state"
    key    = "state/terraform_state.tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
