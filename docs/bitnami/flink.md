<!--- app-name: Apache Flink -->

# Apache Flink packaged by Bitnami

Apache Flink is a framework and distributed processing engine for stateful computations over unbounded and bounded data streams.

[Overview of Apache Flink](https://flink.apache.org/)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/flink
```

## Introduction

This chart bootstraps a [flink](https://github.com/bitnami/containers/tree/main/bitnami/flink) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/flink
```

These commands deploy flink on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` statefulset:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release. Use the option `--purge` to delete all history too.

## Parameters

### Global parameters

| Name                      | Description                                     | Value |
| ------------------------- | ----------------------------------------------- | ----- |
| `global.imageRegistry`    | Global Docker image registry                    | `""`  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`  |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)    | `""`  |

### Common parameters

| Name                     | Description                                                                             | Value          |
| ------------------------ | --------------------------------------------------------------------------------------- | -------------- |
| `nameOverride`           | String to partially override common.names.fullname                                      | `""`           |
| `fullnameOverride`       | String to fully override common.names.fullname                                          | `""`           |
| `kubeVersion`            | Force target Kubernetes version (using Helm capabilities if not set)                    | `""`           |
| `commonLabels`           | Labels to add to all deployed objects (sub-charts are not considered)                   | `{}`           |
| `commonAnnotations`      | Annotations to add to all deployed objects                                              | `{}`           |
| `extraDeploy`            | Array of extra objects to deploy with the release                                       | `[]`           |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden) | `false`        |
| `diagnosticMode.command` | Command to override all containers in the deployment                                    | `["sleep"]`    |
| `diagnosticMode.args`    | Args to override all containers in the deployment                                       | `["infinity"]` |

### Apache Flink parameters

| Name                | Description                                                                                                  | Value                  |
| ------------------- | ------------------------------------------------------------------------------------------------------------ | ---------------------- |
| `image.registry`    | Apache Flink image registry                                                                                  | `docker.io`            |
| `image.repository`  | Apache Flink image repository                                                                                | `bitnami/flink`        |
| `image.tag`         | Apache Flink image tag (immutable tags are recommended)                                                      | `1.16.1-debian-11-r17` |
| `image.digest`      | Apache Flink image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                   |
| `image.pullPolicy`  | image pull policy                                                                                            | `IfNotPresent`         |
| `image.pullSecrets` | Apache Flink image pull secrets                                                                              | `[]`                   |
| `image.debug`       | Enable image debug mode                                                                                      | `false`                |

### Jobmanager deployment parameters

