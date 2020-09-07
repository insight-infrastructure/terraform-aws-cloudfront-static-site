variable "aws_region" {
  default = "us-east-1"
}

provider "aws" {
  region = var.aws_region
}

module "defaults" {
  source           = "../.."
  root_domain_name = "insight-infra.de"
  //  root_domain_name = "robc.xyz"
}
