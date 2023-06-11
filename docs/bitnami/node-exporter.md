<!--- app-name: Node Exporter -->

# Node Exporter packaged by Bitnami

Prometheus exporter for hardware and OS metrics exposed by UNIX kernels, with pluggable metric collectors.

[Overview of Node Exporter](https://prometheus.io/)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/node-exporter
```

## Introduction

This chart bootstraps [Node Exporter](https://github.com/bitnami/containers/tree/main/bitnami/node-exporter) on [Kubernetes](https://kubernetes.io) using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/node-exporter
```

The command deploys Node Exporter on the Kubernetes cluster in the default configuration. The [configuration](#configuration-and-installation-details) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `my-release` release:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

### Global parameters

| Name                      | Description                                     | Value |
| ------------------------- | ----------------------------------------------- | ----- |
| `global.imageRegistry`    | Global Docker image registry                    | `""`  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`  |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)    | `""`  |

### Common parameters

| Name                     | Description                                                                                  | Value           |
| ------------------------ | -------------------------------------------------------------------------------------------- | --------------- |
| `kubeVersion`            | Force target Kubernetes version (using Helm capabilities if not set)                         | `""`            |
| `nameOverride`           | String to partially override common.names.fullname template (will maintain the release name) | `""`            |
| `fullnameOverride`       | String to fully override `common.names.fullname` template with a string                      | `""`            |
| `namespaceOverride`      | String to fully override common.names.namespace                                              | `""`            |
| `commonAnnotations`      | Annotations to add to all deployed objects                                                   | `{}`            |
| `commonLabels`           | Labels to add to all deployed objects                                                        | `{}`            |
| `extraDeploy`            | Array of extra objects to deploy with the release                                            | `[]`            |
| `clusterDomain`          | Kubernetes cluster domain name                                                               | `cluster.local` |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden)      | `false`         |
| `diagnosticMode.command` | Command to override all containers in the the deployment(s)/statefulset(s)                   | `["sleep"]`     |
| `diagnosticMode.args`    | Args to override all containers in the the deployment(s)/statefulset(s)                      | `["infinity"]`  |

### Node Exporter parameters

| Name                                          | Description                                                                                                                                                        | Value                   |
| --------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------- |
| `hostAliases`                                 | Deployment pod host aliases                                                                                                                                        | `[]`                    |
| `rbac.create`                                 | Whether to create and use RBAC resources or not                                                                                                                    | `true`                  |
| `rbac.pspEnabled`                             | Whether to create a PodSecurityPolicy and bound it with RBAC. WARNING: PodSecurityPolicy is deprecated in Kubernetes v1.21 or later, unavailable in v1.25 or later | `true`                  |
| `serviceAccount.create`                       | Specifies whether a ServiceAccount should be created                                                                                                               | `true`                  |
| `serviceAccount.name`                         | Name of the service account to use. If not set and create is true, a name is generated using the fullname template.                                                | `""`                    |
| `serviceAccount.automountServiceAccountToken` | Automount service account token for the server service account                                                                                                     | `true`                  |
| `serviceAccount.annotations`                  | Annotations for service account. Evaluated as a template. Only used if `create` is `true`.                                                                         | `{}`                    |
| `image.registry`                              | Node Exporter image registry                                                                                                                                       | `docker.io`             |
| `image.repository`                            | Node Exporter image repository                                                                                                                                     | `bitnami/node-exporter` |
| `image.tag`                                   | Node Exporter image tag (immutable tags are recommended)                                                                                                           | `1.6.0-debian-11-r0`    |
| `image.digest`                                | Node Exporter image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag                                                      | `""`                    |
| `image.pullPolicy`                            | Node Exporter image pull policy                                                                                                                                    | `IfNotPresent`          |
| `image.pullSecrets`                           | Specify docker-registry secret names as an array                                                                                                                   | `[]`                    |
| `containerPorts.metrics`                      | Node Exporter container port                                                                                                                                       | `9100`                  |
| `sidecars`                                    | Add additional sidecar containers to the Node exporter pod(s)                                                                                                      | `[]`                    |
| `initContainers`                              | Add additional init containers to the Node exporter pod(s)                                                                                                         | `[]`                    |
| `extraArgs`                                   | Additional command line arguments to pass to node-exporter                                                                                                         | `{}`                    |
| `command`                                     | Override default container command (useful when using custom images)                                                                                               | `[]`                    |
| `args`                                        | Override default container args (useful when using custom images)                                                                                                  | `[]`                    |
| `lifecycleHooks`                              | for the Node exporter container(s) to automate configuration before or after startup                                                                               | `{}`                    |
| `extraEnvVars`                                | Array with extra environment variables to add to Node exporter container                                                                                           | `[]`                    |
| `extraEnvVarsCM`                              | Name of existing ConfigMap containing extra env vars for Node exporter container                                                                                   | `""`                    |
| `extraEnvVarsSecret`                          | Name of existing Secret containing extra env vars for Node exporter container                                                                                      | `""`                    |
| `extraVolumes`                                | Additional volumes to the node-exporter pods                                                                                                                       | `[]`                    |
| `extraVolumeMounts`                           | Additional volumeMounts to the node-exporter container                                                                                                             | `[]`                    |
| `podSecurityContext.enabled`                  | Enabled Node exporter pods' Security Context                                                                                                                       | `true`                  |
| `podSecurityContext.fsGroup`                  | Set Node exporter pod's Security Context fsGroup                                                                                                                   | `1001`                  |
| `containerSecurityContext.enabled`            | Enabled Node exporter containers' Security Context                                                                                                                 | `true`                  |
| `containerSecurityContext.runAsUser`          | Set Node exporter containers' Security Context runAsUser                                                                                                           | `1001`                  |
| `containerSecurityContext.runAsNonRoot`       | Set Node exporter container's Security Context runAsNonRoot                                                                                                        | `true`                  |
| `service.type`                                | Kubernetes service type                                                                                                                                            | `ClusterIP`             |
| `service.ports.metrics`                       | Node Exporter metrics service port                                                                                                                                 | `9100`                  |
| `service.nodePorts.metrics`                   | Specify the nodePort value for the LoadBalancer and NodePort service types                                                                                         | `""`                    |
| `service.clusterIP`                           | Specific cluster IP when service type is cluster IP. Use `None` for headless service                                                                               | `""`                    |
| `service.loadBalancerIP`                      | `loadBalancerIP` if service type is `LoadBalancer`                                                                                                                 | `""`                    |
| `service.loadBalancerSourceRanges`            | Address that are allowed when service is `LoadBalancer`                                                                                                            | `[]`                    |
| `service.externalTrafficPolicy`               | Node exporter service external traffic policy                                                                                                                      | `Cluster`               |
| `service.extraPorts`                          | Extra ports to expose (normally used with the `sidecar` value)                                                                                                     | `[]`                    |
| `service.addPrometheusScrapeAnnotation`       | Add the `prometheus.io/scrape: "true"` annotation to the service                                                                                                   | `true`                  |
| `service.annotations`                         | Additional annotations for Node Exporter service                                                                                                                   | `{}`                    |
| `service.labels`                              | Additional labels for Node Exporter service                                                                                                                        | `{}`                    |
| `service.sessionAffinity`                     | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                                                                                               | `None`                  |
| `service.sessionAffinityConfig`               | Additional settings for the sessionAffinity                                                                                                                        | `{}`                    |
| `updateStrategy.type`                         | The update strategy type to apply to the DaemonSet                                                                                                                 | `RollingUpdate`         |
| `updateStrategy.rollingUpdate.maxUnavailable` | Maximum number of pods that may be made unavailable                                                                                                                | `1`                     |
| `hostNetwork`                                 | Expose the service to the host network                                                                                                                             | `true`                  |
| `hostPID`                                     | Allows visibility of processes on the host, potentially leaking information such as environment variables and configuration                                        | `true`                  |
| `minReadySeconds`                             | `minReadySeconds` to avoid killing pods before we are ready                                                                                                        | `0`                     |
| `priorityClassName`                           | Priority class assigned to the Pods                                                                                                                                | `""`                    |
| `terminationGracePeriodSeconds`               | In seconds, time the given to the Node exporter pod needs to terminate gracefully                                                                                  | `""`                    |
| `resources.limits`                            | The resources limits for the container                                                                                                                             | `{}`                    |
| `resources.requests`                          | The requested resources for the container                                                                                                                          | `{}`                    |
| `podLabels`                                   | Pod labels                                                                                                                                                         | `{}`                    |
| `podAnnotations`                              | Pod annotations                                                                                                                                                    | `{}`                    |
| `podAffinityPreset`                           | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                                                | `""`                    |
| `podAntiAffinityPreset`                       | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                                           | `soft`                  |
| `nodeAffinityPreset.type`                     | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                                          | `""`                    |
| `nodeAffinityPreset.key`                      | Node label key to match Ignored if `affinity` is set.                                                                                                              | `""`                    |
| `nodeAffinityPreset.values`                   | Node label values to match. Ignored if `affinity` is set.                                                                                                          | `[]`                    |
| `affinity`                                    | Affinity for pod assignment. Evaluated as a template.                                                                                                              | `{}`                    |
| `nodeSelector`                                | Node labels for pod assignment. Evaluated as a template.                                                                                                           | `{}`                    |
| `tolerations`                                 | Tolerations for pod assignment. Evaluated as a template.                                                                                                           | `[]`                    |
| `livenessProbe.enabled`                       | Enable livenessProbe                                                                                                                                               | `true`                  |
| `livenessProbe.initialDelaySeconds`           | Initial delay seconds for livenessProbe                                                                                                                            | `120`                   |
| `livenessProbe.periodSeconds`                 | Period seconds for livenessProbe                                                                                                                                   | `10`                    |
| `livenessProbe.timeoutSeconds`                | Timeout seconds for livenessProbe                                                                                                                                  | `5`                     |
| `livenessProbe.failureThreshold`              | Failure threshold for livenessProbe                                                                                                                                | `6`                     |
| `livenessProbe.successThreshold`              | Success threshold for livenessProbe                                                                                                                                | `1`                     |
| `readinessProbe.enabled`                      | Enable readinessProbe                                                                                                                                              | `true`                  |
| `readinessProbe.initialDelaySeconds`          | Initial delay seconds for readinessProbe                                                                                                                           | `30`                    |
| `readinessProbe.periodSeconds`                | Period seconds for readinessProbe                                                                                                                                  | `10`                    |
| `readinessProbe.timeoutSeconds`               | Timeout seconds for readinessProbe                                                                                                                                 | `5`                     |
| `readinessProbe.failureThreshold`             | Failure threshold for readinessProbe                                                                                                                               | `6`                     |
| `readinessProbe.successThreshold`             | Success threshold for readinessProbe                                                                                                                               | `1`                     |
| `startupProbe.enabled`                        | Enable startupProbe                                                                                                                                                | `false`                 |
| `startupProbe.initialDelaySeconds`            | Initial delay seconds for startupProbe                                                                                                                             | `30`                    |
| `startupProbe.periodSeconds`                  | Period seconds for startupProbe                                                                                                                                    | `10`                    |
| `startupProbe.timeoutSeconds`                 | Timeout seconds for startupProbe                                                                                                                                   | `5`                     |
| `startupProbe.failureThreshold`               | Failure threshold for startupProbe                                                                                                                                 | `6`                     |
| `startupProbe.successThreshold`               | Success threshold for startupProbe                                                                                                                                 | `1`                     |
| `customStartupProbe`                          | Custom liveness probe for the Node exporter container                                                                                                              | `{}`                    |
| `customLivenessProbe`                         | Custom liveness probe for the Node exporter container                                                                                                              | `{}`                    |
| `customReadinessProbe`                        | Custom readiness probe for the Node exporter container                                                                                                             | `{}`                    |
| `serviceMonitor.enabled`                      | Creates a ServiceMonitor to monitor Node Exporter                                                                                                                  | `false`                 |
| `serviceMonitor.namespace`                    | Namespace in which Prometheus is running                                                                                                                           | `""`                    |
| `serviceMonitor.jobLabel`                     | The name of the label on the target service to use as the job name in prometheus.                                                                                  | `""`                    |
| `serviceMonitor.interval`                     | Scrape interval (use by default, falling back to Prometheus' default)                                                                                              | `""`                    |
| `serviceMonitor.scrapeTimeout`                | Timeout after which the scrape is ended                                                                                                                            | `""`                    |
| `serviceMonitor.basicAuth`                    | Use basic auth for scraping                                                                                                                                        | `{}`                    |
| `serviceMonitor.selector`                     | ServiceMonitor selector labels                                                                                                                                     | `{}`                    |
| `serviceMonitor.relabelings`                  | RelabelConfigs to apply to samples before scraping                                                                                                                 | `[]`                    |
| `serviceMonitor.metricRelabelings`            | MetricRelabelConfigs to apply to samples before ingestion                                                                                                          | `[]`                    |
| `serviceMonitor.labels`                       | Extra labels for the ServiceMonitor                                                                                                                                | `{}`                    |
| `serviceMonitor.honorLabels`                  | honorLabels chooses the metric's labels on collisions with target labels                                                                                           | `false`                 |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example the following command sets the `minReadySeconds` of the Node Exporter Pods to `120` seconds.

```console
helm install my-release --set minReadySeconds=120 oci://registry-1.docker.io/bitnamicharts/node-exporter
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/node-exporter
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling vs Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Set Pod affinity

This chart allows you to set custom Pod affinity using the `affinity` parameter(s). Find more information about Pod affinity in the [Kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, you can use the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters.

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

## Upgrading

```console
helm upgrade my-release oci://registry-1.docker.io/bitnamicharts/node-exporter
```

### To 3.0.0

This major release renames several values in this chart and adds missing features, in order to be aligned with the rest of the assets in the Bitnami charts repository.

Affected values:

- `service.port` was renamed as `service.ports.metrics`.
- `service.targetPort` was renamed as `containerPorts.metrics`.
- `service.nodePort` was renamed as `service.nodePorts.metrics`.
- `securityContext` was split in `podSecurityContext` and `containerSecurityContext`.
- Removed unused value `rbac.apiVersion`.

### To 2.1.0

This version introduces `bitnami/common`, a [library chart](https://helm.sh/docs/topics/library_charts/#helm) as a dependency. More documentation about this new utility could be found [here](https://github.com/bitnami/charts/tree/main/bitnami/common#bitnami-common-library-chart). Please, make sure that you have updated the chart dependencies before executing any upgrade.

### To 2.0.0

[On November 13, 2020, Helm v2 support formally ended](https://github.com/helm/charts#status-of-the-project). This major version is the result of the required changes applied to the Helm Chart to be able to incorporate the different features added in Helm v3 and to be consistent with the Helm project itself regarding the Helm v2 EOL.

[Learn more about this change and related upgrade considerations](https://docs.bitnami.com/kubernetes/apps/node-exporter/administration/upgrade-helm3/).

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