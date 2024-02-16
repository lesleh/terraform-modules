resource "aws_route53_zone" "lesleh_co_uk_zone" {
  name = "lesleh.co.uk"
  force_destroy = false
}

resource "aws_route53_record" "lesleh_co_uk_ns" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "lesleh.co.uk"
  type = "NS"
  ttl = "172800"
  records = [
    "ns-1832.awsdns-37.co.uk.",
    "ns-953.awsdns-55.net.",
    "ns-300.awsdns-37.com.",
    "ns-1132.awsdns-13.org."
  ]
}

resource "aws_route53_record" "lesleh_co_uk_soa" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "lesleh.co.uk"
  type = "SOA"
  ttl = "900"
  records = [
    "ns-1832.awsdns-37.co.uk. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
  ]
}

#----------------------------------------------
# iCloud MX records
#----------------------------------------------

resource "aws_route53_record" "lesleh_co_uk_spf_icloud_txt" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name    = "lesleh.co.uk"
  type    = "TXT"
  ttl     = "300"
  records = [
    "v=spf1 include:icloud.com ~all",
    "apple-domain=n4KESiEUg61Dxjgy"
  ]
}

resource "aws_route53_record" "lesleh_co_uk_mx" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "lesleh.co.uk"
  type = "MX"
  ttl = "300"
  records = [
    "10 mx01.mail.icloud.com.",
    "10 mx02.mail.icloud.com."
  ]
}

resource "aws_route53_record" "lesleh_co_uk_cname__sig1" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "sig1._domainkey.lesleh.co.uk"
  type = "CNAME"
  ttl = "300"
  records = [
    "sig1.dkim.lesleh.co.uk.at.icloudmailadmin.com."
  ]
}

#----------------------------------------------
# AWS SES verification records
#----------------------------------------------

resource "aws_route53_record" "lesleh_co_uk_txt__amazonses_lesleh_co_uk" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "_amazonses.lesleh.co.uk"
  type = "TXT"
  ttl = "1800"
  records = [
    "SfUKNWxWIGgdXvGmssLm2NmauWlIS1MXBRTG/SD0gyE="
  ]
}

resource "aws_route53_record" "lesleh_co_uk_cname__fpnodtosjqt6lom4ssghrh2a76rsma2a" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "fpnodtosjqt6lom4ssghrh2a76rsma2a._domainkey.lesleh.co.uk"
  type = "CNAME"
  ttl = "1800"
  records = [
    "fpnodtosjqt6lom4ssghrh2a76rsma2a.dkim.amazonses.com"
  ]
}

resource "aws_route53_record" "lesleh_co_uk_cname__r5wcjv3u2v4htdpjdsdtacbultxxc4xq" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "r5wcjv3u2v4htdpjdsdtacbultxxc4xq._domainkey.lesleh.co.uk"
  type = "CNAME"
  ttl = "1800"
  records = [
    "r5wcjv3u2v4htdpjdsdtacbultxxc4xq.dkim.amazonses.com"
  ]
}

resource "aws_route53_record" "lesleh_co_uk_cname__pircfq5ibpexkhsmvisodkkmbrwoymyk" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "pircfq5ibpexkhsmvisodkkmbrwoymyk._domainkey.lesleh.co.uk"
  type = "CNAME"
  ttl = "1800"
  records = [
    "pircfq5ibpexkhsmvisodkkmbrwoymyk.dkim.amazonses.com"
  ]
}

#----------------------------------------------
# ACM validation records
#----------------------------------------------

resource "aws_route53_record" "lesleh_co_uk_cname___fc8e355558aadd2e111427c164f1e0bf" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "_fc8e355558aadd2e111427c164f1e0bf.lesleh.co.uk"
  type = "CNAME"
  ttl = "300"
  records = [
    "_2a1871b96968838b751ac31f67490282.tljzshvwok.acm-validations.aws."
  ]
}

resource "aws_route53_record" "lesleh_co_uk_cname___180821d5950a46c523572094c152e201" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "_180821d5950a46c523572094c152e201.fns-dev.lesleh.co.uk"
  type = "CNAME"
  ttl = "300"
  records = [
    "_6544caeedd9e845ffade431ce31911e4.jddtvkljgg.acm-validations.aws."
  ]
}

resource "aws_route53_record" "lesleh_co_uk_cname___7bdb23ae8bd898a3733cb7c30b4cbfd0" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "_7bdb23ae8bd898a3733cb7c30b4cbfd0.fns.lesleh.co.uk"
  type = "CNAME"
  ttl = "300"
  records = [
    "_06982a79059ce6c7c748259d5b2e5caf.jddtvkljgg.acm-validations.aws."
  ]
}

#----------------------------------------------
# Website records
#----------------------------------------------

resource "aws_route53_record" "lesleh_co_uk_a" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "lesleh.co.uk"
  type = "A"
  ttl = "300"
  records = [
    "76.76.21.21"
  ]
}

resource "aws_route53_record" "lesleh_co_uk_a__ai" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "ai.lesleh.co.uk"
  type = "A"
  alias {
    name = "d-1ji18q3it7.execute-api.eu-west-2.amazonaws.com."
    zone_id = "ZJ5UAJN8Y3Z2Q"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "lesleh_co_uk_cname__conversational" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "conversational.lesleh.co.uk"
  type = "CNAME"
  ttl = "300"
  records = [
    "cname.vercel-dns.com."
  ]
}

resource "aws_route53_record" "lesleh_co_uk_cname__quizzical" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "quizzical.lesleh.co.uk"
  type = "CNAME"
  ttl = "300"
  records = [
    "cname.vercel-dns.com."
  ]
}

resource "aws_route53_record" "lesleh_co_uk_cname__reader" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "reader.lesleh.co.uk"
  type = "CNAME"
  ttl = "300"
  records = [
    "cname.vercel-dns.com."
  ]
}

resource "aws_route53_record" "lesleh_co_uk_cname__www" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "www.lesleh.co.uk"
  type = "CNAME"
  ttl = "300"
  records = [
    "cname.vercel-dns.com."
  ]
}

resource "aws_route53_record" "lesleh_co_uk_a__home" {
  zone_id = aws_route53_zone.lesleh_co_uk_zone.id
  name = "home.lesleh.co.uk"
  type = "A"
  ttl = "60"
  records = [
    "78.151.97.112"
  ]
}
