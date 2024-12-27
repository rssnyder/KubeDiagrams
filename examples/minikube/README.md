# Minikube Example

## Instructions

Start a minikube cluster with `metrics-server`, `dashboard`, and `ingress` addons:

```sh
$ minikube start
$ minikube addons enable metrics-server 
$ minikube addons enable dashboard
$ minikube addons enable ingress
```

Generate some Kubernetes architecture diagrams:

```sh
$ ./generate.sh
```
## Generated architecture diagrams

Architecture diagram of Kubernetes resources in the minikube `default` namespace:
![minikube default namespace](minikube-default.png)

Architecture diagram of Kubernetes resources in the minikube `kubernetes-dashboard` namespace:
![minikube kubernetes-dashboard namespace](minikube-dashboard.png)

Architecture diagram of all minikube Kubernetes resources except for RBAC ones:
![minikube](minikube-without-rbac.png)

**Note**: [minikube-without-rbac-corrected.yml](minikube-without-rbac-corrected.yml) was manually corrected to better group some Kubernetes resources (see `#ADDED:` and `#CHANGED:` comments).

Corrected architecture diagram of all minikube Kubernetes resources except for RBAC ones:
![minikube](minikube-without-rbac-corrected.png)

Architecture diagram of all minikube Kubernetes resources:
![Minikube](minikube.png)

**Note**: In the previous architecture diagram, both red labels and red arrows indicate unfound Kubernetes resources.
