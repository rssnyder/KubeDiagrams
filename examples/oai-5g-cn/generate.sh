#! /bin/sh

# Clone oai-cn5g-fed
git clone https://gitlab.eurecom.fr/oai/cn5g/oai-cn5g-fed.git

# Process some Helm charts
for chart in \
  "oai-cn5g-fed/charts/oai-5g-core/oai-5g-mini" \
  "oai-cn5g-fed/charts/oai-5g-core/oai-5g-basic" \
  "oai-cn5g-fed/charts/oai-5g-core/oai-5g-advance" \
  "oai-cn5g-fed/charts/e2e_scenarios/case1" \
  "oai-cn5g-fed/charts/e2e_scenarios/case2" \
  "oai-cn5g-fed/charts/e2e_scenarios/case3"
do
  helm dependency update $chart
  # Generate template from the Helm chart
  helm template oai-cn5g $chart > $(basename $chart).yaml
  # Generate diagrams
  kube-diagrams $(basename $chart).yaml
  kube-diagrams --without-namespace $(basename $chart).yaml -o $(basename $chart)-without-namespace
done