| Name                                                           | Description                                                                               | Value            |
| -------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ---------------- |
| `jobmanager.command`                                           | Command for running the container (set to default if not set). Use array form             | `[]`             |
| `jobmanager.args`                                              | Args for running the container (set to default if not set). Use array form                | `[]`             |
| `jobmanager.lifecycleHooks`                                    | Override default etcd container hooks                                                     | `{}`             |
| `jobmanager.extraEnvVars`                                      | Extra environment variables to be set on flink container                                  | `[]`             |
| `jobmanager.extraEnvVarsCM`                                    | Name of existing ConfigMap containing extra env vars                                      | `""`             |
| `jobmanager.extraEnvVarsSecret`                                | Name of existing Secret containing extra env vars                                         | `""`             |
| `jobmanager.replicaCount`                                      | Number of Apache Flink Jobmanager replicas                                                | `1`              |
| `jobmanager.livenessProbe.enabled`                             | Enable livenessProbe on Jobmanager nodes                                                  | `true`           |
| `jobmanager.livenessProbe.initialDelaySeconds`                 | Initial delay seconds for livenessProbe                                                   | `20`             |
| `jobmanager.livenessProbe.periodSeconds`                       | Period seconds for livenessProbe                                                          | `10`             |
| `jobmanager.livenessProbe.timeoutSeconds`                      | Timeout seconds for livenessProbe                                                         | `1`              |
| `jobmanager.livenessProbe.failureThreshold`                    | Failure threshold for livenessProbe                                                       | `3`              |
| `jobmanager.livenessProbe.successThreshold`                    | Success threshold for livenessProbe                                                       | `1`              |
| `jobmanager.startupProbe.enabled`                              | Enable startupProbe on Jobmanager containers                                              | `true`           |
| `jobmanager.startupProbe.initialDelaySeconds`                  | Initial delay seconds for startupProbe                                                    | `20`             |
| `jobmanager.startupProbe.periodSeconds`                        | Period seconds for startupProbe                                                           | `10`             |
| `jobmanager.startupProbe.timeoutSeconds`                       | Timeout seconds for startupProbe                                                          | `1`              |
| `jobmanager.startupProbe.failureThreshold`                     | Failure threshold for startupProbe                                                        | `15`             |
| `jobmanager.startupProbe.successThreshold`                     | Success threshold for startupProbe                                                        | `1`              |
| `jobmanager.readinessProbe.enabled`                            | Enable readinessProbe                                                                     | `true`           |
| `jobmanager.readinessProbe.initialDelaySeconds`                | Initial delay seconds for readinessProbe                                                  | `20`             |
| `jobmanager.readinessProbe.periodSeconds`                      | Period seconds for readinessProbe                                                         | `10`             |
| `jobmanager.readinessProbe.timeoutSeconds`                     | Timeout seconds for readinessProbe                                                        | `1`              |
| `jobmanager.readinessProbe.failureThreshold`                   | Failure threshold for readinessProbe                                                      | `15`             |
| `jobmanager.readinessProbe.successThreshold`                   | Success threshold for readinessProbe                                                      | `1`              |
| `jobmanager.customLivenessProbe`                               | Custom livenessProbe that overrides the default one                                       | `{}`             |
| `jobmanager.customStartupProbe`                                | Override default startup probe                                                            | `{}`             |
| `jobmanager.customReadinessProbe`                              | Override default readiness probe                                                          | `{}`             |
| `jobmanager.resources.limits`                                  | The resources limits for Apache Flink containers                                          | `{}`             |
| `jobmanager.resources.requests`                                | The requested resources for Apache Flink containers                                       | `{}`             |
| `jobmanager.extraVolumeMounts`                                 | Optionally specify extra list of additional volumeMounts for flink container              | `[]`             |
| `jobmanager.containerPorts.rpc`                                | Port for RPC                                                                              | `6123`           |
| `jobmanager.containerPorts.http`                               | Port for http UI                                                                          | `8081`           |
| `jobmanager.containerPorts.blob`                               | Port for blob server                                                                      | `6124`           |
| `jobmanager.service.type`                                      | Apache Flink service type                                                                 | `ClusterIP`      |
| `jobmanager.service.ports.rpc`                                 | Port for RPC                                                                              | `6123`           |
| `jobmanager.service.ports.http`                                | Port for http UI                                                                          | `8081`           |
| `jobmanager.service.ports.blob`                                | Port for blob server                                                                      | `6124`           |
| `jobmanager.service.nodePorts.rpc`                             | Node port for RPC                                                                         | `""`             |
| `jobmanager.service.nodePorts.http`                            | Node port for http UI                                                                     | `""`             |
| `jobmanager.service.nodePorts.blob`                            | Port for blob server                                                                      | `""`             |
| `jobmanager.service.extraPorts`                                | Extra ports to expose in the service (normally used with the `sidecar` value)             | `[]`             |
| `jobmanager.service.loadBalancerIP`                            | LoadBalancerIP if service type is `LoadBalancer`                                          | `""`             |
| `jobmanager.service.loadBalancerSourceRanges`                  | Service Load Balancer sources                                                             | `[]`             |
| `jobmanager.service.clusterIP`                                 | Service Cluster IP                                                                        | `""`             |
| `jobmanager.service.externalTrafficPolicy`                     | Service external traffic policy                                                           | `Cluster`        |
| `jobmanager.service.annotations`                               | Provide any additional annotations which may be required.                                 | `{}`             |
| `jobmanager.service.sessionAffinity`                           | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                      | `None`           |
| `jobmanager.service.sessionAffinityConfig`                     | Additional settings for the sessionAffinity                                               | `{}`             |
| `jobmanager.serviceAccount.create`                             | Enables ServiceAccount                                                                    | `true`           |
| `jobmanager.serviceAccount.name`                               | ServiceAccount name                                                                       | `""`             |
| `jobmanager.serviceAccount.annotations`                        | Annotations to add to all deployed objects                                                | `{}`             |
| `jobmanager.serviceAccount.automountServiceAccountToken`       | Automount API credentials for a service account.                                          | `true`           |
| `jobmanager.podSecurityContext.enabled`                        | Enabled Apache Flink pods' Security Context                                               | `true`           |
| `jobmanager.podSecurityContext.fsGroup`                        | Set Apache Flink pod's Security Context fsGroup                                           | `1001`           |
| `jobmanager.podSecurityContext.seccompProfile.type`            | Rules specifying actions to take based on the requested syscall                           | `RuntimeDefault` |
| `jobmanager.containerSecurityContext.enabled`                  | Enabled Apache Flink containers' Security Context                                         | `true`           |
| `jobmanager.containerSecurityContext.runAsUser`                | Set Apache Flink container's Security Context runAsUser                                   | `1001`           |
| `jobmanager.containerSecurityContext.runAsNonRoot`             | Force the container to be run as non root                                                 | `true`           |
| `jobmanager.containerSecurityContext.allowPrivilegeEscalation` | Allows privilege escalation                                                               | `false`          |
| `jobmanager.containerSecurityContext.capabilities.drop`        | List of capabilities to be dropped                                                        | `["ALL"]`        |
| `jobmanager.podAnnotations`                                    | Additional pod annotations                                                                | `{}`             |
| `jobmanager.podLabels`                                         | Additional pod labels                                                                     | `{}`             |
| `jobmanager.podAffinityPreset`                                 | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`       | `""`             |
| `jobmanager.podAntiAffinityPreset`                             | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`  | `soft`           |
| `jobmanager.nodeAffinityPreset.type`                           | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard` | `""`             |
| `jobmanager.nodeAffinityPreset.key`                            | Node label key to match. Ignored if `affinity` is set                                     | `""`             |
| `jobmanager.nodeAffinityPreset.values`                         | Node label values to match. Ignored if `affinity` is set                                  | `[]`             |
| `jobmanager.priorityClassName`                                 | Server priorityClassName                                                                  | `""`             |
| `jobmanager.affinity`                                          | Affinity for pod assignment                                                               | `{}`             |
| `jobmanager.nodeSelector`                                      | Node labels for pod assignment                                                            | `{}`             |
| `jobmanager.tolerations`                                       | Tolerations for pod assignment                                                            | `[]`             |
| `jobmanager.topologySpreadConstraints`                         | Topology Spread Constraints for pod assignment                                            | `[]`             |
| `jobmanager.schedulerName`                                     | Alternative scheduler                                                                     | `""`             |
| `jobmanager.updateStrategy.type`                               | Apache Flink jobmanager deployment strategy type                                          | `RollingUpdate`  |
| `jobmanager.updateStrategy.rollingUpdate`                      | Apache Flink jobmanager deployment rolling update configuration parameters                | `{}`             |
| `jobmanager.extraVolumes`                                      | Optionally specify extra list of additional volumes for flink container                   | `[]`             |
| `jobmanager.initContainers`                                    | Add additional init containers to the flink pods                                          | `[]`             |
| `jobmanager.sidecars`                                          | Add additional sidecar containers to the flink pods                                       | `[]`             |

### TaskManager deployment parameters

| Name                                                            | Description                                                                               | Value            |
| --------------------------------------------------------------- | ----------------------------------------------------------------------------------------- | ---------------- |
| `taskmanager.command`                                           | Command for running the container (set to default if not set). Use array form             | `[]`             |
| `taskmanager.args`                                              | Args for running the container (set to default if not set). Use array form                | `[]`             |
| `taskmanager.lifecycleHooks`                                    | Override default etcd container hooks                                                     | `{}`             |
| `taskmanager.extraEnvVars`                                      | Extra environment variables to be set on flink container                                  | `[]`             |
| `taskmanager.extraEnvVarsCM`                                    | Name of existing ConfigMap containing extra env vars                                      | `""`             |
| `taskmanager.extraEnvVarsSecret`                                | Name of existing Secret containing extra env vars                                         | `""`             |
| `taskmanager.replicaCount`                                      | Number of Apache Flink replicas                                                           | `1`              |
| `taskmanager.livenessProbe.enabled`                             | Enable livenessProbe on taskmanager nodes                                                 | `true`           |
| `taskmanager.livenessProbe.initialDelaySeconds`                 | Initial delay seconds for livenessProbe                                                   | `20`             |
| `taskmanager.livenessProbe.periodSeconds`                       | Period seconds for livenessProbe                                                          | `10`             |
| `taskmanager.livenessProbe.timeoutSeconds`                      | Timeout seconds for livenessProbe                                                         | `1`              |
| `taskmanager.livenessProbe.failureThreshold`                    | Failure threshold for livenessProbe                                                       | `3`              |
| `taskmanager.livenessProbe.successThreshold`                    | Success threshold for livenessProbe                                                       | `1`              |
| `taskmanager.startupProbe.enabled`                              | Enable startupProbe on taskmanager containers                                             | `true`           |
| `taskmanager.startupProbe.initialDelaySeconds`                  | Initial delay seconds for startupProbe                                                    | `20`             |
| `taskmanager.startupProbe.periodSeconds`                        | Period seconds for startupProbe                                                           | `10`             |
| `taskmanager.startupProbe.timeoutSeconds`                       | Timeout seconds for startupProbe                                                          | `1`              |
| `taskmanager.startupProbe.failureThreshold`                     | Failure threshold for startupProbe                                                        | `15`             |
| `taskmanager.startupProbe.successThreshold`                     | Success threshold for startupProbe                                                        | `1`              |
| `taskmanager.readinessProbe.enabled`                            | Enable readinessProbe                                                                     | `true`           |
| `taskmanager.readinessProbe.initialDelaySeconds`                | Initial delay seconds for readinessProbe                                                  | `20`             |
| `taskmanager.readinessProbe.periodSeconds`                      | Period seconds for readinessProbe                                                         | `10`             |
| `taskmanager.readinessProbe.timeoutSeconds`                     | Timeout seconds for readinessProbe                                                        | `1`              |
| `taskmanager.readinessProbe.failureThreshold`                   | Failure threshold for readinessProbe                                                      | `15`             |
| `taskmanager.readinessProbe.successThreshold`                   | Success threshold for readinessProbe                                                      | `1`              |
| `taskmanager.customLivenessProbe`                               | Custom livenessProbe that overrides the default one                                       | `{}`             |
| `taskmanager.customStartupProbe`                                | Override default startup probe                                                            | `{}`             |
| `taskmanager.customReadinessProbe`                              | Override default readiness probe                                                          | `{}`             |
| `taskmanager.resources.limits`                                  | The resources limits for Apache Flink containers                                          | `{}`             |
| `taskmanager.resources.requests`                                | The requested resources for Apache Flink containers                                       | `{}`             |
| `taskmanager.extraVolumeMounts`                                 | Optionally specify extra list of additional volumeMounts for flink container              | `[]`             |
| `taskmanager.containerPorts.data`                               | data exchange port                                                                        | `6121`           |
| `taskmanager.containerPorts.rpc`                                | Port for RPC                                                                              | `6122`           |
| `taskmanager.service.type`                                      | Apache Flink service type                                                                 | `ClusterIP`      |
| `taskmanager.service.ports.data`                                | data exchange port                                                                        | `6121`           |
| `taskmanager.service.ports.rpc`                                 | Port for RPC                                                                              | `6122`           |
| `taskmanager.service.nodePorts.data`                            | data exchange port                                                                        | `""`             |
| `taskmanager.service.nodePorts.rpc`                             | Port for RPC                                                                              | `""`             |
| `taskmanager.service.extraPorts`                                | Extra ports to expose in the service (normally used with the `sidecar` value)             | `[]`             |
| `taskmanager.service.loadBalancerIP`                            | LoadBalancerIP if service type is `LoadBalancer`                                          | `""`             |
| `taskmanager.service.loadBalancerSourceRanges`                  | Service Load Balancer sources                                                             | `[]`             |
| `taskmanager.service.clusterIP`                                 | Service Cluster IP                                                                        | `""`             |
| `taskmanager.service.externalTrafficPolicy`                     | Service external traffic policy                                                           | `Cluster`        |
| `taskmanager.service.annotations`                               | Provide any additional annotations which may be required.                                 | `{}`             |
| `taskmanager.service.sessionAffinity`                           | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                      | `None`           |
| `taskmanager.service.sessionAffinityConfig`                     | Additional settings for the sessionAffinity                                               | `{}`             |
| `taskmanager.serviceAccount.create`                             | Enables ServiceAccount                                                                    | `true`           |
| `taskmanager.serviceAccount.name`                               | ServiceAccount name                                                                       | `""`             |
| `taskmanager.serviceAccount.annotations`                        | Annotations to add to all deployed objects                                                | `{}`             |
| `taskmanager.serviceAccount.automountServiceAccountToken`       | Automount API credentials for a service account.                                          | `true`           |
| `taskmanager.podSecurityContext.enabled`                        | Enabled Apache Flink pods' Security Context                                               | `true`           |
| `taskmanager.podSecurityContext.fsGroup`                        | Set Apache Flink pod's Security Context fsGroup                                           | `1001`           |
| `taskmanager.podSecurityContext.seccompProfile.type`            | Rules specifying actions to take based on the requested syscall                           | `RuntimeDefault` |
| `taskmanager.containerSecurityContext.enabled`                  | Enabled Apache Flink containers' Security Context                                         | `true`           |
| `taskmanager.containerSecurityContext.runAsUser`                | Set Apache Flink container's Security Context runAsUser                                   | `1001`           |
| `taskmanager.containerSecurityContext.runAsNonRoot`             | Force the container to be run as non root                                                 | `true`           |
| `taskmanager.containerSecurityContext.allowPrivilegeEscalation` | Allows privilege escalation                                                               | `false`          |
| `taskmanager.containerSecurityContext.capabilities.drop`        | List of capabilities to be dropped                                                        | `["ALL"]`        |
| `taskmanager.podAnnotations`                                    | Additional pod annotations                                                                | `{}`             |
| `taskmanager.podLabels`                                         | Additional pod labels                                                                     | `{}`             |
| `taskmanager.podAffinityPreset`                                 | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`       | `""`             |
| `taskmanager.podAntiAffinityPreset`                             | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`  | `soft`           |
| `taskmanager.nodeAffinityPreset.type`                           | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard` | `""`             |
| `taskmanager.nodeAffinityPreset.key`                            | Node label key to match. Ignored if `affinity` is set                                     | `""`             |
| `taskmanager.nodeAffinityPreset.values`                         | Node label values to match. Ignored if `affinity` is set                                  | `[]`             |
| `taskmanager.priorityClassName`                                 | Server priorityClassName                                                                  | `""`             |
| `taskmanager.affinity`                                          | Affinity for pod assignment                                                               | `{}`             |
| `taskmanager.nodeSelector`                                      | Node labels for pod assignment                                                            | `{}`             |
| `taskmanager.tolerations`                                       | Tolerations for pod assignment                                                            | `[]`             |
| `taskmanager.topologySpreadConstraints`                         | Topology Spread Constraints for pod assignment                                            | `[]`             |
| `taskmanager.schedulerName`                                     | Alternative scheduler                                                                     | `""`             |
| `taskmanager.updateStrategy.type`                               | Apache Flink taskmanager deployment strategy type                                         | `RollingUpdate`  |
| `taskmanager.updateStrategy.rollingUpdate`                      | Apache Flink taskmanager deployment rolling update configuration parameters               | `{}`             |
| `taskmanager.extraVolumes`                                      | Optionally specify extra list of additional volumes for flink container                   | `[]`             |
| `taskmanager.initContainers`                                    | Add additional init containers to the flink pods                                          | `[]`             |
| `taskmanager.sidecars`                                          | Add additional sidecar containers to the flink pods                                       | `[]`             |

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Persistence

