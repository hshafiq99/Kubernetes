###############
#AWS Variables
###############

variable "aws_region" {
  default  = "eu-west-2"
}

variable "cluster_name" {
  default = "eks-cluster"
  type    = string
}

variable "desired_size" {
  default = 2
}

variable "max_size" {
  default = 8
}

variable "min_size" {
  default = 2
}

variable "instance_types" {
  default = ["t3.large"]
}