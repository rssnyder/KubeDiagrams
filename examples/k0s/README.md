# k0s Example

This example provides architecture diagrams for **[k0s: Zero Friction Kubernetes](https://k0sproject.io/)**.

## Instructions

Start a minimal k0s cluster (see [here](https://docs.k0sproject.io/stable/install/)).

Generate some **k0s** architecture diagrams:

```sh
$ ./generate.sh
```
## Generated architecture diagrams

Architecture diagram of all **k0s** resources except for RBAC ones:
![k0s-without-rbac.png](k0s-without-rbac.png)

Architecture diagram of all **k0s** Kubernetes resources:
![k0s.png](k0s.png)
