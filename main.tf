module "lesleh_co_uk" {
  source = "./lesleh_co_uk"
}

module "container_registry" {
  source = "./container_registry"
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

  aws_route53_zone_id = module.lesleh_co_uk.zone_id
}
