#! /bin/sh

# Clone docker-open5gs
git clone https://github.com/Borjis131/docker-open5gs.git

# Process some Helm charts
helm dependency update docker-open5gs/helm/amf
for chart in \
  "docker-open5gs/helm/open5gs"
do
  helm dependency build $chart
  # Generate template from the Helm chart
  helm template open5gs $chart > $(basename $chart).yaml
  # Generate diagrams
  kube-diagrams $(basename $chart).yaml
  kube-diagrams --without-namespace $(basename $chart).yaml -o $(basename $chart)-without-namespace
done
