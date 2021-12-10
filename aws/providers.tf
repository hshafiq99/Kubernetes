#############
#Provider
#############

terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region  = var.aws_region
  profile = "pawel"
}

data "aws_availability_zones" "available" {}

provider "http" {}
