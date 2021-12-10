###############
#AWS Variables
###############

variable "aws_region" {
  default  = "eu-west-2"
}

variable "cluster_name" {
  default = "bequest-eks-dev"
  type    = string
}

variable "desired_size" {
  default = 3
}

variable "max_size" {
  default = 3
}

variable "min_size" {
  default = 3
}

variable "instance_types" {
  default = ["t3.large"]
}