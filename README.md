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



kubectl annotate serviceaccount cluster-autoscaler -n kube-system eks.amazonaws.com role-arn=arn:aws:iam::096355066567:role/cluster-role

kubectl -n kube-system annotate deployment.apps/cluster-autoscaler cluster-autoscaler.kubernetes.io/safe-to-evict="false"

kubectl set image deployment cluster-autoscaler -n kube-system cluster-autoscaler=k8s.gcr.io/autoscaling/cluster-autoscaler:v1.21.1