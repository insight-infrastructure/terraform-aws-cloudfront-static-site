resource "aws_s3_bucket" "www" {
  bucket = "www.${local.s3_bucket_name}"

  acl           = "public-read"
  force_destroy = true
  policy        = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::www.${local.s3_bucket_name}/*"]
    }
  ]
}
POLICY

  website {
    redirect_all_requests_to = "https://${local.fqdn}"
  }

  tags = var.tags
}

resource "aws_s3_bucket" "root" {
  bucket = local.s3_bucket_name
  acl    = "public-read"
  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${local.s3_bucket_name}/*"]
    }
  ]
}
POLICY

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  tags = var.tags
}
