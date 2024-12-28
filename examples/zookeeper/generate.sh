#! /bin/sh

BIN=../../bin

# Generate the Kubernetes architecture diagram for the ZooKeeper manifest.
$BIN/kube-diagrams zookeeper.yaml

# Deploy the ZooKeeper application.
kubectl apply -f zookeeper.yaml

# Wait a few minutes for the ZooKeeper application to be deployed.
sleep 60

# Get all Kubernetes resources in the `default` namespace.
kubectl get all,sa,cm,pdb,pvc,pv,sc -o=yaml > namespace_default.yml

# Generate a Kubernetes architecture diagram for the `default` namespace.
$BIN/kube-diagrams namespace_default.yml

# Delete the ZooKeeper application.
kubectl delete -f zookeeper.yaml
