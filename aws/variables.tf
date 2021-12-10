variable "aws_region" {
  default  = "us-east-1"
}

variable "cluster_name" {
  default = "eks-cluster"
  type    = string
}

variable "desired_size" {
  default = 2
}

variable "max_size" {
  default = 2
}

variable "min_size" {
  default = 2
}

variable "instance_types" {
  default = ["t2.micro"]
}