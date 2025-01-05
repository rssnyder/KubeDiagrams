#! /bin/sh

PATH=../../bin:$PATH

helm-diagrams https://prometheus-community.github.io/helm-charts/kube-prometheus-stack

#TODO: kube-diagrams -c KubeDiagrams.yaml kube-prometheus-stack-corrected.yaml
