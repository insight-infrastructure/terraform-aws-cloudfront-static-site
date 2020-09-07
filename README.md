# terraform-aws-cloudfront-static-site

[![open-issues](https://img.shields.io/github/issues-raw/insight-infrastructure/terraform-aws-cloudfront-static-site
?style=for-the-badge)](https://github.com/insight-infrastructure/terraform-aws-cloudfront-static-site/issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/insight-infrastructure/terraform-aws-cloudfront-static-site?style=for-the-badge)](https://github.com/insight-infrastructure/terraform-aws-cloudfront-static-site/pulls)

## Features

This module sets up a static website on AWS. It uses two S3 buckets, one for the main static site expecting an index
.html and another simply redirecting www.yourdomain.com to yourdomain.com.  The website itself is distributed with
 cloudfront. 

## Terraform Versions

For Terraform v0.12.0+

## Usage

**Root Domain** 
```hcl
module "this" {
  source = "github.com/robcxyz/terraform-aws-cloudfront-static-site"
  root_domain_name = "example.com"
}
```

**Subbomain** 
```hcl
module "this" {
  source = "github.com/robcxyz/terraform-aws-cloudfront-static-site"
  root_domain_name = "example.com"
  subdomain = "blog"
}
```


## Examples

- [defaults](https://github.com/robcxyz/terraform-aws-cloudfront-static-site/tree/master/examples/defaults)

## Known  Issues
No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| root\_domain\_name | As name - example.com | `string` | n/a | yes |
| s3\_bucket\_name | S3 bucket name - leave blank for root domain name | `string` | `""` | no |
| subdomain | As name - blog in blog.example.com | `string` | `""` | no |
| tags | Additional tags to associate with resources | `map(string)` | `{}` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Testing
This module has been packaged with terratest tests

To run them:

1. Install Go
2. Run `make test-init` from the root of this repo
3. Run `make test` again from root

## Authors

Module managed by [robcxyz](https://github.com/robcxyz)

## Credits

- [Anton Babenko](https://github.com/antonbabenko)

## License

Apache 2 Licensed. See LICENSE for full details.