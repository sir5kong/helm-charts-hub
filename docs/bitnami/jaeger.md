<!--- app-name: Jaeger -->

# Jaeger packaged by Bitnami

Jaeger is a distributed tracing system. It is used for monitoring and troubleshooting microservices-based distributed systems.

[Overview of Jaeger](https://jaegertracing.io/)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/jaeger
```

## Introduction

This chart bootstraps a [jaeger](https://github.com/bitnami/containers/tree/main/bitnami/jaeger) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/jaeger
```

These commands deploy jaeger on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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

### Jaeger parameters

| Name                | Description                                                                                            | Value                 |
| ------------------- | ------------------------------------------------------------------------------------------------------ | --------------------- |
| `image.registry`    | Jaeger image registry                                                                                  | `docker.io`           |
| `image.repository`  | Jaeger image repository                                                                                | `bitnami/jaeger`      |
| `image.tag`         | Jaeger image tag (immutable tags are recommended)                                                      | `1.46.0-debian-11-r0` |
| `image.digest`      | Jaeger image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                  |
| `image.pullPolicy`  | image pull policy                                                                                      | `IfNotPresent`        |
| `image.pullSecrets` | Jaeger image pull secrets                                                                              | `[]`                  |
| `image.debug`       | Enable image debug mode                                                                                | `false`               |

### Query deployment parameters

| Name                                                | Description                                                                               | Value           |
| --------------------------------------------------- | ----------------------------------------------------------------------------------------- | --------------- |
| `query.command`                                     | Command for running the container (set to default if not set). Use array form             | `[]`            |
| `query.args`                                        | Args for running the container (set to default if not set). Use array form                | `[]`            |
| `query.lifecycleHooks`                              | Override default etcd container hooks                                                     | `{}`            |
| `query.extraEnvVars`                                | Extra environment variables to be set on jaeger container                                 | `[]`            |
| `query.extraEnvVarsCM`                              | Name of existing ConfigMap containing extra env vars                                      | `""`            |
| `query.extraEnvVarsSecret`                          | Name of existing Secret containing extra env vars                                         | `""`            |
| `query.replicaCount`                                | Number of Jaeger replicas                                                                 | `1`             |
| `query.livenessProbe.enabled`                       | Enable livenessProbe on Query nodes                                                       | `true`          |
| `query.livenessProbe.initialDelaySeconds`           | Initial delay seconds for livenessProbe                                                   | `10`            |
| `query.livenessProbe.periodSeconds`                 | Period seconds for livenessProbe                                                          | `10`            |
| `query.livenessProbe.timeoutSeconds`                | Timeout seconds for livenessProbe                                                         | `1`             |
| `query.livenessProbe.failureThreshold`              | Failure threshold for livenessProbe                                                       | `3`             |
| `query.livenessProbe.successThreshold`              | Success threshold for livenessProbe                                                       | `1`             |
| `query.startupProbe.enabled`                        | Enable startupProbe on Query containers                                                   | `false`         |
| `query.startupProbe.initialDelaySeconds`            | Initial delay seconds for startupProbe                                                    | `10`            |
| `query.startupProbe.periodSeconds`                  | Period seconds for startupProbe                                                           | `10`            |
| `query.startupProbe.timeoutSeconds`                 | Timeout seconds for startupProbe                                                          | `1`             |
| `query.startupProbe.failureThreshold`               | Failure threshold for startupProbe                                                        | `15`            |
| `query.startupProbe.successThreshold`               | Success threshold for startupProbe                                                        | `1`             |
| `query.readinessProbe.enabled`                      | Enable readinessProbe                                                                     | `false`         |
| `query.readinessProbe.initialDelaySeconds`          | Initial delay seconds for readinessProbe                                                  | `10`            |
| `query.readinessProbe.periodSeconds`                | Period seconds for readinessProbe                                                         | `10`            |
| `query.readinessProbe.timeoutSeconds`               | Timeout seconds for readinessProbe                                                        | `1`             |
| `query.readinessProbe.failureThreshold`             | Failure threshold for readinessProbe                                                      | `15`            |
| `query.readinessProbe.successThreshold`             | Success threshold for readinessProbe                                                      | `1`             |
| `query.customLivenessProbe`                         | Custom livenessProbe that overrides the default one                                       | `{}`            |
| `query.customStartupProbe`                          | Override default startup probe                                                            | `{}`            |
| `query.customReadinessProbe`                        | Override default readiness probe                                                          | `{}`            |
| `query.resources.limits`                            | The resources limits for Jaeger containers                                                | `{}`            |
| `query.resources.requests`                          | The requested resources for Jaeger containers                                             | `{}`            |
| `query.extraVolumeMounts`                           | Optionally specify extra list of additional volumeMounts for jaeger container             | `[]`            |
| `query.containerPorts.api`                          | Port for API                                                                              | `16686`         |
| `query.containerPorts.admin`                        | Port for admin                                                                            | `16687`         |
| `query.service.type`                                | Jaeger service type                                                                       | `ClusterIP`     |
| `query.service.ports.api`                           | Port for API                                                                              | `16686`         |
| `query.service.ports.admin`                         | Port for admin                                                                            | `16687`         |
| `query.service.nodePorts.api`                       | Node port for API                                                                         | `""`            |
| `query.service.nodePorts.admin`                     | Node port for admin                                                                       | `""`            |
| `query.service.extraPorts`                          | Extra ports to expose in the service (normally used with the `sidecar` value)             | `[]`            |
| `query.service.loadBalancerIP`                      | LoadBalancerIP if service type is `LoadBalancer`                                          | `""`            |
| `query.service.loadBalancerSourceRanges`            | Service Load Balancer sources                                                             | `[]`            |
| `query.service.clusterIP`                           | Service Cluster IP                                                                        | `""`            |
| `query.service.externalTrafficPolicy`               | Service external traffic policy                                                           | `Cluster`       |
| `query.service.annotations`                         | Provide any additional annotations which may be required.                                 | `{}`            |
| `query.service.sessionAffinity`                     | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                      | `None`          |
| `query.service.sessionAffinityConfig`               | Additional settings for the sessionAffinity                                               | `{}`            |
| `query.service.metrics.annotations`                 | Annotations for Prometheus metrics                                                        | `{}`            |
| `query.serviceAccount.create`                       | Enables ServiceAccount                                                                    | `true`          |
| `query.serviceAccount.name`                         | ServiceAccount name                                                                       | `""`            |
| `query.serviceAccount.annotations`                  | Annotations to add to all deployed objects                                                | `{}`            |
| `query.serviceAccount.automountServiceAccountToken` | Automount API credentials for a service account.                                          | `true`          |
| `query.podSecurityContext.enabled`                  | Enabled Jaeger pods' Security Context                                                     | `true`          |
| `query.podSecurityContext.fsGroup`                  | Set Jaeger pod's Security Context fsGroup                                                 | `1001`          |
| `query.containerSecurityContext.enabled`            | Enabled Jaeger containers' Security Context                                               | `true`          |
| `query.containerSecurityContext.runAsUser`          | Set Jaeger container's Security Context runAsUser                                         | `1001`          |
| `query.containerSecurityContext.runAsNonRoot`       | Force the container to be run as non root                                                 | `true`          |
| `query.podAnnotations`                              | Additional pod annotations                                                                | `{}`            |
| `query.podLabels`                                   | Additional pod labels                                                                     | `{}`            |
| `query.podAffinityPreset`                           | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `query.podAntiAffinityPreset`                       | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `query.nodeAffinityPreset.type`                     | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `query.nodeAffinityPreset.key`                      | Node label key to match. Ignored if `affinity` is set                                     | `""`            |
| `query.nodeAffinityPreset.values`                   | Node label values to match. Ignored if `affinity` is set                                  | `[]`            |
| `query.priorityClassName`                           | Server priorityClassName                                                                  | `""`            |
| `query.affinity`                                    | Affinity for pod assignment                                                               | `{}`            |
| `query.nodeSelector`                                | Node labels for pod assignment                                                            | `{}`            |
| `query.tolerations`                                 | Tolerations for pod assignment                                                            | `[]`            |
| `query.topologySpreadConstraints`                   | Topology Spread Constraints for pod assignment                                            | `[]`            |
| `query.schedulerName`                               | Alternative scheduler                                                                     | `""`            |
| `query.updateStrategy.type`                         | Jaeger query deployment strategy type                                                     | `RollingUpdate` |
| `query.updateStrategy.rollingUpdate`                | Jaeger query deployment rolling update configuration parameters                           | `{}`            |
| `query.extraVolumes`                                | Optionally specify extra list of additional volumes for jaeger container                  | `[]`            |
| `query.initContainers`                              | Add additional init containers to the jaeger pods                                         | `[]`            |
| `query.sidecars`                                    | Add additional sidecar containers to the jaeger pods                                      | `[]`            |

### Collector deployment parameters

| Name                                                    | Description                                                                                | Value           |
| ------------------------------------------------------- | ------------------------------------------------------------------------------------------ | --------------- |
| `collector.command`                                     | Command for running the container (set to default if not set). Use array form              | `[]`            |
| `collector.args`                                        | Args for running the container (set to default if not set). Use array form                 | `[]`            |
| `collector.lifecycleHooks`                              | Override default etcd container hooks                                                      | `{}`            |
| `collector.extraEnvVars`                                | Extra environment variables to be set on jaeger container                                  | `[]`            |
| `collector.extraEnvVarsCM`                              | Name of existing ConfigMap containing extra env vars                                       | `""`            |
| `collector.extraEnvVarsSecret`                          | Name of existing Secret containing extra env vars                                          | `""`            |
| `collector.replicaCount`                                | Number of Jaeger replicas                                                                  | `1`             |
| `collector.livenessProbe.enabled`                       | Enable livenessProbe on collector nodes                                                    | `true`          |
| `collector.livenessProbe.initialDelaySeconds`           | Initial delay seconds for livenessProbe                                                    | `10`            |
| `collector.livenessProbe.periodSeconds`                 | Period seconds for livenessProbe                                                           | `10`            |
| `collector.livenessProbe.timeoutSeconds`                | Timeout seconds for livenessProbe                                                          | `1`             |
| `collector.livenessProbe.failureThreshold`              | Failure threshold for livenessProbe                                                        | `3`             |
| `collector.livenessProbe.successThreshold`              | Success threshold for livenessProbe                                                        | `1`             |
| `collector.startupProbe.enabled`                        | Enable startupProbe on collector containers                                                | `false`         |
| `collector.startupProbe.initialDelaySeconds`            | Initial delay seconds for startupProbe                                                     | `10`            |
| `collector.startupProbe.periodSeconds`                  | Period seconds for startupProbe                                                            | `10`            |
| `collector.startupProbe.timeoutSeconds`                 | Timeout seconds for startupProbe                                                           | `1`             |
| `collector.startupProbe.failureThreshold`               | Failure threshold for startupProbe                                                         | `15`            |
| `collector.startupProbe.successThreshold`               | Success threshold for startupProbe                                                         | `1`             |
| `collector.readinessProbe.enabled`                      | Enable readinessProbe                                                                      | `false`         |
| `collector.readinessProbe.initialDelaySeconds`          | Initial delay seconds for readinessProbe                                                   | `10`            |
| `collector.readinessProbe.periodSeconds`                | Period seconds for readinessProbe                                                          | `10`            |
| `collector.readinessProbe.timeoutSeconds`               | Timeout seconds for readinessProbe                                                         | `1`             |
| `collector.readinessProbe.failureThreshold`             | Failure threshold for readinessProbe                                                       | `15`            |
| `collector.readinessProbe.successThreshold`             | Success threshold for readinessProbe                                                       | `1`             |
| `collector.customLivenessProbe`                         | Custom livenessProbe that overrides the default one                                        | `{}`            |
| `collector.customStartupProbe`                          | Override default startup probe                                                             | `{}`            |
| `collector.customReadinessProbe`                        | Override default readiness probe                                                           | `{}`            |
| `collector.resources.limits`                            | The resources limits for Jaeger containers                                                 | `{}`            |
| `collector.resources.requests`                          | The requested resources for Jaeger containers                                              | `{}`            |
| `collector.extraVolumeMounts`                           | Optionally specify extra list of additional volumeMounts for jaeger container              | `[]`            |
| `collector.containerPorts.zipkin`                       | can accept Zipkin spans in Thrift, JSON and Proto (disabled by default)                    | `9411`          |
| `collector.containerPorts.grpc`                         | used by jaeger-agent to send spans in model.proto format                                   | `14250`         |
| `collector.containerPorts.binary`                       | can accept spans directly from clients in jaeger.thrift format over binary thrift protocol | `14268`         |
| `collector.containerPorts.admin`                        | Admin port: health check at / and metrics at /metrics                                      | `14269`         |
| `collector.service.type`                                | Jaeger service type                                                                        | `ClusterIP`     |
| `collector.service.ports.zipkin`                        | can accept Zipkin spans in Thrift, JSON and Proto (disabled by default)                    | `9411`          |
| `collector.service.ports.grpc`                          | used by jaeger-agent to send spans in model.proto format                                   | `14250`         |
| `collector.service.ports.binary`                        | can accept spans directly from clients in jaeger.thrift format over binary thrift protocol | `14268`         |
| `collector.service.ports.admin`                         | Admin port: health check at / and metrics at /metrics                                      | `14269`         |
| `collector.service.nodePorts.zipkin`                    | can accept Zipkin spans in Thrift, JSON and Proto (disabled by default)                    | `""`            |
| `collector.service.nodePorts.grpc`                      | used by jaeger-agent to send spans in model.proto format                                   | `""`            |
| `collector.service.nodePorts.binary`                    | can accept spans directly from clients in jaeger.thrift format over binary thrift protocol | `""`            |
| `collector.service.nodePorts.admin`                     | Admin port: health check at / and metrics at /metrics                                      | `""`            |
| `collector.service.extraPorts`                          | Extra ports to expose in the service (normally used with the `sidecar` value)              | `[]`            |
| `collector.service.loadBalancerIP`                      | LoadBalancerIP if service type is `LoadBalancer`                                           | `""`            |
| `collector.service.loadBalancerSourceRanges`            | Service Load Balancer sources                                                              | `[]`            |
| `collector.service.clusterIP`                           | Service Cluster IP                                                                         | `""`            |
| `collector.service.externalTrafficPolicy`               | Service external traffic policy                                                            | `Cluster`       |
| `collector.service.annotations`                         | Provide any additional annotations which may be required.                                  | `{}`            |
| `collector.service.sessionAffinity`                     | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                       | `None`          |
| `collector.service.sessionAffinityConfig`               | Additional settings for the sessionAffinity                                                | `{}`            |
| `collector.service.metrics.annotations`                 | Annotations for Prometheus metrics                                                         | `{}`            |
| `collector.serviceAccount.create`                       | Enables ServiceAccount                                                                     | `true`          |
| `collector.serviceAccount.name`                         | ServiceAccount name                                                                        | `""`            |
| `collector.serviceAccount.annotations`                  | Annotations to add to all deployed objects                                                 | `{}`            |
| `collector.serviceAccount.automountServiceAccountToken` | Automount API credentials for a service account.                                           | `true`          |
| `collector.podSecurityContext.enabled`                  | Enabled Jaeger pods' Security Context                                                      | `true`          |
| `collector.podSecurityContext.fsGroup`                  | Set Jaeger pod's Security Context fsGroup                                                  | `1001`          |
| `collector.containerSecurityContext.enabled`            | Enabled Jaeger containers' Security Context                                                | `true`          |
| `collector.containerSecurityContext.runAsUser`          | Set Jaeger container's Security Context runAsUser                                          | `1001`          |
| `collector.containerSecurityContext.runAsNonRoot`       | Force the container to be run as non root                                                  | `true`          |
| `collector.podAnnotations`                              | Additional pod annotations                                                                 | `{}`            |
| `collector.podLabels`                                   | Additional pod labels                                                                      | `{}`            |
| `collector.podAffinityPreset`                           | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`        | `""`            |
| `collector.podAntiAffinityPreset`                       | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`   | `soft`          |
| `collector.nodeAffinityPreset.type`                     | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`  | `""`            |
| `collector.nodeAffinityPreset.key`                      | Node label key to match. Ignored if `affinity` is set                                      | `""`            |
| `collector.nodeAffinityPreset.values`                   | Node label values to match. Ignored if `affinity` is set                                   | `[]`            |
| `collector.priorityClassName`                           | Server priorityClassName                                                                   | `""`            |
| `collector.affinity`                                    | Affinity for pod assignment                                                                | `{}`            |
| `collector.nodeSelector`                                | Node labels for pod assignment                                                             | `{}`            |
| `collector.tolerations`                                 | Tolerations for pod assignment                                                             | `[]`            |
| `collector.topologySpreadConstraints`                   | Topology Spread Constraints for pod assignment                                             | `[]`            |
| `collector.schedulerName`                               | Alternative scheduler                                                                      | `""`            |
| `collector.updateStrategy.type`                         | Jaeger collector deployment strategy type                                                  | `RollingUpdate` |
| `collector.updateStrategy.rollingUpdate`                | Jaeger collector deployment rolling update configuration parameters                        | `{}`            |
| `collector.extraVolumes`                                | Optionally specify extra list of additional volumes for jaeger container                   | `[]`            |
| `collector.initContainers`                              | Add additional init containers to the jaeger pods                                          | `[]`            |
| `collector.sidecars`                                    | Add additional sidecar containers to the jaeger pods                                       | `[]`            |

### agent deployment parameters

| Name                                                | Description                                                                                                    | Value           |
| --------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | --------------- |
| `agent.command`                                     | Command for running the container (set to default if not set). Use array form                                  | `[]`            |
| `agent.args`                                        | Args for running the container (set to default if not set). Use array form                                     | `[]`            |
| `agent.lifecycleHooks`                              | Override default etcd container hooks                                                                          | `{}`            |
| `agent.extraEnvVars`                                | Extra environment variables to be set on jaeger container                                                      | `[]`            |
| `agent.extraEnvVarsCM`                              | Name of existing ConfigMap containing extra env vars                                                           | `""`            |
| `agent.extraEnvVarsSecret`                          | Name of existing Secret containing extra env vars                                                              | `""`            |
| `agent.replicaCount`                                | Number of Jaeger replicas                                                                                      | `1`             |
| `agent.livenessProbe.enabled`                       | Enable livenessProbe on agent nodes                                                                            | `true`          |
| `agent.livenessProbe.initialDelaySeconds`           | Initial delay seconds for livenessProbe                                                                        | `10`            |
| `agent.livenessProbe.periodSeconds`                 | Period seconds for livenessProbe                                                                               | `10`            |
| `agent.livenessProbe.timeoutSeconds`                | Timeout seconds for livenessProbe                                                                              | `1`             |
| `agent.livenessProbe.failureThreshold`              | Failure threshold for livenessProbe                                                                            | `3`             |
| `agent.livenessProbe.successThreshold`              | Success threshold for livenessProbe                                                                            | `1`             |
| `agent.startupProbe.enabled`                        | Enable startupProbe on agent containers                                                                        | `false`         |
| `agent.startupProbe.initialDelaySeconds`            | Initial delay seconds for startupProbe                                                                         | `10`            |
| `agent.startupProbe.periodSeconds`                  | Period seconds for startupProbe                                                                                | `10`            |
| `agent.startupProbe.timeoutSeconds`                 | Timeout seconds for startupProbe                                                                               | `1`             |
| `agent.startupProbe.failureThreshold`               | Failure threshold for startupProbe                                                                             | `15`            |
| `agent.startupProbe.successThreshold`               | Success threshold for startupProbe                                                                             | `1`             |
| `agent.readinessProbe.enabled`                      | Enable readinessProbe                                                                                          | `false`         |
| `agent.readinessProbe.initialDelaySeconds`          | Initial delay seconds for readinessProbe                                                                       | `10`            |
| `agent.readinessProbe.periodSeconds`                | Period seconds for readinessProbe                                                                              | `10`            |
| `agent.readinessProbe.timeoutSeconds`               | Timeout seconds for readinessProbe                                                                             | `1`             |
| `agent.readinessProbe.failureThreshold`             | Failure threshold for readinessProbe                                                                           | `15`            |
| `agent.readinessProbe.successThreshold`             | Success threshold for readinessProbe                                                                           | `1`             |
| `agent.customLivenessProbe`                         | Custom livenessProbe that overrides the default one                                                            | `{}`            |
| `agent.customStartupProbe`                          | Override default startup probe                                                                                 | `{}`            |
| `agent.customReadinessProbe`                        | Override default readiness probe                                                                               | `{}`            |
| `agent.resources.limits`                            | The resources limits for Jaeger containers                                                                     | `{}`            |
| `agent.resources.requests`                          | The requested resources for Jaeger containers                                                                  | `{}`            |
| `agent.extraVolumeMounts`                           | Optionally specify extra list of additional volumeMounts for jaeger container                                  | `[]`            |
| `agent.containerPorts.compact`                      | accept jaeger.thrift in compact Thrift protocol used by most current Jaeger clients                            | `6831`          |
| `agent.containerPorts.binary`                       | accept jaeger.thrift in binary Thrift protocol used by Node.js Jaeger client                                   | `6832`          |
| `agent.containerPorts.config`                       | Serve configs, sampling strategies                                                                             | `5778`          |
| `agent.containerPorts.zipkin`                       | Accept zipkin.thrift in compact Thrift protocol (deprecated; only used by very old Jaeger clients, circa 2016) | `5775`          |
| `agent.containerPorts.admin`                        | Admin port: health check at / and metrics at /metrics                                                          | `14271`         |
| `agent.service.type`                                | Jaeger service type                                                                                            | `ClusterIP`     |
| `agent.service.ports.compact`                       | accept jaeger.thrift in compact Thrift protocol used by most current Jaeger clients                            | `6831`          |
| `agent.service.ports.binary`                        | accept jaeger.thrift in binary Thrift protocol used by Node.js Jaeger client                                   | `6832`          |
| `agent.service.ports.config`                        | Serve configs, sampling strategies                                                                             | `5778`          |
| `agent.service.ports.zipkin`                        | Accept zipkin.thrift in compact Thrift protocol (deprecated; only used by very old Jaeger clients, circa 2016) | `5775`          |
| `agent.service.ports.admin`                         | Admin port: health check at / and metrics at /metrics                                                          | `14271`         |
| `agent.service.nodePorts.compact`                   | accept jaeger.thrift in compact Thrift protocol used by most current Jaeger clients                            | `""`            |
| `agent.service.nodePorts.binary`                    | accept jaeger.thrift in binary Thrift protocol used by Node.js Jaeger client                                   | `""`            |
| `agent.service.nodePorts.config`                    | Serve configs, sampling strategies                                                                             | `""`            |
| `agent.service.nodePorts.zipkin`                    | Accept zipkin.thrift in compact Thrift protocol (deprecated; only used by very old Jaeger clients, circa 2016) | `""`            |
| `agent.service.nodePorts.admin`                     | Admin port: health check at / and metrics at /metrics                                                          | `""`            |
| `agent.service.extraPorts`                          | Extra ports to expose in the service (normally used with the `sidecar` value)                                  | `[]`            |
| `agent.service.loadBalancerIP`                      | LoadBalancerIP if service type is `LoadBalancer`                                                               | `""`            |
| `agent.service.loadBalancerSourceRanges`            | Service Load Balancer sources                                                                                  | `[]`            |
| `agent.service.clusterIP`                           | Service Cluster IP                                                                                             | `""`            |
| `agent.service.externalTrafficPolicy`               | Service external traffic policy                                                                                | `Cluster`       |
| `agent.service.annotations`                         | Provide any additional annotations which may be required.                                                      | `{}`            |
| `agent.service.sessionAffinity`                     | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                                           | `None`          |
| `agent.service.sessionAffinityConfig`               | Additional settings for the sessionAffinity                                                                    | `{}`            |
| `agent.service.metrics.annotations`                 | Annotations for Prometheus metrics                                                                             | `{}`            |
| `agent.serviceAccount.create`                       | Enables ServiceAccount                                                                                         | `true`          |
| `agent.serviceAccount.name`                         | ServiceAccount name                                                                                            | `""`            |
| `agent.serviceAccount.annotations`                  | Annotations to add to all deployed objects                                                                     | `{}`            |
| `agent.serviceAccount.automountServiceAccountToken` | Automount API credentials for a service account.                                                               | `true`          |
| `agent.podSecurityContext.enabled`                  | Enabled Jaeger pods' Security Context                                                                          | `true`          |
| `agent.podSecurityContext.fsGroup`                  | Set Jaeger pod's Security Context fsGroup                                                                      | `1001`          |
| `agent.containerSecurityContext.enabled`            | Enabled Jaeger containers' Security Context                                                                    | `true`          |
| `agent.containerSecurityContext.runAsUser`          | Set Jaeger container's Security Context runAsUser                                                              | `1001`          |
| `agent.containerSecurityContext.runAsNonRoot`       | Force the container to be run as non root                                                                      | `true`          |
| `agent.podAnnotations`                              | Additional pod annotations                                                                                     | `{}`            |
| `agent.podLabels`                                   | Additional pod labels                                                                                          | `{}`            |
| `agent.podAffinityPreset`                           | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                            | `""`            |
| `agent.podAntiAffinityPreset`                       | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                       | `soft`          |
| `agent.nodeAffinityPreset.type`                     | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                      | `""`            |
| `agent.nodeAffinityPreset.key`                      | Node label key to match. Ignored if `affinity` is set                                                          | `""`            |
| `agent.nodeAffinityPreset.values`                   | Node label values to match. Ignored if `affinity` is set                                                       | `[]`            |
| `agent.priorityClassName`                           | Server priorityClassName                                                                                       | `""`            |
| `agent.affinity`                                    | Affinity for pod assignment                                                                                    | `{}`            |
| `agent.nodeSelector`                                | Node labels for pod assignment                                                                                 | `{}`            |
| `agent.tolerations`                                 | Tolerations for pod assignment                                                                                 | `[]`            |
| `agent.topologySpreadConstraints`                   | Topology Spread Constraints for pod assignment                                                                 | `[]`            |
| `agent.schedulerName`                               | Alternative scheduler                                                                                          | `""`            |
| `agent.updateStrategy.type`                         | Jaeger agent deployment strategy type                                                                          | `RollingUpdate` |
| `agent.updateStrategy.rollingUpdate`                | Jaeger agent deployment rolling update configuration parameters                                                | `{}`            |
| `agent.extraVolumes`                                | Optionally specify extra list of additional volumes for jaeger container                                       | `[]`            |
| `agent.initContainers`                              | Add additional init containers to the jaeger pods                                                              | `[]`            |
| `agent.sidecars`                                    | Add additional sidecar containers to the jaeger pods                                                           | `[]`            |
| `migration.podLabels`                               | Additional pod labels                                                                                          | `{}`            |
| `migration.podAnnotations`                          | Additional pod annotations                                                                                     | `{}`            |
| `migration.annotations`                             | Provide any additional annotations which may be required.                                                      | `{}`            |
| `migration.podSecurityContext.enabled`              | Enabled Jaeger pods' Security Context                                                                          | `true`          |
| `migration.podSecurityContext.fsGroup`              | Set Jaeger pod's Security Context fsGroup                                                                      | `1001`          |
| `migration.extraEnvVars`                            | Extra environment variables to be set on jaeger migration container                                            | `[]`            |
| `migration.extraEnvVarsCM`                          | Name of existing ConfigMap containing extra env vars                                                           | `""`            |
| `migration.extraEnvVarsSecret`                      | Name of existing Secret containing extra env vars                                                              | `""`            |
| `migration.extraVolumeMounts`                       | Optionally specify extra list of additional volumeMounts for jaeger container                                  | `[]`            |
| `migration.resources.limits`                        | The resources limits for Jaeger containers                                                                     | `{}`            |
| `migration.resources.requests`                      | The requested resources for Jaeger containers                                                                  | `{}`            |
| `migration.extraVolumes`                            | Optionally specify extra list of additional volumes for jaeger container                                       | `[]`            |

### Set the image to use for the migration job

| Name                                         | Description                                                                                               | Value                 |
| -------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------- |
| `cqlshImage.registry`                        | Cassandra image registry                                                                                  | `docker.io`           |
| `cqlshImage.repository`                      | Cassandra image repository                                                                                | `bitnami/cassandra`   |
| `cqlshImage.tag`                             | Cassandra image tag (immutable tags are recommended)                                                      | `4.0.10-debian-11-r2` |
| `cqlshImage.digest`                          | Cassandra image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                  |
| `cqlshImage.pullPolicy`                      | image pull policy                                                                                         | `IfNotPresent`        |
| `cqlshImage.pullSecrets`                     | Cassandra image pull secrets                                                                              | `[]`                  |
| `cqlshImage.debug`                           | Enable image debug mode                                                                                   | `false`               |
| `externalDatabase.host`                      | External database host                                                                                    | `""`                  |
| `externalDatabase.port`                      | External database port                                                                                    | `9042`                |
| `externalDatabase.dbUser.user`               | Cassandra admin user                                                                                      | `bn_jaeger`           |
| `externalDatabase.dbUser.password`           | Password for `dbUser.user`. Randomly generated if empty                                                   | `""`                  |
| `externalDatabase.existingSecret`            | Name of existing secret containing the database secret                                                    | `""`                  |
| `externalDatabase.existingSecretPasswordKey` | Name of existing secret key containing the database password secret key                                   | `""`                  |
| `externalDatabase.cluster.datacenter`        | Name for cassandra's jaeger datacenter                                                                    | `dc1`                 |
| `externalDatabase.keyspace`                  | Name for cassandra's jaeger keyspace                                                                      | `bitnami_jaeger`      |

### Cassandra storage sub-chart

| Name                           | Description                                             | Value            |
| ------------------------------ | ------------------------------------------------------- | ---------------- |
| `cassandra.enabled`            | Enables cassandra storage pod                           | `true`           |
| `cassandra.cluster.datacenter` | Name for cassandra's jaeger datacenter                  | `dc1`            |
| `cassandra.keyspace`           | Name for cassandra's jaeger keyspace                    | `bitnami_jaeger` |
| `cassandra.dbUser.user`        | Cassandra admin user                                    | `bn_jaeger`      |
| `cassandra.dbUser.password`    | Password for `dbUser.user`. Randomly generated if empty | `""`             |
| `cassandra.service.ports.cql`  | Cassandra cql port                                      | `9042`           |

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Persistence

The [Bitnami jaeger](https://github.com/bitnami/containers/tree/main/bitnami/jaeger) image stores the trace onto an external database. Persistent Volume Claims are used to keep the data across deployments.

### Additional environment variables

In case you want to add extra environment variables (useful for advanced operations like custom init scripts), you can use the `extraEnvVars` property inside each of the subsections: `collector`, `agent`, `query`.

```yaml
collector:
  extraEnvVars:
    - name: ENV_VAR_NAME
      value: ENV_VAR_VALUE

agent:
  extraEnvVars:
    - name: ENV_VAR_NAME
      value: ENV_VAR_VALUE

query:
  extraEnvVars:
    - name: ENV_VAR_NAME
      value: ENV_VAR_VALUE
```

Alternatively, you can use a ConfigMap or a Secret with the environment variables. To do so, use the `extraEnvVarsCM` or the `extraEnvVarsSecret` values.

### Sidecars

If additional containers are needed in the same pod as jaeger (such as additional metrics or logging exporters), they can be defined using the `sidecars` parameter inside each of the subsections: `collector`, `agent`, `query` . If these sidecars export extra ports, extra port definitions can be added using the `service.extraPorts` parameter. [Learn more about configuring and using sidecar containers](https://docs.bitnami.com/kubernetes/infrastructure/jaeger/configuration/configure-sidecar-init-containers/).

### Pod affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, use one of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters inside each of the subsections: `distributor`, `compactor`, `ingester`, `querier`, `queryFrontend` and `vulture`.

### External database support

You may want to have Jaeger connect to an external database rather than installing one inside your cluster. Typical reasons for this are to use a managed database service, or to share a common database server for all your applications. To achieve this, the chart allows you to specify credentials for an external database with the [`externalDatabase` parameter](#parameters). You should also disable the Cassandra installation with the `cassandra.enabled` option. Here is an example:

```console
cassandra.enabled=false
externalDatabase.host=myexternalhost
externalDatabase.port=9042
```

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

## Upgrading

### To 1.0.0

This major updates the Cassandra subchart to its newest major, 10.0.0. [Here](https://github.com/bitnami/charts/pull/14076) you can find more information about the changes introduced in that version.

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