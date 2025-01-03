#! /bin/sh

alias kubectl="minikube kubectl"

# Clone open5gs-k8s
git clone https://github.com/niloysh/open5gs-k8s

# Kustomize open5gs-k8s
generated_filenames=""
for kf in `ls open5gs-k8s/*/kustomization.yaml`
do
  part=$(basename $(dirname $kf))
  generated_filename="open5gs-k8s-$part.yaml"
  kubectl kustomize open5gs-k8s/$part > ${generated_filename}
  generated_filenames="${generated_filenames} ${generated_filename}"
done

# Generate the open5gs-k8s architecture diagram.
kube-diagrams -c KubeDiagrams.yml -o open5gs-k8s-diagram ${generated_filenames}

# Remove generated files
rm ${generated_filenames}
