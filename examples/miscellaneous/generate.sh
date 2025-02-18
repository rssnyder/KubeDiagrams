#! /bin/sh

PATH=../../bin:$PATH

echo_run()
{
  echo $@
  $@
}

if [ "$1" = "deployed" ]
then
  echo_run kubectl apply -f cronjob.yaml
  echo_run sleep 150
  echo kubectl get
  kubectl get cronjob,job,pod,cm,sa,node -o=yaml > cronjob-deployed.yaml
  echo_run kubectl delete cronjob hello

  echo_run kubectl apply -f nginx.yaml
  echo_run sleep 60
  kubectl get all,ingress,ingressclass,networkpolicy,ep,endpointslice,cm,sa,node -o=yaml > nginx-deployed-all.yaml
  kubectl get all,ingress,ingressclass,networkpolicy,ep,cm,sa,node -o=yaml > nginx-deployed-only-ep.yaml
  kubectl get all,ingress,ingressclass,networkpolicy,endpointslice,cm,sa,node -o=yaml > nginx-deployed-only-eps.yaml
  echo_run kubectl delete -f nginx.yaml
fi

# Generate the miscellaneous architecture diagrams.
for file in `ls *.yaml`
do
  echo_run kube-diagrams -v $file
done

echo_run kube-diagrams -v -o all-in-one \
  cronjob.yaml \
  limit-ranges.yaml	\
  network_policies.yaml \
  nginx.yaml \
  quotas.yaml \
  runtime_classes.yaml
