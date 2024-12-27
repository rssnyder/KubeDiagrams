#! /bin/sh

BIN=../../bin

# Generate the Kubernetes architecture diagram for cassandra.yml.
$BIN/kube-diagrams cassandra.yml

# Deploy the Cassandra application.
kubectl apply -f cassandra.yml

# Wait a few minutes for the Cassandra application to be deployed.
sleep 120

# Get all Kubernetes resources in the default namespace.
kubectl get all,pvc,serviceaccount,configmap,pv,storageclass -o=yaml > default.yml

# Generate a Kubernetes architecture diagram for the default namespace.
$BIN/kube-diagrams default.yml

# Delete Cassandra application.
kubectl delete -f cassandra.yml