The [Bitnami Flink](https://github.com/bitnami/containers/tree/main/bitnami/flink) image stores the trace onto an external database. Persistent Volume Claims are used to keep the data across deployments.

### Additional environment variables

In case you want to add extra environment variables (useful for advanced operations like custom init scripts), you can use the `extraEnvVars` property inside each of the subsections: `jobmanager`, `taskmanager`.

```yaml
jobmanager:
  extraEnvVars:
    - name: ENV_VAR_NAME
      value: ENV_VAR_VALUE
taskmanager:
  extraEnvVars:
    - name: ENV_VAR_NAME
      value: ENV_VAR_VALUE
```

Alternatively, you can use a ConfigMap or a Secret with the environment variables. To do so, use the `extraEnvVarsCM` or the `extraEnvVarsSecret` values.

### Sidecars

If additional containers are needed in the same pod as flink (such as additional metrics or logging exporters), they can be defined using the `sidecars` parameter inside each of the subsections: `jobmanager`, `taskmanager` . If these sidecars export extra ports, extra port definitions can be added using the `service.extraPorts` parameter. [Learn more about configuring and using sidecar containers](https://docs.bitnami.com/kubernetes/infrastructure/flink/configuration/configure-sidecar-init-containers/).

### Pod affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, use one of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters inside each of the subsections: `jobmanager`, `taskmanager`.

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

## License

Copyright &copy; 2023 VMware, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.