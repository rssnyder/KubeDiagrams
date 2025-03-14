FROM docker.io/alpine/helm:3 AS helm

FROM docker.io/python:3.12-slim AS base
RUN apt-get update && apt-get -y install graphviz libgl1
RUN pip install --upgrade pip
RUN pip install helm-python glib PyQt5 graphviz
RUN pip install KubeDiagrams
RUN cp /usr/local/bin/kube-diagrams.yaml KubeDiagrams.yaml
COPY --from=helm /usr/bin/helm /usr/local/bin/helm