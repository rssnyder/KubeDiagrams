#! /bin/sh

# Clone free5gc-k8s
git clone https://github.com/niloysh/free5gc-k8s.git

# Generate the free5gc-k8s architecture diagram.
kube-diagrams -c KubeDiagrams.yml -o free5gc-k8s-diagram $(grep "apiVersion: " -rl --exclude="kustomization.yaml" free5gc-k8s) free5gc-k8s-config-maps.yaml
