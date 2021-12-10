# Kubernetes

Commands for Terraform Deployment:

```
terraform plan
terraform apply --auto-approve
```
Create directory for config:
```
mkdir ~/.kubeconfig/
```

Add config file to KUBECONFIG environment

For PowerShell on Windows:

```
$ENV:KUBECONFIG="{0};{1}" -f  $ENV:KUBECONFIG, "$ENV:userprofile\.kubeconfig\config"
```

For updating config file run

```
aws eks update-kubeconfig --name <clustername> --region <aws-region>
```
Example:

```
aws eks update-kubeconfig --name eks-cluster --region us-east-1 --profile pawel
```

