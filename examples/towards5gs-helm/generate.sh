#! /bin/sh

# Set up access to the towards5gs-helm repository.
helm repo add towards5gs 'https://raw.githubusercontent.com/Orange-OpenSource/towards5gs-helm/main/repo/'
helm repo update

# Process towards5gs-helm charts.
helm template towards5gs towards5gs/free5gc > towards5gs_free5gc.yaml
helm template towards5gs towards5gs/ueransim > towards5gs_ueransim.yaml

# Remove the Helm local repository
helm repo remove towards5gs

# Generate the towards5gs-helm architecture diagrams.
kube-diagrams -c KubeDiagrams.yml towards5gs_free5gc.yaml
kube-diagrams -c KubeDiagrams.yml towards5gs_free5gc.yaml --without-namespace -o towards5gs_free5gc-without-namespace
kube-diagrams -c KubeDiagrams.yml towards5gs_ueransim.yaml
kube-diagrams -c KubeDiagrams.yml towards5gs_ueransim.yaml --without-namespace -o towards5gs_ueransim-without-namespace
kube-diagrams -c KubeDiagrams.yml towards5gs_ueransim-corrected.yaml
kube-diagrams -c KubeDiagrams.yml --without-namespace -o towards5gs_ueransim-corrected-without-namespace towards5gs_ueransim-corrected.yaml

# Remove generated files.
rm towards5gs_free5gc.yaml towards5gs_ueransim.yaml
