# KubeDiagrams

Generate Kubernetes architecture diagrams from Kubernetes manifest files, kustomization files, Helm charts, and actual cluster state.

There are several tools to generate Kubernetes architecture diagrams (see **[here](https://github.com/philippemerle/Awesome-Kubernetes-Architecture-Diagrams)**).
The main originality of **KubeDiagrams** is its **[configurability](bin/kube-diagrams.yaml)** allowing for instance to deal with custom Kubernetes resources.

## Examples

Architecture diagram for **[official Kubernetes WordPress tutorial](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/)** manifests:
![WordPress Manifests](examples/wordpress/wordpress.png)

Architecture diagram for **[official Kubernetes ZooKeeper tutorial](https://kubernetes.io/docs/tutorials/stateful-application/zookeeper/)** manifests:
![ZooKeeper Manifest](examples/zookeeper/zookeeper.png)

Architecture diagram of a deployed **[Cassandra](https://kubernetes.io/docs/tutorials/stateful-application/cassandra/)** instance:
![Deployed Cassandra Instance](examples/cassandra/default.png)

Architecture diagram for **[Train Ticket：A Benchmark Microservice System](https://github.com/FudanSELab/train-ticket/)**:
![train-ticket.png](examples/train-ticket/train-ticket.png)

Architecture diagram of the Minikube Ingress Addon:
![Minikube Ingress Addon](examples/minikube/minikube-ingress-nginx.png)

Architecture diagram for the **[Kube Prometheus Stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack)** chart:
![kube-prometheus-stack.png](examples/kube-prometheus-stack/kube-prometheus-stack.png)

Architecture diagram for **[free5gc-k8s](https://github.com/niloysh/free5gc-k8s)** manifests:
![free5gc-k8s-diagram.png](examples/free5gc-k8s/free5gc-k8s-diagram.png)

Architecture diagram for **[open5gs-k8s](https://github.com/niloysh/open5gs-k8s)** manifests:
![open5gs-k8s-diagram.png](examples/open5gs-k8s/open5gs-k8s-diagram.png)

Architecture diagram for the **[Towards5GS-helm](https://github.com/Orange-OpenSource/towards5gs-helm)** chart:
![towards5gs_free5gc.png](examples/towards5gs-helm/towards5gs_free5gc.png)

Architecture diagram for a deployed **CronJob** instance:
![cronjob-deployed.png](examples/miscellaneous/cronjob-deployed.png)

Architecture diagram for **NetworkPolicy** resources: ![network_policies.png](examples/miscellaneous/network_policies.png)

Many other architecture diagrams are available into [examples/](examples/).

All the examples are
1. [official Kubernetes WordPress tutorial](examples/wordpress/)
1. [official Kubernetes ZooKeeper tutorial](examples/zookeeper/)
1. [official Kubernetes Cassandra tutorial](examples/cassandra/)
1. [Train Ticket](examples/train-ticket/)
1. [minikube architecture diagrams](examples/minikube/)
1. [k0s architecture diagrams](examples/k0s/)
1. [Kube Prometheus Stack](examples/kube-prometheus-stack/)
1. [free5gc-k8s](examples/free5gc-k8s/)
1. [open5gs-k8s](examples/open5gs-k8s/)
1. [Towards5GS-helm](examples/towards5gs-helm/)
1. [Miscellaneous examples](examples/miscellaneous/)
1. [Some Helm charts](examples/helm-charts/)

## Prerequisites

* [Python](https://www.python.org) 3.9 or higher with
  * [PyYAML](https://pyyaml.org)
    ```sh
    $ pip install pyyaml
    ```
  * [Diagrams](https://diagrams.mingrammer.com/)
    ```sh
    $ pip install diagrams
    ```
* `dot` command ([Graphviz](https://www.graphviz.org/))

## Usage

```sh
$ kube-diagrams -h
usage: kube-diagrams [-h] [-o OUTPUT] [-f FORMAT] [-c CONFIG] [-v] [--without-namespace] filename [filename ...]

Generate Kubernetes architecture diagrams from Kubernetes manifest files

positional arguments:
  filename              the Kubernetes manifest filename to process

options:
  -h, --help            show this help message and exit
  -o OUTPUT, --output OUTPUT
                        output diagram filename
  -f FORMAT, --format FORMAT
                        output format, allowed formats are png (default), jpg, svg, pdf, and dot
  -c CONFIG, --config CONFIG
                        custom kube-diagrams configuration file
  -v, --verbose         verbosity, set to false by default
  --without-namespace   disable namespace cluster generation
```

## Features

### Kubernetes resources

Supported `kind`/`apiVersion` resource types are 42 ones:
* APIService/apiregistration.k8s.io/v1
* ClusterRole/rbac.authorization.k8s.io/v1
* ClusterRoleBinding/rbac.authorization.k8s.io/v1
* ConfigMap/v1
* CronJob/batch/v1
* CustomResourceDefinition/apiextensions.k8s.io/v1
* CSIDriver/storage.k8s.io/v1
* DaemonSet/apps/v1
* Deployment/apps/v1
* Endpoints/v1
* EndpointSlice/discovery.k8s.io/v1
* Group/rbac.authorization.k8s.io/v1
* HorizontalPodAutoscaler/autoscaling/v1
* HorizontalPodAutoscaler/autoscaling/v2
* Ingress/networking.k8s.io/v1
* IngressClass/networking.k8s.io/v1
* Job/batch/v1
* Lease/coordination.k8s.io/v1
* LimitRange/v1
* MutatingWebhookConfiguration/admissionregistration.k8s.io/v1
* Namespace/v1
* NetworkAttachmentDefinition/k8s.cni.cncf.io/v1
* NetworkPolicy/networking.k8s.io/v1
* Node/v1
* PersistentVolume/v1
* PersistentVolumeClaim/v1
* PriorityClass/scheduling.k8s.io/v1
* Pod/v1
* PodDisruptionBudget/policy/v1
* PodSecurityPolicy/policy/v1beta1
* ReplicaSet/apps/v1
* ResourceQuota/v1
* Role/rbac.authorization.k8s.io/v1
* RoleBinding/rbac.authorization.k8s.io/v1
* Secret/v1
* Service/v1
* ServiceAccount/v1
* StatefulSet/apps/v1
* StorageClass/storage.k8s.io/v1
* User/rbac.authorization.k8s.io/v1
* ValidatingWebhookConfiguration/admissionregistration.k8s.io/v1
* VolumeAttachment/storage.k8s.io/v1

**Note**: The mapping between these supported Kubernetes resources and architecture diagrams is defined into [bin/kube-diagrams.yml](bin/kube-diagrams.yaml#L65).

**Note**: The mapping for any Kubernetes custom resources can be also defined into **KubeDiagrams** configuration files as illustrated in [examples/k0s/KubeDiagrams.yml](examples/k0s/KubeDiagrams.yml#L10) and [examples/kube-prometheus-stack/KubeDiagrams.yml](examples/kube-prometheus-stack/KubeDiagrams.yaml#L3).

Currently, unsupported `kind`/`apiGroup` resource types are 20 ones:
* Binding/
* ComponentStatus/
* Event/
* PodTemplate/
* ReplicationController/
* ControllerRevision/apps
* TokenReview/authentication.k8s.io
* LocalSubjectAccessReview/authorization.k8s.io
* SelfSubjectAccessReview/authorization.k8s.io
* SelfSubjectRulesReview/authorization.k8s.io
* SubjectAccessReview/authorization.k8s.io
* CertificateSigningRequest/certificates.k8s.io
* Event/events.k8s.io
* FlowSchema/flowcontrol.apiserver.k8s.io
* PriorityLevelConfiguration/flowcontrol.apiserver.k8s.io
* NodeMetrics/metrics.k8s.io
* PodMetrics/metrics.k8s.io
* RuntimeClass/node.k8s.io
* CSINode/storage.k8s.io
* CSIStorageCapacity/storage.k8s.io

## Kubernetes resources clustering

With **KubeDiagrams**, Kubernetes resources can be clustered within the architecture diagrams automatically. **KubeDiagrams** uses the `metadata.namespace` resource field as first clustering criteria. Then, the `metadata.labels` keys can be used to define subclusters. Following table lists the predefined mappings between label keys and cluster titles as defined in the [bin/kube-diagrams.yml](bin/kube-diagrams.yaml#L37) file (see the `clusters` list).

| Label | Cluster Title |
| :--------: | :-------: |
| `app.kubernetes.io/instance` | K8s Instance |
| `release` | Release |
| `helm.sh/chart` | Helm Chart |
| `chart` | Chart |
| `app.kubernetes.io/name` | K8s Application |
| `app` | Application |
| `app.kubernetes.io/component` | K8s Component |
| `service` | Microservice |
| `tier` | Tier |

New mappings can be easily defined in custom configuration files (see [examples/minikube/KubeDiagrams.yml](examples/minikube/KubeDiagrams.yml#L2), [examples/k0s/KubeDiagrams.yml](examples/k0s/KubeDiagrams.yml#L5), [examples/free5gc-k8s/KubeDiagrams.yml](examples/free5gc-k8s/KubeDiagrams.yml#L2),  [examples/open5gs-k8s/KubeDiagrams.yml](examples/open5gs-k8s/KubeDiagrams.yml#L2), and [examples/towards5gs-helm/KubeDiagrams.yml](examples/towards5gs-helm/KubeDiagrams.yml#L2)) and provided to **KubeDiagrams** via the `--config` command-line option.

## What do they say about it?

Posts and blogs about **KubeDiagrams**:
* [Facebook Kubernetes Users Group](https://www.facebook.com/groups/kubernetes.users/permalink/2818586068320504)
* [Visualising SQL Server in Kubernetes](https://dbafromthecold.com/2025/02/06/visualising-sql-server-in-kubernetes/)

## License

This project is licensed under the GPL-3.0 license - see the [LICENSE](LICENSE) file for details.

## Todo List

* Make `nodes/*/edges` more declarative
* Add other renderers such as PlantUML, D2, React Flow, etc.
