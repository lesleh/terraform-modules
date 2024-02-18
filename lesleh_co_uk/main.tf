//----------------------------------------------------------------------
// AWS Route 53 domain registration for lesleh.co.uk
//----------------------------------------------------------------------

resource "aws_route53domains_registered_domain" "lesleh_co_uk_registered_domain" {
  domain_name = "lesleh.co.uk"

  name_server {
    glue_ips = []
    name     = "ns-1832.awsdns-37.co.uk"
  }
  name_server {
    glue_ips = []
    name     = "ns-953.awsdns-55.net"
  }
  name_server {
    glue_ips = []
    name     = "ns-300.awsdns-37.com"
  }
  name_server {
    glue_ips = []
    name     = "ns-1132.awsdns-13.org"
  }

  registrant_contact {
    extra_params = {
      "UK_CONTACT_TYPE" = "IND"
    }
  }
}

//----------------------------------------------------------------------
// AWS Route 53 records for lesleh.co.uk
//----------------------------------------------------------------------

resource "aws_route53_zone" "lesleh_co_uk_zone" {
  name          = aws_route53domains_registered_domain.lesleh_co_uk_registered_domain.domain_name
  force_destroy = false
}

resource "aws_route53_record" "lesleh_co_uk_ns" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = aws_route53domains_registered_domain.lesleh_co_uk_registered_domain.domain_name
  type    = "NS"
  ttl     = "172800"
  records = [
    "ns-1832.awsdns-37.co.uk.",
    "ns-953.awsdns-55.net.",
    "ns-300.awsdns-37.com.",
    "ns-1132.awsdns-13.org."
  ]
}

resource "aws_route53_record" "lesleh_co_uk_soa" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = aws_route53domains_registered_domain.lesleh_co_uk_registered_domain.domain_name
  type    = "SOA"
  ttl     = "900"
  records = [
    "ns-1832.awsdns-37.co.uk. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
  ]
}

#----------------------------------------------
# iCloud MX records
#----------------------------------------------

resource "aws_route53_record" "lesleh_co_uk_spf_icloud_txt" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = aws_route53domains_registered_domain.lesleh_co_uk_registered_domain.domain_name
  type    = "TXT"
  ttl     = "300"
  records = [
    "v=spf1 include:icloud.com ~all",
    "apple-domain=n4KESiEUg61Dxjgy"
  ]
}

resource "aws_route53_record" "lesleh_co_uk_mx" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = aws_route53domains_registered_domain.lesleh_co_uk_registered_domain.domain_name
  type    = "MX"
  ttl     = "300"
  records = [
    "10 mx01.mail.icloud.com.",
    "10 mx02.mail.icloud.com."
  ]
}

resource "aws_route53_record" "lesleh_co_uk_cname__sig1" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = "sig1._domainkey.lesleh.co.uk"
  type    = "CNAME"
  ttl     = "300"
  records = [
    "sig1.dkim.lesleh.co.uk.at.icloudmailadmin.com."
  ]
}

#----------------------------------------------
# AWS SES verification records
#----------------------------------------------

resource "aws_route53_record" "lesleh_co_uk_txt__amazonses_lesleh_co_uk" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = "_amazonses.lesleh.co.uk"
  type    = "TXT"
  ttl     = "1800"
  records = [
    "SfUKNWxWIGgdXvGmssLm2NmauWlIS1MXBRTG/SD0gyE="
  ]
}

resource "aws_route53_record" "lesleh_co_uk_cname__fpnodtosjqt6lom4ssghrh2a76rsma2a" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = "fpnodtosjqt6lom4ssghrh2a76rsma2a._domainkey.lesleh.co.uk"
  type    = "CNAME"
  ttl     = "1800"
  records = [
    "fpnodtosjqt6lom4ssghrh2a76rsma2a.dkim.amazonses.com"
  ]
}

resource "aws_route53_record" "lesleh_co_uk_cname__r5wcjv3u2v4htdpjdsdtacbultxxc4xq" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = "r5wcjv3u2v4htdpjdsdtacbultxxc4xq._domainkey.lesleh.co.uk"
  type    = "CNAME"
  ttl     = "1800"
  records = [
    "r5wcjv3u2v4htdpjdsdtacbultxxc4xq.dkim.amazonses.com"
  ]
}

resource "aws_route53_record" "lesleh_co_uk_cname__pircfq5ibpexkhsmvisodkkmbrwoymyk" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = "pircfq5ibpexkhsmvisodkkmbrwoymyk._domainkey.lesleh.co.uk"
  type    = "CNAME"
  ttl     = "1800"
  records = [
    "pircfq5ibpexkhsmvisodkkmbrwoymyk.dkim.amazonses.com"
  ]
}

#----------------------------------------------
# Website records
#----------------------------------------------

resource "aws_route53_record" "lesleh_co_uk_a" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = aws_route53domains_registered_domain.lesleh_co_uk_registered_domain.domain_name
  type    = "A"
  ttl     = "300"
  records = [
    "76.76.21.21"
  ]
}

resource "aws_route53_record" "lesleh_co_uk_a__ai" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = "ai.lesleh.co.uk"
  type    = "A"
  alias {
    name                   = "d-1ji18q3it7.execute-api.eu-west-2.amazonaws.com."
    zone_id                = "ZJ5UAJN8Y3Z2Q"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "lesleh_co_uk_cname__conversational" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = "conversational.lesleh.co.uk"
  type    = "CNAME"
  ttl     = "300"
  records = [
    "cname.vercel-dns.com."
  ]
}

resource "aws_route53_record" "lesleh_co_uk_cname__quizzical" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = "quizzical.lesleh.co.uk"
  type    = "CNAME"
  ttl     = "300"
  records = [
    "cname.vercel-dns.com."
  ]
}

resource "aws_route53_record" "lesleh_co_uk_cname__reader" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = "reader.lesleh.co.uk"
  type    = "CNAME"
  ttl     = "300"
  records = [
    "cname.vercel-dns.com."
  ]
}

resource "aws_route53_record" "lesleh_co_uk_cname__www" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = "www.lesleh.co.uk"
  type    = "CNAME"
  ttl     = "300"
  records = [
    "cname.vercel-dns.com."
  ]
}

resource "aws_route53_record" "lesleh_co_uk_a__home" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = "home.lesleh.co.uk"
  type    = "A"
  ttl     = "60"
  records = [
    "78.151.97.112"
  ]
}
