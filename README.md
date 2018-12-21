# DigitalOcean Kubernetes Cluster Terraform

This is just something for me to easily spin up a one node k8s cluster on DigitalOcean for testing/learning/playing.

Set the required environment variables:

```
export DIGITALOCEAN_TOKEN=[your token]
export KUBECONFIG=kubeconfig
```

Create the cluster:

```
cd kubernetes
terraform init
terraform apply -var-file=../vars/dev.tfvars
```

Create the kubectl config file:

```
terraform output > kubeconfig
```

Check out the node(s):

```
kubectl get nodes
```

See your pods:

```
kubectl get pods
```

When you're finished testing, kill it all off:

```
terraform destroy -var-file=../vars/dev.tfvars
rm kubeconfig
```
