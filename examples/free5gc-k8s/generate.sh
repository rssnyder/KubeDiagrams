#! /bin/sh

alias kubectl="minikube kubectl"

# Clone free5gc-k8s
git clone https://github.com/niloysh/free5gc-k8s.git

# Kustomize free5gc-k8s
generated_filenames=""
for kf in `ls free5gc-k8s/*/kustomization.yaml`
do
  part=$(basename $(dirname $kf))
  generated_filename="free5gc-k8s-$part.yaml"
  kubectl kustomize free5gc-k8s/$part > ${generated_filename}
  generated_filenames="${generated_filenames} ${generated_filename}"
done

# Generate the free5gc-k8s architecture diagram.
kube-diagrams -c KubeDiagrams.yml -o free5gc-k8s-diagram ${generated_filenames}

# Remove generated files
rm ${generated_filenames}
