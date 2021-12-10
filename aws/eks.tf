#############
#EKS Cluster
#############

resource "aws_iam_role" "cluster-role" {
  name = "cluster-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_security_group" "cluster-sg" {
  name        = "Cluster-SG"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Cluster-SG"
  }
}

resource "aws_security_group_rule" "cluster-sg-ingress-workstation-https" {
  cidr_blocks       = [local.workstation-external-cidr]
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.cluster-sg.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster-role.arn

  vpc_config {
    security_group_ids = [aws_security_group.cluster-sg.id]
    subnet_ids         = aws_subnet.subnet[*].id
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster-role-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster-role-AmazonEKSVPCResourceController,
  ]
}
