<!--- app-name: Fluent Bit -->

# Fluent Bit packaged by Bitnami

Fluent Bit is a Fast and Lightweight Log Processor and Forwarder. It has been made with a strong focus on performance to allow the collection of events from different sources without complexity.

[Overview of Fluent Bit](http://fluentbit.io/)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/fluent-bit
```

## Introduction

This chart bootstraps a [fluent-bit](https://github.com/bitnami/containers/tree/main/bitnami/fluent-bit) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/fluent-bit
```

These commands deploy fluent-bit on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden) | `false`        |
| `diagnosticMode.command` | Command to override all containers in the deployment                                    | `["sleep"]`    |
| `diagnosticMode.args`    | Args to override all containers in the deployment                                       | `["infinity"]` |

### Fluent Bit parameters

| Name                | Description                                                                                                | Value                |
| ------------------- | ---------------------------------------------------------------------------------------------------------- | -------------------- |
| `image.registry`    | Fluent Bit image registry                                                                                  | `docker.io`          |
| `image.repository`  | Fluent Bit image repository                                                                                | `bitnami/fluent-bit` |
| `image.tag`         | Fluent Bit image tag (immutable tags are recommended)                                                      | `2.1.3-debian-11-r2` |
| `image.digest`      | Fluent Bit image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                 |
| `image.pullPolicy`  | image pull policy                                                                                          | `IfNotPresent`       |
| `image.pullSecrets` | Fluent Bit image pull secrets                                                                              | `[]`                 |
| `image.debug`       | Enable image debug mode                                                                                    | `false`              |

### Fluent Bit daemonset configuration

