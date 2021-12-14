resource "aws_iam_role_policy_attachment" "oidc" {
  policy_arn = aws_iam_policy.oidc_policy.arn
  role       = aws_iam_role.cluster-role.name
}

resource "aws_iam_policy" "oidc_policy" {
  name_prefix = "eks-oidc-${var.cluster_name}"
  description = "EKS oidc policy for cluster ${var.cluster_name}"
  policy      = data.aws_iam_policy_document.oidc_policy_document.json
  path        = "/"
}

data "aws_iam_policy_document" "oidc_policy_document" {
  statement {
    sid    = "oidc"
    effect = "Allow"

    # principals {
    #   type        = "Federated"
    #   identifiers = [
    #       "${aws_iam_openid_connect_provider.default.arn}",
    #   ]
    # }
    
    resources = ["${aws_iam_openid_connect_provider.default.arn}"]

    actions = [
      "sts:AssumeRoleWithWebIdentity",
    ]

    condition {
      test     = "StringEquals"
      variable = "${aws_eks_cluster.cluster.identity.0.oidc.0.issuer}:sub"
      values   = ["system:serviceaccount:kube-system:alb-ingress-controller"]
    }
  }
}
