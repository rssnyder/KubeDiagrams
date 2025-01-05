#! /bin/sh

PATH=../../bin:$PATH

helm-diagrams https://prometheus-community.github.io/helm-charts/kube-prometheus-stack

kube-diagrams --without-namespace -c KubeDiagrams.yaml kube-prometheus-stack-corrected.yaml
