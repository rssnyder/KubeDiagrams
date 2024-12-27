# KubeDiagrams

Generate Kubernetes architecture diagrams from Kubernetes manifest files.

There are several tools to generate Kubernetes architecture diagrams (see **[here](https://github.com/philippemerle/Awesome-Kubernetes-Architecture-Diagrams)**).
The main originality of **KubeDiagrams** is its **[configurability](bin/kube-diagrams.yaml)** allowing for instance to deal with custom Kubernetes resources.

## Prerequisites

* [Python 3.x](https://www.python.org/)
* [Diagrams](https://diagrams.mingrammer.com/)
  ```sh
  $ pip install diagrams
  ```
* `dot` command ([Graphviz](https://www.graphviz.org/))

## Usage

```sh
$ kube-diagrams -h
usage: kube-diagrams [-h] [-o OUTPUT] [-f FORMAT] [-v] filename

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
```

## Supported Kubernetes resources

List of supported `kind`/`apiVersion` resource types (25):
* ClusterRole/rbac.authorization.k8s.io/v1
* ClusterRoleBinding/rbac.authorization.k8s.io/v1
* CustomResourceDefinition/apiextensions.k8s.io/v1
* ConfigMap/v1
* DaemonSet/apps/v1
* Deployment/apps/v1
* Group/rbac.authorization.k8s.io/v1
* HorizontalPodAutoscaler/autoscaling/v2
* Ingress/networking.k8s.io/v1
* IngressClass/networking.k8s.io/v1
* Job/batch/v1
* Namespace/v1
* Node/v1
* PersistentVolume/v1
* PersistentVolumeClaim/v1
* Pod/v1
* ReplicaSet/apps/v1
* Role/rbac.authorization.k8s.io/v1
* RoleBinding/rbac.authorization.k8s.io/v1
* Secret/v1
* Service/v1
* ServiceAccount/v1
* StatefulSet/apps/v1
* StorageClass/storage.k8s.io/v1
* User/rbac.authorization.k8s.io/v1

## Unsupported Kubernetes resources

List of unsupported `kind`/`apiGroup` resource types (34):
* Binding/
* ComponentStatus/
* Endpoints/
* Event/
* LimitRange/
* PodTemplate/
* ReplicationController/
* ResourceQuota/
* MutatingWebhookConfiguration/
* ValidatingWebhookConfiguration/admissionregistration.k8s.io
* APIService/apiregistration.k8s.io
* ControllerRevision/apps
* TokenReview/authentication.k8s.io
* LocalSubjectAccessReview/authorization.k8s.io
* SelfSubjectAccessReview/authorization.k8s.io
* SelfSubjectRulesReview/authorization.k8s.io
* SubjectAccessReview/authorization.k8s.io
* CronJob/batch
* CertificateSigningRequest/certificates.k8s.io
* Lease/coordination.k8s.io
* EndpointSlice/discovery.k8s.io
* Event/events.k8s.io
* FlowSchema/flowcontrol.apiserver.k8s.io
* PriorityLevelConfiguration/flowcontrol.apiserver.k8s.io
* NodeMetrics/metrics.k8s.io
* PodMetrics/metrics.k8s.io
* NetworkPolicy/networking.k8s.io
* RuntimeClass/node.k8s.io
* PodDisruptionBudget/policy
* PriorityClass/scheduling.k8s.io
* CSIDriver/storage.k8s.io
* CSINode/storage.k8s.io
* CSIStorageCapacity/storage.k8s.io
* VolumeAttachment/storage.k8s.io

## Examples

* [official Kubernetes Cassandra example](examples/cassandra/)
* [minikube architecture diagrams](examples/minikube/)

## License

This project is licensed under the GPL-3.0 license - see the [LICENSE](LICENSE) file for details.

## Todo List

* Add more examples
* Add missed Kubernetes resource types as at least CronJob, Endpoint, LimitRange, NetworkPolicy, PodDisruptionBudget and ResourceQuota
* Make `nodes/*/edges` more declarative
* Add diagram node icon for IngressClass
