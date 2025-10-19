terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.12"
    }
  }
}

terraform {
  backend "s3" {
    bucket  = "5961my-terraform-state-bucket"
    key     = "aws-study/terraform.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
  }
}

provider "aws" {
  region = var.aws_region
}
