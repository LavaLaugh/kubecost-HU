Set-ExecutionPolicy RemoteSigned

az login
az account set --subscription 2b76758c-763b-41cb-ba92-6bc042e4710f
az aks get-credentials --resource-group test --name aks101cluster

helm install kubecost cost-analyzer --repo https://kubecost.github.io/cost-analyzer/ --namespace kubecost --create-namespace --set kubecostToken="..."
kubectl port-forward --namespace kubecost deployment/kubecost-cost-analyzer 9090

kubectl apply -f .\kubecost-lb.yaml
