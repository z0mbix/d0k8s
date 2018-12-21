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
NAME                  STATUS   ROLES    AGE   VERSION
hopeful-bartik-34tg   Ready    <none>   60m   v1.13.1
```

See your pods:

```
kubectl get pods
NAME                      READY   STATUS    RESTARTS   AGE
consul-76ffc7bf57-4vpsq   1/1     Running   0          54s
web-fd8dd954-5z7nd        1/1     Running   0          10s
web-fd8dd954-t5qhz        1/1     Running   0          10s
web-fd8dd954-zknzx        1/1     Running   0          10s
```

When you're finished testing, kill it all off:

```
terraform destroy -var-file=../vars/dev.tfvars
rm kubeconfig
```
