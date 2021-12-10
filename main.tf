#######
#AWS
#######


terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region  = var.aws_region
  profile = "pawel"
}

provider "http" {}

module "aws" {
  source = "./aws"
  cluster_name = var.cluster_name
  aws_region = var.aws_region
  desired_size = var.desired_size
  max_size =  var.max_size
  min_size = var.min_size
  instance_types = var.instance_types
}

