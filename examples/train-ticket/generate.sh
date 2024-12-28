#! /bin/sh

BIN=../../bin

# Generate the Kubernetes architecture diagrams.
$BIN/kube-diagrams ts-deployment-part1.yml
$BIN/kube-diagrams ts-deployment-part2.yml
$BIN/kube-diagrams ts-deployment-part3.yml
$BIN/kube-diagrams -o train-ticket ts-deployment-part*.yml
