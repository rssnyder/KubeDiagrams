#! /bin/sh

PATH=../../bin:$PATH

# cert manager chart.
helm-diagrams https://charts.jetstack.io/cert-manager

# Elasticsearch and Kibana charts.
helm-diagrams https://helm.elastic.co/elasticsearch
helm-diagrams https://helm.elastic.co/kibana
kube-diagrams -c KubeDiagrams.yaml --without-namespace -o kibana-and-elasticsearch kibana.yaml elasticsearch.yaml

# Fission chart.
helm-diagrams https://fission.github.io/fission-charts/fission-all

# Jenkins chart.
helm-diagrams https://charts.jenkins.io/jenkins
