#! /bin/sh

BIN=../../bin
cluster_name=minikube

# Get all Kubernetes resources.
kubectl get clusterrole,clusterrolebinding,crd,configmap,ds,deployment,hpa,ingress,ingressclass,job,node,pod,replicaset,role,rolebinding,secret,service,serviceaccount,storageclass,namespace -A -o=yaml > ${cluster_name}.yml
# Generate Kubernetes architecture diagram.
$BIN/kube-diagrams -vv ${cluster_name}.yml

# Get all RBAC-related Kubernetes resources.
kubectl get clusterrole,clusterrolebinding,role,rolebinding,serviceaccount -A -o=yaml > ${cluster_name}-rbac.yml
# Generate Kubernetes architecture diagram.
$BIN/kube-diagrams -vv ${cluster_name}-rbac.yml

# Get all Kubernetes resources except for rbac ones.
kubectl get crd,configmap,ds,deployment,hpa,ingress,ingressclass,job,node,pod,replicaset,secret,service,serviceaccount,storageclass,namespace -A -o=yaml > ${cluster_name}-without-rbac.yml
# Generate Kubernetes architecture diagram.
$BIN/kube-diagrams -v ${cluster_name}-without-rbac.yml

# Generate a Kubernetes architecture diagram from a corrected manifest.
$BIN/kube-diagrams -v ${cluster_name}-without-rbac-corrected.yml

# Get all Kubernetes resources in the default namespace.
kubectl get configmap,ds,deployment,hpa,ingress,job,pod,replicaset,role,rolebinding,secret,service,serviceaccount -o=yaml > ${cluster_name}-default.yml
# Generate Kubernetes architecture diagram.
$BIN/kube-diagrams -v ${cluster_name}-default.yml

# Get all Kubernetes resources in the kubernetes-dashboard namespace.
kubectl get configmap,ds,deployment,hpa,ingress,job,pod,replicaset,role,rolebinding,secret,service,serviceaccount -n kubernetes-dashboard -o=yaml > ${cluster_name}-dashboard.yml
# Generate Kubernetes architecture diagram.
$BIN/kube-diagrams -v ${cluster_name}-dashboard.yml

# Get all Kubernetes resources in the ingress-nginx namespace.
kubectl get configmap,ds,deployment,hpa,ingress,ingressclass,job,pod,replicaset,role,rolebinding,secret,service,serviceaccount -n ingress-nginx -o=yaml > ${cluster_name}-ingress-nginx.yml
# Generate Kubernetes architecture diagram.
$BIN/kube-diagrams -v ${cluster_name}-ingress-nginx.yml

# Get all Kubernetes resources in the kube-system namespace.
kubectl get configmap,ds,deployment,hpa,ingress,job,pod,replicaset,role,rolebinding,secret,service,serviceaccount -n kube-system -o=yaml > ${cluster_name}-kube-system.yml
# Generate Kubernetes architecture diagram.
$BIN/kube-diagrams -v ${cluster_name}-kube-system.yml

