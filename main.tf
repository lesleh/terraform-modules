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

module "lesleh_co_uk" {
  source = "./lesleh_co_uk"
}

module "public_storage" {
  source = "./public_storage"
}

module "current_time" {
  source = "./current_time"
}

module "lesleh_co_uk_certificate" {
  source = "./lesleh_co_uk_certificate"
  providers = {
    aws = aws.virginia
  }

  depends_on = [ module.lesleh_co_uk ]

  aws_route53_zone_id = module.lesleh_co_uk.zone_id
}
