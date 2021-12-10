########
#AWS
########

output "config_map_aws_auth" {
  value = module.aws.config_map_aws_auth
}

output "kubeconfig" {
  value = module.aws.kubeconfig
}
