variable "root_domain_name" {
  description = "As name - example.com"
  type        = string
}

variable "subdomain" {
  description = "As name - blog in blog.example.com"
  type        = string
  default     = ""
}

variable "s3_bucket_name" {
  description = "S3 bucket name - leave blank for root domain name"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Additional tags to associate with resources"
  type        = map(string)
  default     = {}
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

  name = var.subdomain
  type = "A"

  alias {
    name                   = aws_cloudfront_distribution.root_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.root_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

// TODO: RM?
//resource "aws_route53_zone" "subdomain" {
//  count = var.subdomain == "" ? 0 : 1
//  name = "${var.subdomain}.${var.root_domain_name}."
//}
//
//resource "aws_route53_record" "subdomain_root_records" {
//  count = var.subdomain == "" ? 0 : 1
//
//  zone_id = data.aws_route53_zone.root.zone_id
//  name = "${var.subdomain}.${var.root_domain_name}"
//  type = "NS"
//  ttl = "30"
//
//  records = [
//    aws_route53_zone.subdomain.name_servers[0],
//    aws_route53_zone.subdomain.name_servers[1],
//    aws_route53_zone.subdomain.name_servers[2],
//    aws_route53_zone.subdomain.name_servers[3],
//  ]
//}