| Name                                          | Description                                                                               | Value                        |
| --------------------------------------------- | ----------------------------------------------------------------------------------------- | ---------------------------- |
| `daemonset.enabled`                           | Use a daemonset instead of a deployment. `replicaCount` will not take effect.             | `false`                      |
| `daemonset.podSecurityContext.enabled`        | Enable security context for daemonset pods                                                | `true`                       |
| `daemonset.podSecurityContext.runAsUser`      | User ID for daemonset containers                                                          | `0`                          |
| `daemonset.podSecurityContext.runAsGroup`     | Group ID for daemonset containers                                                         | `0`                          |
| `daemonset.podSecurityContext.fsGroup`        | Group ID for daemonset containers filesystem                                              | `0`                          |
| `daemonset.hostPaths.logs`                    | Path to the node logs dir                                                                 | `/var/log`                   |
| `daemonset.hostPaths.containerLogs`           | Path to the container logs dir                                                            | `/var/lib/docker/containers` |
| `daemonset.hostPaths.machineId`               | Path to the machine-id file                                                               | `/etc/machine-id`            |
| `hostNetwork`                                 | Enable HOST Network                                                                       | `false`                      |
| `command`                                     | Command for running the container (set to default if not set). Use array form             | `[]`                         |
| `args`                                        | Args for running the container (set to default if not set). Use array form                | `[]`                         |
| `lifecycleHooks`                              | Override default etcd container hooks                                                     | `{}`                         |
| `extraEnvVars`                                | Extra environment variables to be set on fluent-bit container                             | `[]`                         |
| `extraEnvVarsCM`                              | Name of existing ConfigMap containing extra env vars                                      | `""`                         |
| `extraEnvVarsSecret`                          | Name of existing Secret containing extra env vars                                         | `""`                         |
| `existingConfigMap`                           | Name of an existing ConfigMap with the Fluent Bit config file                             | `""`                         |
| `hostAliases`                                 | Deployment pod host aliases                                                               | `[]`                         |
| `replicaCount`                                | Number of Fluent Bit replicas                                                             | `1`                          |
| `livenessProbe.enabled`                       | Enable livenessProbe on nodes                                                             | `true`                       |
| `livenessProbe.initialDelaySeconds`           | Initial delay seconds for livenessProbe                                                   | `10`                         |
| `livenessProbe.periodSeconds`                 | Period seconds for livenessProbe                                                          | `10`                         |
| `livenessProbe.timeoutSeconds`                | Timeout seconds for livenessProbe                                                         | `1`                          |
| `livenessProbe.failureThreshold`              | Failure threshold for livenessProbe                                                       | `3`                          |
| `livenessProbe.successThreshold`              | Success threshold for livenessProbe                                                       | `1`                          |
| `startupProbe.enabled`                        | Enable startupProbe on containers                                                         | `true`                       |
| `startupProbe.initialDelaySeconds`            | Initial delay seconds for startupProbe                                                    | `10`                         |
| `startupProbe.periodSeconds`                  | Period seconds for startupProbe                                                           | `10`                         |
| `startupProbe.timeoutSeconds`                 | Timeout seconds for startupProbe                                                          | `1`                          |
| `startupProbe.failureThreshold`               | Failure threshold for startupProbe                                                        | `15`                         |
| `startupProbe.successThreshold`               | Success threshold for startupProbe                                                        | `1`                          |
| `readinessProbe.enabled`                      | Enable readinessProbe                                                                     | `true`                       |
| `readinessProbe.initialDelaySeconds`          | Initial delay seconds for readinessProbe                                                  | `10`                         |
| `readinessProbe.periodSeconds`                | Period seconds for readinessProbe                                                         | `10`                         |
| `readinessProbe.timeoutSeconds`               | Timeout seconds for readinessProbe                                                        | `1`                          |
| `readinessProbe.failureThreshold`             | Failure threshold for readinessProbe                                                      | `15`                         |
| `readinessProbe.successThreshold`             | Success threshold for readinessProbe                                                      | `1`                          |
| `customLivenessProbe`                         | Custom livenessProbe that overrides the default one                                       | `{}`                         |
| `customStartupProbe`                          | Override default startup probe                                                            | `{}`                         |
| `customReadinessProbe`                        | Override default readiness probe                                                          | `{}`                         |
| `resources.limits`                            | The resources limits for Fluent Bit containers                                            | `{}`                         |
| `resources.requests`                          | The requested resources for Fluent Bit containers                                         | `{}`                         |
| `extraVolumeMounts`                           | Optionally specify extra list of additional volumeMounts for fluent-bit container         | `[]`                         |
| `containerPorts.http`                         | Port for HTTP port                                                                        | `2020`                       |
| `service.type`                                | Fluent Bit service type                                                                   | `ClusterIP`                  |
| `service.ports.http`                          | Port for HTTP port                                                                        | `2020`                       |
| `service.nodePorts.http`                      | Node port for HTTP port                                                                   | `""`                         |
| `service.extraPorts`                          | Extra ports to expose in the service (normally used with the `sidecar` value)             | `[]`                         |
| `service.loadBalancerIP`                      | LoadBalancerIP if service type is `LoadBalancer`                                          | `""`                         |
| `service.loadBalancerSourceRanges`            | Service Load Balancer sources                                                             | `[]`                         |
| `service.clusterIP`                           | Service Cluster IP                                                                        | `""`                         |
| `service.externalTrafficPolicy`               | Service external traffic policy                                                           | `Cluster`                    |
| `service.annotations`                         | Provide any additional annotations which may be required.                                 | `{}`                         |
| `service.sessionAffinity`                     | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                      | `None`                       |
| `service.sessionAffinityConfig`               | Additional settings for the sessionAffinity                                               | `{}`                         |
| `serviceAccount.create`                       | Enables ServiceAccount                                                                    | `true`                       |
| `serviceAccount.name`                         | ServiceAccount name                                                                       | `""`                         |
| `serviceAccount.annotations`                  | Annotations to add to all deployed objects                                                | `{}`                         |
| `serviceAccount.automountServiceAccountToken` | Automount API credentials for a service account.                                          | `true`                       |
| `podSecurityContext.enabled`                  | Enabled Fluent Bit pods' Security Context                                                 | `true`                       |
| `podSecurityContext.fsGroup`                  | Set Fluent Bit pod's Security Context fsGroup                                             | `1001`                       |
| `containerSecurityContext.enabled`            | Enabled Fluent Bit containers' Security Context                                           | `true`                       |
| `containerSecurityContext.runAsUser`          | Set Fluent Bit container's Security Context runAsUser                                     | `1001`                       |
| `containerSecurityContext.runAsNonRoot`       | Force the container to be run as non root                                                 | `true`                       |
| `podAnnotations`                              | Additional pod annotations                                                                | `{}`                         |
| `podLabels`                                   | Additional pod labels                                                                     | `{}`                         |
| `podAffinityPreset`                           | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`       | `""`                         |
| `podAntiAffinityPreset`                       | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`  | `soft`                       |
| `nodeAffinityPreset.type`                     | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard` | `""`                         |
| `nodeAffinityPreset.key`                      | Node label key to match. Ignored if `affinity` is set                                     | `""`                         |
| `nodeAffinityPreset.values`                   | Node label values to match. Ignored if `affinity` is set                                  | `[]`                         |
| `priorityClassName`                           | Server priorityClassName                                                                  | `""`                         |
| `affinity`                                    | Affinity for pod assignment                                                               | `{}`                         |
| `nodeSelector`                                | Node labels for pod assignment                                                            | `{}`                         |
| `tolerations`                                 | Tolerations for pod assignment                                                            | `[]`                         |
| `topologySpreadConstraints`                   | Topology Spread Constraints for pod assignment                                            | `[]`                         |
| `schedulerName`                               | Alternative scheduler                                                                     | `""`                         |
| `updateStrategy.type`                         | Fluent Bit deployment strategy type                                                       | `RollingUpdate`              |
| `updateStrategy.rollingUpdate`                | Fluent Bit deployment rolling update configuration parameters                             | `{}`                         |
| `extraVolumes`                                | Optionally specify extra list of additional volumes for fluent-bit container              | `[]`                         |
| `initContainers`                              | Add additional init containers to the fluent-bit pods                                     | `[]`                         |
| `sidecars`                                    | Add additional sidecar containers to the fluent-bit pods                                  | `[]`                         |

### Fluent Bit configuration

| Name                   | Description                                                                                            | Value   |
| ---------------------- | ------------------------------------------------------------------------------------------------------ | ------- |
| `config.flush`         | Interval to flush output (seconds)                                                                     | `1`     |
| `config.logLevel`      | Diagnostic level (error/warning/info/debug/trace)                                                      | `info`  |
| `config.service`       | Defines the global behaviour of the Fluent Bit engine.                                                 | `""`    |
| `config.inputs`        | Defines the source from where Fluent Bit can collect data                                              | `""`    |
| `config.filters`       | Set of plugins that can be used to filter, modify, or enrich log data that is processed by Fluent Bit. | `""`    |
| `config.outputs`       | Outputs to send the collected data to different destinations                                           | `""`    |
| `config.upstream`      | This configuration is deprecated, please use `extraFiles` instead.                                     | `{}`    |
| `config.customParsers` | Custom parsers                                                                                         | `""`    |
| `config.extraFiles`    | Extra config files                                                                                     | `{}`    |
| `rbac.create`          | Create Role and RoleBinding                                                                            | `false` |
| `rbac.nodeAccess`      | RBAC node access                                                                                       | `false` |
| `rbac.rules`           | Custom RBAC rules to set                                                                               | `[]`    |

### Autoscaling

| Name                                  | Description                                                                                    | Value   |
| ------------------------------------- | ---------------------------------------------------------------------------------------------- | ------- |
| `autoscaling.vpa.enabled`             | Enable VPA                                                                                     | `false` |
| `autoscaling.vpa.annotations`         | Annotations for VPA resource                                                                   | `{}`    |
| `autoscaling.vpa.controlledResources` | VPA List of resources that the vertical pod autoscaler can control. Defaults to cpu and memory | `[]`    |
| `autoscaling.vpa.maxAllowed`          | VPA Max allowed resources for the pod                                                          | `{}`    |
| `autoscaling.vpa.minAllowed`          | VPA Min allowed resources for the pod                                                          | `{}`    |

### VPA update policy

| Name                                                | Description                                                                                                                                                            | Value                    |
| --------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `autoscaling.vpa.updatePolicy.updateMode`           | Autoscaling update policy Specifies whether recommended updates are applied when a Pod is started and whether recommended updates are applied during the life of a Pod | `Auto`                   |
| `autoscaling.hpa.annotations`                       | Annotations for HPA resource                                                                                                                                           | `{}`                     |
| `autoscaling.hpa.enabled`                           | Enable HPA                                                                                                                                                             | `false`                  |
| `autoscaling.hpa.minReplicas`                       | Min replicas                                                                                                                                                           | `1`                      |
| `autoscaling.hpa.maxReplicas`                       | Max replicas                                                                                                                                                           | `3`                      |
| `autoscaling.hpa.targetCPUUtilizationPercentage`    | Target CPU utilization percentage                                                                                                                                      | `75`                     |
| `autoscaling.hpa.targetMemoryUtilizationPercentage` | Target Memory utilization percentage                                                                                                                                   | `""`                     |
| `autoscaling.hpa.customRules`                       | Custom rules                                                                                                                                                           | `[]`                     |
| `autoscaling.hpa.behavior`                          | HPA Behavior                                                                                                                                                           | `{}`                     |
| `ingress.enabled`                                   | Enable ingress controller resource for fluentBit Console                                                                                                               | `false`                  |
| `ingress.apiVersion`                                | Force Ingress API version (automatically detected if not set)                                                                                                          | `""`                     |
| `ingress.ingressClassName`                          | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                                                          | `""`                     |
| `ingress.hostname`                                  | Default host for the ingress resource                                                                                                                                  | `fluent-bit.local`       |
| `ingress.path`                                      | The Path to fluentBit&reg;. You may need to set this to '/*' in order to use this with ALB ingress controllers.                                                        | `/`                      |
| `ingress.pathType`                                  | Ingress path type                                                                                                                                                      | `ImplementationSpecific` |
| `ingress.annotations`                               | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations.                                       | `{}`                     |
| `ingress.tls`                                       | Enable TLS configuration for the hostname defined at `ingress.hostname` parameter                                                                                      | `false`                  |
| `ingress.selfSigned`                                | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                                                           | `false`                  |
| `ingress.extraHosts`                                | The list of additional hostnames to be covered with this ingress record.                                                                                               | `[]`                     |
| `ingress.extraPaths`                                | Any additional paths that may need to be added to the ingress under the main host                                                                                      | `[]`                     |
| `ingress.extraTls`                                  | The tls configuration for additional hostnames to be covered with this ingress record.                                                                                 | `[]`                     |
| `ingress.secrets`                                   | If you're providing your own certificates, please use this to add the certificates as secrets                                                                          | `[]`                     |
| `ingress.extraRules`                                | Additional rules to be covered with this ingress record                                                                                                                | `[]`                     |
| `pdb.create`                                        | Deploy a PodDisruptionBudget object for Fluent Bit deployment                                                                                                          | `false`                  |
| `pdb.minAvailable`                                  | Minimum available Fluent Bit replicas (expressed in percentage)                                                                                                        | `""`                     |
| `pdb.maxUnavailable`                                | Maximum unavailable Fluent Bit replicas (expressed in percentage)                                                                                                      | `50%`                    |
| `metrics.enabled`                                   | Enable the export of Prometheus metrics                                                                                                                                | `false`                  |
| `metrics.serviceMonitor.enabled`                    | if `true`, creates a Prometheus Operator ServiceMonitor (also requires `metrics.enabled` to be `true`)                                                                 | `false`                  |
| `metrics.serviceMonitor.namespace`                  | Namespace in which Prometheus is running                                                                                                                               | `""`                     |
| `metrics.serviceMonitor.annotations`                | Additional custom annotations for the ServiceMonitor                                                                                                                   | `{}`                     |
| `metrics.serviceMonitor.labels`                     | Extra labels for the ServiceMonitor                                                                                                                                    | `{}`                     |
| `metrics.serviceMonitor.jobLabel`                   | The name of the label on the target service to use as the job name in Prometheus                                                                                       | `""`                     |
| `metrics.serviceMonitor.honorLabels`                | honorLabels chooses the metric's labels on collisions with target labels                                                                                               | `false`                  |
| `metrics.serviceMonitor.interval`                   | Interval at which metrics should be scraped.                                                                                                                           | `""`                     |
| `metrics.serviceMonitor.scrapeTimeout`              | Timeout after which the scrape is ended                                                                                                                                | `""`                     |
| `metrics.serviceMonitor.metricRelabelings`          | Specify additional relabeling of metrics                                                                                                                               | `[]`                     |
| `metrics.serviceMonitor.relabelings`                | Specify general relabeling                                                                                                                                             | `[]`                     |
| `metrics.serviceMonitor.selector`                   | Prometheus instance selector labels                                                                                                                                    | `{}`                     |
| `extraDeploy`                                       | Array of extra objects to deploy with the release                                                                                                                      | `[]`                     |

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Persistence

The [Bitnami Fluent Bit](https://github.com/bitnami/containers/tree/main/bitnami/fluent-bit) doesn't implement storage persistence by default, but you could mount an extraVolume with Persistent Volume Claims to keep the buffer and/or the output if configured out-of-memory (see [Buffering & Storage](https://docs.fluentbit.io/manual/administration/buffering-and-storage))

### Additional environment variables

In case you want to add extra environment variables (useful for advanced operations like custom init scripts), you can use the `extraEnvVars` property.

### Sidecars

If additional containers are needed in the same pod as fluent-bit (such as additional metrics or logging exporters), they can be defined using the `sidecars` parameter inside the main section. If these sidecars export extra ports, extra port definitions can be added using the `service.extraPorts` parameter. [Learn more about configuring and using sidecar containers](https://docs.bitnami.com/kubernetes/infrastructure/fluent-bit/configuration/configure-sidecar-init-containers/).

### Pod affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, use one of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters inside the main section.

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