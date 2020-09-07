# terraform-aws-cloudfront-static-site

[![open-issues](https://img.shields.io/github/issues-raw/robcxyz/terraform-aws-cloudfront-static-site?style=for-the-badge)](https://github.com/robcxyz/terraform-aws-cloudfront-static-site/issues)
[![open-pr](https://img.shields.io/github/issues-pr-raw/robcxyz/terraform-aws-cloudfront-static-site?style=for-the-badge)](https://github.com/robcxyz/terraform-aws-cloudfront-static-site/pulls)

## Features

This module...

## Terraform Versions

For Terraform v0.12.0+

## Usage

```
module "this" {
    source = "github.com/robcxyz/terraform-aws-cloudfront-static-site"

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
| root\_domain\_name | n/a | `string` | n/a | yes |
| s3\_bucket\_name | n/a | `string` | `""` | no |
| subdomain | n/a | `string` | `""` | no |
| tags | n/a | `map(string)` | `{}` | no |

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