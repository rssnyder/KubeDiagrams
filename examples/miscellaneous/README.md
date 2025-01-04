# Miscellaneous Examples

This example provides miscellaneous architecture diagrams for CronJob, LimitRange, NetworkPolicy, and ResourceQuota resource kinds.

## Instructions

Start a Kubernetes cluster.

Generate some miscellaneous architecture diagrams:

```sh
$ ./generate.sh
```

## Generated architecture diagrams

Architecture diagram for [cronjob.yaml](cronjob.yaml):
![cronjob.png](cronjob.png)

Architecture diagram for a deployed [cronjob.yaml](cronjob.yaml) instance:
![cronjob-deployed.png](cronjob-deployed.png)

Architecture diagram for [limit-ranges.yaml](limit-ranges.yaml):
![limit-ranges.png](limit-ranges.png)

Architecture diagram for [nginx.yaml](nginx.yaml):
![nginx.png](nginx.png)

Architecture diagram for a deployed [nginx.yaml](nginx.yaml) instance showing `Endpoints` resources:
![nginx-deployed-only-ep.png](nginx-deployed-only-ep.png)

Architecture diagram for a deployed [nginx.yaml](nginx.yaml) instance showing `EndpointSlice` resources:
![nginx-deployed-only-eps.png](nginx-deployed-only-eps.png)

Architecture diagram for a deployed [nginx.yaml](nginx.yaml) instance showing both `Endpoints` and `EndpointSlice` resources:
![nginx-deployed-all.png](nginx-deployed-all.png)

Architecture diagram for [network_policies.yaml](network_policies.yaml):
![network_policies.png](network_policies.png)

Architecture diagram for [quotas.yaml](quotas.yaml):
![quotas.png](quotas.png)

All-in-one architecture diagram:
![all-in-one.png](all-in-one.png)
