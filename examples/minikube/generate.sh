#! /bin/sh

BIN=../../bin
cluster_name=minikube

# Get all Kubernetes resources.
kubectl get clusterrole,clusterrolebinding,crd,configmap,ds,deployment,hpa,ingress,ingressclass,job,node,pod,replicaset,role,rolebinding,secret,service,serviceaccount,storageclass,namespace -A -o=yaml > ${cluster_name}.yml
# Generate Kubernetes architecture diagram.
$BIN/kube-diagrams -vv ${cluster_name}.yml

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
