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

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.root.zone_id

  name = "www.${var.subdomain}"
  type = "A"

  alias {
    name                   = aws_cloudfront_distribution.root_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.root_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
