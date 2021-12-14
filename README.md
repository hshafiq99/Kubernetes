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
aws eks update-kubeconfig --name eks-cluster --region eu-west-2 --profile pawel
```

kubectl apply -f deployment/autoscaler.yml

kubectl -n kube-system annotate deployment.apps/cluster-autoscaler cluster-autoscaler.kubernetes.io/safe-to-evict="false"

kubectl set image deployment cluster-autoscaler -n kube-system cluster-autoscaler=k8s.gcr.io/autoscaling/cluster-autoscaler:v1.21.1

kubectl -n kube-system logs -f deployment.apps/cluster-autoscaler

aws iam list-open-id-connect-providers --region eu-west-2 --profile pawel

kubectl apply -f ingress/rbac.yml

kubectl apply -f ingress/ingress-controller.yml

kubectl annotate serviceaccount -n kube-system alb-ingress-controller eks.amazonaws.com/role-arn=arn:aws:iam::096355066567:role/cluster-role

kubectl logs -n kube-system alb-ingress-controller-d48f6c998-cs59v

kubectl apply -f deployment/deployment.yml,deployment/ingress.yml

kubectl apply -f deployment/alb-ingress.yml

kubectl create secret tls tls-secret --key .\certs\key.pem --cert .\certs\certificate.pem
