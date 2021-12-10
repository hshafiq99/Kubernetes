variable "aws_region" {
  default  = "us-east-1"
}

variable "cluster_name" {
  default = "eks-cluster"
  type    = string
}

variable "desired_size" {
  default = 1
}

variable "max_size" {
  default = 1
}

variable "min_size" {
  default = 1
}

variable "instance_types" {
  default = ["t2.micro"]
}