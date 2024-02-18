terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 0.14.9"
}

//----------------------------------------------------------------------
// AWS Certificate Manager (ACM) for lesleh.co.uk
//----------------------------------------------------------------------

resource "aws_acm_certificate" "lesleh_co_uk" {
  domain_name       = "lesleh.co.uk"
  validation_method = "DNS"
}

resource "aws_acm_certificate_validation" "lesleh_co_uk" {
  certificate_arn = aws_acm_certificate.lesleh_co_uk.arn
  # validation_record_fqdns = [for record in aws_acm_certificate.lesleh_co_uk.domain_validation_options : record.resource_record_name]
}

resource "aws_route53_record" "lesleh_co_uk_certificate_validation" {
  for_each = {
    for dvo in aws_acm_certificate.lesleh_co_uk.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.aws_route53_zone_id
}
