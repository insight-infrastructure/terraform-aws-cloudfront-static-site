variable "root_domain_name" {
  type = string
}

variable "subdomain" {
  type    = string
  default = ""
}

variable "s3_bucket_name" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(string)
  default = {}
}

locals {
  s3_bucket_name = var.s3_bucket_name == "" ? var.root_domain_name : var.s3_bucket_name
  fqdn           = var.subdomain == "" ? var.root_domain_name : "${var.subdomain}.${var.root_domain_name}"
}

data "aws_route53_zone" "root" {
  name = "${var.root_domain_name}."
}

resource "aws_route53_record" "root" {
  zone_id = data.aws_route53_zone.root.zone_id

  name = ""
  type = "A"

  alias {
    name                   = aws_cloudfront_distribution.root_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.root_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

