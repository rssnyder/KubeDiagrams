#! /bin/sh

#TODO: extract all k0s resources including custom resources

generate_kar()
{
  ../../bin/kube-diagrams -c KubeDiagrams.yml $@
}

# Generate the k0s architecture diagrams.
generate_kar k0s.yml
generate_kar k0s-without-rbac.yml
generate_kar k0s-without-rbac-corrected.yml
