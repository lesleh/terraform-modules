terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 0.14.9"

  backend "s3" {
    bucket = "leslehcouk-terraform-states"
    key    = "terraform-modules"
    region = "eu-west-2"
  }
}

provider "aws" {
  region = "eu-west-2"
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}
