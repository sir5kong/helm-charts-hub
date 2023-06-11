<!--- app-name: Grafana Tempo -->

# Grafana Tempo packaged by Bitnami

Grafana Tempo is a distributed tracing system that has out-of-the-box integration with Grafana. It is highly scalable and works with many popular tracing protocols.

[Overview of Grafana Tempo](https://github.com/grafana/tempo)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/grafana-tempo
```

## Introduction

Bitnami charts for Helm are carefully engineered, actively maintained and are the quickest and easiest way to deploy containers on a Kubernetes cluster that are ready to handle production workloads.

This chart bootstraps a [Grafana Tempo](https://github.com/grafana/tempo) Deployment in a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

[Learn more about the default configuration of the chart](https://docs.bitnami.com/kubernetes/infrastructure/grafana-tempo/get-started/).

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/grafana-tempo
```

The command deploys grafana-tempo on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

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

| Name                     | Description                                                                             | Value           |
| ------------------------ | --------------------------------------------------------------------------------------- | --------------- |
| `kubeVersion`            | Override Kubernetes version                                                             | `""`            |
| `nameOverride`           | String to partially override common.names.fullname                                      | `""`            |
| `fullnameOverride`       | String to fully override common.names.fullname                                          | `""`            |
| `commonLabels`           | Labels to add to all deployed objects                                                   | `{}`            |
| `commonAnnotations`      | Annotations to add to all deployed objects                                              | `{}`            |
| `clusterDomain`          | Kubernetes cluster domain name                                                          | `cluster.local` |
| `extraDeploy`            | Array of extra objects to deploy with the release                                       | `[]`            |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden) | `false`         |
| `diagnosticMode.command` | Command to override all containers in the deployments/statefulsets                      | `["sleep"]`     |
| `diagnosticMode.args`    | Args to override all containers in the deployments/statefulsets                         | `["infinity"]`  |

### Common Grafana Tempo Parameters

| Name                                   | Description                                                                                                   | Value                         |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------- | ----------------------------- |
| `tempo.image.registry`                 | Grafana Tempo image registry                                                                                  | `docker.io`                   |
| `tempo.image.repository`               | Grafana Tempo image repository                                                                                | `bitnami/grafana-tempo`       |
| `tempo.image.tag`                      | Grafana Tempo image tag (immutable tags are recommended)                                                      | `2.1.1-debian-11-r9`          |
| `tempo.image.digest`                   | Grafana Tempo image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                          |
| `tempo.image.pullPolicy`               | Grafana Tempo image pull policy                                                                               | `IfNotPresent`                |
| `tempo.image.pullSecrets`              | Grafana Tempo image pull secrets                                                                              | `[]`                          |
| `tempo.memBallastSizeMbs`              | Tempo components memory ballast size in MB                                                                    | `1024`                        |
| `tempo.dataDir`                        | Tempo components data directory                                                                               | `/bitnami/grafana-tempo/data` |
| `tempo.traces.jaeger.grpc`             | Enable Tempo to ingest Jaeger GRPC traces                                                                     | `true`                        |
| `tempo.traces.jaeger.thriftBinary`     | Enable Tempo to ingest Jaeger Thrift Binary traces                                                            | `false`                       |
| `tempo.traces.jaeger.thriftCompact`    | Enable Tempo to ingest Jaeger Thrift Compact traces                                                           | `false`                       |
| `tempo.traces.jaeger.thriftHttp`       | Enable Tempo to ingest Jaeger Thrift HTTP traces                                                              | `true`                        |
| `tempo.traces.otlp.http`               | Enable Tempo to ingest Open Telemetry HTTP traces                                                             | `false`                       |
| `tempo.traces.otlp.grpc`               | Enable Tempo to ingest Open Telemetry GRPC traces                                                             | `false`                       |
| `tempo.traces.opencensus`              | Enable Tempo to ingest Open Census traces                                                                     | `false`                       |
| `tempo.traces.zipkin`                  | Enable Tempo to ingest Zipkin traces                                                                          | `false`                       |
| `tempo.configuration`                  | Tempo components configuration                                                                                | `""`                          |
| `tempo.existingConfigmap`              | Name of a ConfigMap with the Tempo configuration                                                              | `""`                          |
| `tempo.overridesConfiguration`         | Tempo components overrides configuration settings                                                             | `""`                          |
| `tempo.existingOverridesConfigmap`     | Name of a ConfigMap with the tempo overrides configuration                                                    | `""`                          |
| `tempo.containerPorts.web`             | Tempo components web container port                                                                           | `3200`                        |
| `tempo.containerPorts.grpc`            | Tempo components GRPC container port                                                                          | `9095`                        |
| `tempo.containerPorts.gossipRing`      | Tempo components Gossip Ring container port                                                                   | `7946`                        |
| `tempo.gossipRing.service.ports.http`  | Gossip Ring HTTP headless service port                                                                        | `7946`                        |
| `tempo.gossipRing.service.annotations` | Additional custom annotations for Gossip Ring headless service                                                | `{}`                          |

### Compactor Deployment Parameters

| Name                                              | Description                                                                                         | Value           |
| ------------------------------------------------- | --------------------------------------------------------------------------------------------------- | --------------- |
| `compactor.enabled`                               | Enable Compactor deployment                                                                         | `true`          |
| `compactor.extraEnvVars`                          | Array with extra environment variables to add to compactor nodes                                    | `[]`            |
| `compactor.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for compactor nodes                            | `""`            |
| `compactor.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for compactor nodes                               | `""`            |
| `compactor.command`                               | Override default container command (useful when using custom images)                                | `[]`            |
| `compactor.args`                                  | Override default container args (useful when using custom images)                                   | `[]`            |
| `compactor.replicaCount`                          | Number of Compactor replicas to deploy                                                              | `1`             |
| `compactor.livenessProbe.enabled`                 | Enable livenessProbe on Compactor nodes                                                             | `true`          |
| `compactor.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                             | `80`            |
| `compactor.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                    | `10`            |
| `compactor.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                   | `1`             |
| `compactor.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                 | `3`             |
| `compactor.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                 | `1`             |
| `compactor.readinessProbe.enabled`                | Enable readinessProbe on Compactor nodes                                                            | `true`          |
| `compactor.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                            | `80`            |
| `compactor.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                   | `10`            |
| `compactor.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                  | `1`             |
| `compactor.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                | `3`             |
| `compactor.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                | `1`             |
| `compactor.startupProbe.enabled`                  | Enable startupProbe on Compactor containers                                                         | `false`         |
| `compactor.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                              | `30`            |
| `compactor.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                     | `10`            |
| `compactor.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                    | `1`             |
| `compactor.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                  | `15`            |
| `compactor.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                  | `1`             |
| `compactor.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                 | `{}`            |
| `compactor.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                | `{}`            |
| `compactor.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                  | `{}`            |
| `compactor.resources.limits`                      | The resources limits for the compactor containers                                                   | `{}`            |
| `compactor.resources.requests`                    | The requested resources for the compactor containers                                                | `{}`            |
| `compactor.podSecurityContext.enabled`            | Enabled Compactor pods' Security Context                                                            | `true`          |
| `compactor.podSecurityContext.fsGroup`            | Set Compactor pod's Security Context fsGroup                                                        | `1001`          |
| `compactor.containerSecurityContext.enabled`      | Enabled Compactor containers' Security Context                                                      | `true`          |
| `compactor.containerSecurityContext.runAsUser`    | Set Compactor containers' Security Context runAsUser                                                | `1001`          |
| `compactor.containerSecurityContext.runAsNonRoot` | Set Compactor containers' Security Context runAsNonRoot                                             | `true`          |
| `compactor.lifecycleHooks`                        | for the compactor container(s) to automate configuration before or after startup                    | `{}`            |
| `compactor.hostAliases`                           | compactor pods host aliases                                                                         | `[]`            |
| `compactor.podLabels`                             | Extra labels for compactor pods                                                                     | `{}`            |
| `compactor.podAnnotations`                        | Annotations for compactor pods                                                                      | `{}`            |
| `compactor.podAffinityPreset`                     | Pod affinity preset. Ignored if `compactor.affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `compactor.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `compactor.affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `compactor.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `compactor.affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `compactor.nodeAffinityPreset.key`                | Node label key to match. Ignored if `compactor.affinity` is set                                     | `""`            |
| `compactor.nodeAffinityPreset.values`             | Node label values to match. Ignored if `compactor.affinity` is set                                  | `[]`            |
| `compactor.affinity`                              | Affinity for Compactor pods assignment                                                              | `{}`            |
| `compactor.nodeSelector`                          | Node labels for Compactor pods assignment                                                           | `{}`            |
| `compactor.tolerations`                           | Tolerations for Compactor pods assignment                                                           | `[]`            |
| `compactor.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains     | `[]`            |
| `compactor.priorityClassName`                     | Compactor pods' priorityClassName                                                                   | `""`            |
| `compactor.schedulerName`                         | Kubernetes pod scheduler registry                                                                   | `""`            |
| `compactor.updateStrategy.type`                   | Compactor statefulset strategy type                                                                 | `RollingUpdate` |
| `compactor.updateStrategy.rollingUpdate`          | Compactor statefulset rolling update configuration parameters                                       | `{}`            |
| `compactor.extraVolumes`                          | Optionally specify extra list of additional volumes for the Compactor pod(s)                        | `[]`            |
| `compactor.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Compactor container(s)             | `[]`            |
| `compactor.sidecars`                              | Add additional sidecar containers to the Compactor pod(s)                                           | `[]`            |
| `compactor.initContainers`                        | Add additional init containers to the Compactor pod(s)                                              | `[]`            |

### Compactor Traffic Exposure Parameters

| Name                                         | Description                                                      | Value       |
| -------------------------------------------- | ---------------------------------------------------------------- | ----------- |
| `compactor.service.type`                     | Compactor service type                                           | `ClusterIP` |
| `compactor.service.ports.http`               | Compactor HTTP service port                                      | `3200`      |
| `compactor.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `compactor.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `compactor.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `compactor.service.clusterIP`                | Compactor service Cluster IP                                     | `""`        |
| `compactor.service.loadBalancerIP`           | Compactor service Load Balancer IP                               | `""`        |
| `compactor.service.loadBalancerSourceRanges` | Compactor service Load Balancer sources                          | `[]`        |
| `compactor.service.externalTrafficPolicy`    | Compactor service external traffic policy                        | `Cluster`   |
| `compactor.service.annotations`              | Additional custom annotations for Compactor service              | `{}`        |
| `compactor.service.extraPorts`               | Extra ports to expose in the Compactor service                   | `[]`        |

### Distributor Deployment Parameters

| Name                                                | Description                                                                                           | Value           |
| --------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | --------------- |
| `distributor.extraEnvVars`                          | Array with extra environment variables to add to distributor nodes                                    | `[]`            |
| `distributor.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for distributor nodes                            | `""`            |
| `distributor.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for distributor nodes                               | `""`            |
| `distributor.command`                               | Override default container command (useful when using custom images)                                  | `[]`            |
| `distributor.args`                                  | Override default container args (useful when using custom images)                                     | `[]`            |
| `distributor.replicaCount`                          | Number of Distributor replicas to deploy                                                              | `1`             |
| `distributor.livenessProbe.enabled`                 | Enable livenessProbe on Distributor nodes                                                             | `true`          |
| `distributor.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                               | `10`            |
| `distributor.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                      | `10`            |
| `distributor.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                     | `1`             |
| `distributor.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                   | `3`             |
| `distributor.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                   | `1`             |
| `distributor.readinessProbe.enabled`                | Enable readinessProbe on Distributor nodes                                                            | `true`          |
| `distributor.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                              | `10`            |
| `distributor.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                     | `10`            |
| `distributor.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                    | `1`             |
| `distributor.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                  | `3`             |
| `distributor.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                  | `1`             |
| `distributor.startupProbe.enabled`                  | Enable startupProbe on Distributor containers                                                         | `false`         |
| `distributor.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                | `30`            |
| `distributor.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                       | `10`            |
| `distributor.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                      | `1`             |
| `distributor.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                    | `15`            |
| `distributor.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                    | `1`             |
| `distributor.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                   | `{}`            |
| `distributor.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                  | `{}`            |
| `distributor.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                    | `{}`            |
| `distributor.resources.limits`                      | The resources limits for the distributor containers                                                   | `{}`            |
| `distributor.resources.requests`                    | The requested resources for the distributor containers                                                | `{}`            |
| `distributor.podSecurityContext.enabled`            | Enabled Distributor pods' Security Context                                                            | `true`          |
| `distributor.podSecurityContext.fsGroup`            | Set Distributor pod's Security Context fsGroup                                                        | `1001`          |
| `distributor.containerSecurityContext.enabled`      | Enabled Distributor containers' Security Context                                                      | `true`          |
| `distributor.containerSecurityContext.runAsUser`    | Set Distributor containers' Security Context runAsUser                                                | `1001`          |
| `distributor.containerSecurityContext.runAsNonRoot` | Set Distributor containers' Security Context runAsNonRoot                                             | `true`          |
| `distributor.lifecycleHooks`                        | for the distributor container(s) to automate configuration before or after startup                    | `{}`            |
| `distributor.hostAliases`                           | distributor pods host aliases                                                                         | `[]`            |
| `distributor.podLabels`                             | Extra labels for distributor pods                                                                     | `{}`            |
| `distributor.podAnnotations`                        | Annotations for distributor pods                                                                      | `{}`            |
| `distributor.podAffinityPreset`                     | Pod affinity preset. Ignored if `distributor.affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `distributor.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `distributor.affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `distributor.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `distributor.affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `distributor.nodeAffinityPreset.key`                | Node label key to match. Ignored if `distributor.affinity` is set                                     | `""`            |
| `distributor.nodeAffinityPreset.values`             | Node label values to match. Ignored if `distributor.affinity` is set                                  | `[]`            |
| `distributor.affinity`                              | Affinity for Distributor pods assignment                                                              | `{}`            |
| `distributor.nodeSelector`                          | Node labels for Distributor pods assignment                                                           | `{}`            |
| `distributor.tolerations`                           | Tolerations for Distributor pods assignment                                                           | `[]`            |
| `distributor.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains       | `[]`            |
| `distributor.priorityClassName`                     | Distributor pods' priorityClassName                                                                   | `""`            |
| `distributor.schedulerName`                         | Kubernetes pod scheduler registry                                                                     | `""`            |
| `distributor.updateStrategy.type`                   | Distributor statefulset strategy type                                                                 | `RollingUpdate` |
| `distributor.updateStrategy.rollingUpdate`          | Distributor statefulset rolling update configuration parameters                                       | `{}`            |
| `distributor.extraVolumes`                          | Optionally specify extra list of additional volumes for the Distributor pod(s)                        | `[]`            |
| `distributor.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Distributor container(s)             | `[]`            |
| `distributor.sidecars`                              | Add additional sidecar containers to the Distributor pod(s)                                           | `[]`            |
| `distributor.initContainers`                        | Add additional init containers to the Distributor pod(s)                                              | `[]`            |

### Distributor Traffic Exposure Parameters

| Name                                           | Description                                                      | Value       |
| ---------------------------------------------- | ---------------------------------------------------------------- | ----------- |
| `distributor.service.type`                     | Distributor service type                                         | `ClusterIP` |
| `distributor.service.ports.http`               | Distributor HTTP service port                                    | `3200`      |
| `distributor.service.ports.grpc`               | Distributor GRPC service port                                    | `9095`      |
| `distributor.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `distributor.service.nodePorts.grpc`           | Node port for GRPC                                               | `""`        |
| `distributor.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `distributor.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `distributor.service.clusterIP`                | Distributor service Cluster IP                                   | `""`        |
| `distributor.service.loadBalancerIP`           | Distributor service Load Balancer IP                             | `""`        |
| `distributor.service.loadBalancerSourceRanges` | Distributor service Load Balancer sources                        | `[]`        |
| `distributor.service.externalTrafficPolicy`    | Distributor service external traffic policy                      | `Cluster`   |
| `distributor.service.annotations`              | Additional custom annotations for Distributor service            | `{}`        |
| `distributor.service.extraPorts`               | Extra ports to expose in the Distributor service                 | `[]`        |

### Metrics Generator Deployment Parameters

| Name                                                     | Description                                                                                                | Value           |
| -------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | --------------- |
| `metricsGenerator.remoteWrite`                           | remoteWrite configuration for metricsGenerator                                                             | `[]`            |
| `metricsGenerator.extraEnvVars`                          | Array with extra environment variables to add to metricsGenerator nodes                                    | `[]`            |
| `metricsGenerator.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for metricsGenerator nodes                            | `""`            |
| `metricsGenerator.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for metricsGenerator nodes                               | `""`            |
| `metricsGenerator.command`                               | Override default container command (useful when using custom images)                                       | `[]`            |
| `metricsGenerator.args`                                  | Override default container args (useful when using custom images)                                          | `[]`            |
| `metricsGenerator.replicaCount`                          | Number of metricsGenerator replicas to deploy                                                              | `1`             |
| `metricsGenerator.livenessProbe.enabled`                 | Enable livenessProbe on metricsGenerator nodes                                                             | `true`          |
| `metricsGenerator.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                    | `10`            |
| `metricsGenerator.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                           | `10`            |
| `metricsGenerator.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                          | `1`             |
| `metricsGenerator.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                        | `3`             |
| `metricsGenerator.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                        | `1`             |
| `metricsGenerator.readinessProbe.enabled`                | Enable readinessProbe on metricsGenerator nodes                                                            | `true`          |
| `metricsGenerator.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                   | `10`            |
| `metricsGenerator.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                          | `10`            |
| `metricsGenerator.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                         | `1`             |
| `metricsGenerator.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                       | `3`             |
| `metricsGenerator.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                       | `1`             |
| `metricsGenerator.startupProbe.enabled`                  | Enable startupProbe on metricsGenerator containers                                                         | `false`         |
| `metricsGenerator.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                     | `30`            |
| `metricsGenerator.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                            | `10`            |
| `metricsGenerator.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                           | `1`             |
| `metricsGenerator.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                         | `15`            |
| `metricsGenerator.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                         | `1`             |
| `metricsGenerator.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                        | `{}`            |
| `metricsGenerator.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                       | `{}`            |
| `metricsGenerator.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                         | `{}`            |
| `metricsGenerator.resources.limits`                      | The resources limits for the metricsGenerator containers                                                   | `{}`            |
| `metricsGenerator.resources.requests`                    | The requested resources for the metricsGenerator containers                                                | `{}`            |
| `metricsGenerator.podSecurityContext.enabled`            | Enabled metricsGenerator pods' Security Context                                                            | `true`          |
| `metricsGenerator.podSecurityContext.fsGroup`            | Set metricsGenerator pod's Security Context fsGroup                                                        | `1001`          |
| `metricsGenerator.containerSecurityContext.enabled`      | Enabled metricsGenerator containers' Security Context                                                      | `true`          |
| `metricsGenerator.containerSecurityContext.runAsUser`    | Set metricsGenerator containers' Security Context runAsUser                                                | `1001`          |
| `metricsGenerator.containerSecurityContext.runAsNonRoot` | Set metricsGenerator containers' Security Context runAsNonRoot                                             | `true`          |
| `metricsGenerator.lifecycleHooks`                        | for the metricsGenerator container(s) to automate configuration before or after startup                    | `{}`            |
| `metricsGenerator.hostAliases`                           | metricsGenerator pods host aliases                                                                         | `[]`            |
| `metricsGenerator.podLabels`                             | Extra labels for metricsGenerator pods                                                                     | `{}`            |
| `metricsGenerator.podAnnotations`                        | Annotations for metricsGenerator pods                                                                      | `{}`            |
| `metricsGenerator.podAffinityPreset`                     | Pod affinity preset. Ignored if `metricsGenerator.affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `metricsGenerator.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `metricsGenerator.affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `metricsGenerator.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `metricsGenerator.affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `metricsGenerator.nodeAffinityPreset.key`                | Node label key to match. Ignored if `metricsGenerator.affinity` is set                                     | `""`            |
| `metricsGenerator.nodeAffinityPreset.values`             | Node label values to match. Ignored if `metricsGenerator.affinity` is set                                  | `[]`            |
| `metricsGenerator.affinity`                              | Affinity for metricsGenerator pods assignment                                                              | `{}`            |
| `metricsGenerator.nodeSelector`                          | Node labels for metricsGenerator pods assignment                                                           | `{}`            |
| `metricsGenerator.tolerations`                           | Tolerations for metricsGenerator pods assignment                                                           | `[]`            |
| `metricsGenerator.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains            | `{}`            |
| `metricsGenerator.priorityClassName`                     | metricsGenerator pods' priorityClassName                                                                   | `""`            |
| `metricsGenerator.schedulerName`                         | Kubernetes pod scheduler registry                                                                          | `""`            |
| `metricsGenerator.updateStrategy.type`                   | metricsGenerator statefulset strategy type                                                                 | `RollingUpdate` |
| `metricsGenerator.updateStrategy.rollingUpdate`          | metricsGenerator statefulset rolling update configuration parameters                                       | `{}`            |
| `metricsGenerator.extraVolumes`                          | Optionally specify extra list of additional volumes for the metricsGenerator pod(s)                        | `[]`            |
| `metricsGenerator.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the metricsGenerator container(s)             | `[]`            |
| `metricsGenerator.sidecars`                              | Add additional sidecar containers to the metricsGenerator pod(s)                                           | `[]`            |
| `metricsGenerator.initContainers`                        | Add additional init containers to the metricsGenerator pod(s)                                              | `[]`            |

### Metrics Generator Traffic Exposure Parameters

| Name                                                | Description                                                      | Value       |
| --------------------------------------------------- | ---------------------------------------------------------------- | ----------- |
| `metricsGenerator.service.type`                     | metricsGenerator service type                                    | `ClusterIP` |
| `metricsGenerator.service.ports.http`               | metricsGenerator HTTP service port                               | `3200`      |
| `metricsGenerator.service.ports.grpc`               | metricsGenerator GRPC service port                               | `9095`      |
| `metricsGenerator.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `metricsGenerator.service.nodePorts.grpc`           | Node port for GRPC                                               | `""`        |
| `metricsGenerator.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `metricsGenerator.service.clusterIP`                | metricsGenerator service Cluster IP                              | `""`        |
| `metricsGenerator.service.loadBalancerIP`           | metricsGenerator service Load Balancer IP                        | `""`        |
| `metricsGenerator.service.loadBalancerSourceRanges` | metricsGenerator service Load Balancer sources                   | `[]`        |
| `metricsGenerator.service.externalTrafficPolicy`    | metricsGenerator service external traffic policy                 | `Cluster`   |
| `metricsGenerator.service.annotations`              | Additional custom annotations for metricsGenerator service       | `{}`        |
| `metricsGenerator.service.extraPorts`               | Extra ports to expose in the metricsGenerator service            | `[]`        |

### Ingester Deployment Parameters

| Name                                             | Description                                                                                        | Value           |
| ------------------------------------------------ | -------------------------------------------------------------------------------------------------- | --------------- |
| `ingester.extraEnvVars`                          | Array with extra environment variables to add to ingester nodes                                    | `[]`            |
| `ingester.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for ingester nodes                            | `""`            |
| `ingester.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for ingester nodes                               | `""`            |
| `ingester.command`                               | Override default container command (useful when using custom images)                               | `[]`            |
| `ingester.args`                                  | Override default container args (useful when using custom images)                                  | `[]`            |
| `ingester.replicaCount`                          | Number of Ingester replicas to deploy                                                              | `1`             |
| `ingester.livenessProbe.enabled`                 | Enable livenessProbe on Ingester nodes                                                             | `true`          |
| `ingester.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                            | `10`            |
| `ingester.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                   | `10`            |
| `ingester.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                  | `1`             |
| `ingester.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                | `3`             |
| `ingester.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                | `1`             |
| `ingester.readinessProbe.enabled`                | Enable readinessProbe on Ingester nodes                                                            | `true`          |
| `ingester.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                           | `10`            |
| `ingester.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                  | `10`            |
| `ingester.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                 | `1`             |
| `ingester.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                               | `3`             |
| `ingester.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                               | `1`             |
| `ingester.startupProbe.enabled`                  | Enable startupProbe on Ingester containers                                                         | `false`         |
| `ingester.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                             | `30`            |
| `ingester.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                    | `10`            |
| `ingester.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                   | `1`             |
| `ingester.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                 | `15`            |
| `ingester.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                 | `1`             |
| `ingester.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                | `{}`            |
| `ingester.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                               | `{}`            |
| `ingester.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                 | `{}`            |
| `ingester.lifecycleHooks`                        | for the ingester container(s) to automate configuration before or after startup                    | `{}`            |
| `ingester.resources.limits`                      | The resources limits for the Ingester containers                                                   | `{}`            |
| `ingester.resources.requests`                    | The requested resources for the Ingester containers                                                | `{}`            |
| `ingester.podSecurityContext.enabled`            | Enabled Ingester pods' Security Context                                                            | `true`          |
| `ingester.podSecurityContext.fsGroup`            | Set Ingester pod's Security Context fsGroup                                                        | `1001`          |
| `ingester.containerSecurityContext.enabled`      | Enabled Ingester containers' Security Context                                                      | `true`          |
| `ingester.containerSecurityContext.runAsUser`    | Set Ingester containers' Security Context runAsUser                                                | `1001`          |
| `ingester.containerSecurityContext.runAsNonRoot` | Set Ingester containers' Security Context runAsNonRoot                                             | `true`          |
| `ingester.hostAliases`                           | ingester pods host aliases                                                                         | `[]`            |
| `ingester.podLabels`                             | Extra labels for ingester pods                                                                     | `{}`            |
| `ingester.podAnnotations`                        | Annotations for ingester pods                                                                      | `{}`            |
| `ingester.podAffinityPreset`                     | Pod affinity preset. Ignored if `ingester.affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `ingester.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `ingester.affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `ingester.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `ingester.affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `ingester.nodeAffinityPreset.key`                | Node label key to match. Ignored if `ingester.affinity` is set                                     | `""`            |
| `ingester.nodeAffinityPreset.values`             | Node label values to match. Ignored if `ingester.affinity` is set                                  | `[]`            |
| `ingester.affinity`                              | Affinity for ingester pods assignment                                                              | `{}`            |
| `ingester.nodeSelector`                          | Node labels for Ingester pods assignment                                                           | `{}`            |
| `ingester.tolerations`                           | Tolerations for Ingester pods assignment                                                           | `[]`            |
| `ingester.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains    | `[]`            |
| `ingester.priorityClassName`                     | Ingester pods' priorityClassName                                                                   | `""`            |
| `ingester.schedulerName`                         | Kubernetes pod scheduler registry                                                                  | `""`            |
| `ingester.updateStrategy.type`                   | Ingester statefulset strategy type                                                                 | `RollingUpdate` |
| `ingester.updateStrategy.rollingUpdate`          | Ingester statefulset rolling update configuration parameters                                       | `{}`            |
| `ingester.extraVolumes`                          | Optionally specify extra list of additional volumes for the Ingester pod(s)                        | `[]`            |
| `ingester.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the ingester container(s)             | `[]`            |
| `ingester.sidecars`                              | Add additional sidecar containers to the Ingester pod(s)                                           | `[]`            |
| `ingester.initContainers`                        | Add additional init containers to the Ingester pod(s)                                              | `[]`            |

### Ingester Persistence Parameters

| Name                                 | Description                                                             | Value               |
| ------------------------------------ | ----------------------------------------------------------------------- | ------------------- |
| `ingester.persistence.enabled`       | Enable persistence in Ingester instances                                | `true`              |
| `ingester.persistence.existingClaim` | Name of an existing PVC to use                                          | `""`                |
| `ingester.persistence.storageClass`  | PVC Storage Class for Memcached data volume                             | `""`                |
| `ingester.persistence.subPath`       | The subdirectory of the volume to mount to                              | `""`                |
| `ingester.persistence.accessModes`   | PVC Access modes                                                        | `["ReadWriteOnce"]` |
| `ingester.persistence.size`          | PVC Storage Request for Memcached data volume                           | `8Gi`               |
| `ingester.persistence.annotations`   | Additional PVC annotations                                              | `{}`                |
| `ingester.persistence.selector`      | Selector to match an existing Persistent Volume for Ingester's data PVC | `{}`                |

### Ingester Traffic Exposure Parameters

| Name                                        | Description                                                      | Value       |
| ------------------------------------------- | ---------------------------------------------------------------- | ----------- |
| `ingester.service.type`                     | Ingester service type                                            | `ClusterIP` |
| `ingester.service.ports.http`               | Ingester HTTP service port                                       | `3200`      |
| `ingester.service.ports.grpc`               | Ingester GRPC service port                                       | `9095`      |
| `ingester.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `ingester.service.nodePorts.grpc`           | Node port for GRPC                                               | `""`        |
| `ingester.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `ingester.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `ingester.service.clusterIP`                | Ingester service Cluster IP                                      | `""`        |
| `ingester.service.loadBalancerIP`           | Ingester service Load Balancer IP                                | `""`        |
| `ingester.service.loadBalancerSourceRanges` | Ingester service Load Balancer sources                           | `[]`        |
| `ingester.service.externalTrafficPolicy`    | Ingester service external traffic policy                         | `Cluster`   |
| `ingester.service.annotations`              | Additional custom annotations for Ingester service               | `{}`        |
| `ingester.service.extraPorts`               | Extra ports to expose in the Ingester service                    | `[]`        |

### Querier Deployment Parameters

| Name                                            | Description                                                                                       | Value           |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------- | --------------- |
| `querier.replicaCount`                          | Number of Querier replicas to deploy                                                              | `1`             |
| `querier.extraEnvVars`                          | Array with extra environment variables to add to Querier nodes                                    | `[]`            |
| `querier.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for Querier nodes                            | `""`            |
| `querier.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for Querier nodes                               | `""`            |
| `querier.command`                               | Override default container command (useful when using custom images)                              | `[]`            |
| `querier.args`                                  | Override default container args (useful when using custom images)                                 | `[]`            |
| `querier.livenessProbe.enabled`                 | Enable livenessProbe on Querier nodes                                                             | `true`          |
| `querier.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                           | `10`            |
| `querier.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                  | `10`            |
| `querier.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                 | `1`             |
| `querier.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                               | `3`             |
| `querier.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                               | `1`             |
| `querier.readinessProbe.enabled`                | Enable readinessProbe on Querier nodes                                                            | `true`          |
| `querier.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                          | `10`            |
| `querier.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                 | `10`            |
| `querier.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                | `1`             |
| `querier.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                              | `3`             |
| `querier.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                              | `1`             |
| `querier.startupProbe.enabled`                  | Enable startupProbe on Querier containers                                                         | `false`         |
| `querier.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                            | `30`            |
| `querier.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                   | `10`            |
| `querier.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                  | `1`             |
| `querier.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                | `15`            |
| `querier.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                | `1`             |
| `querier.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                               | `{}`            |
| `querier.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                              | `{}`            |
| `querier.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                | `{}`            |
| `querier.resources.limits`                      | The resources limits for the Querier containers                                                   | `{}`            |
| `querier.resources.requests`                    | The requested resources for the Querier containers                                                | `{}`            |
| `querier.podSecurityContext.enabled`            | Enabled Querier pods' Security Context                                                            | `true`          |
| `querier.podSecurityContext.fsGroup`            | Set Querier pod's Security Context fsGroup                                                        | `1001`          |
| `querier.containerSecurityContext.enabled`      | Enabled Querier containers' Security Context                                                      | `true`          |
| `querier.containerSecurityContext.runAsUser`    | Set Querier containers' Security Context runAsUser                                                | `1001`          |
| `querier.containerSecurityContext.runAsNonRoot` | Set Querier containers' Security Context runAsNonRoot                                             | `true`          |
| `querier.lifecycleHooks`                        | for the Querier container(s) to automate configuration before or after startup                    | `{}`            |
| `querier.hostAliases`                           | querier pods host aliases                                                                         | `[]`            |
| `querier.podLabels`                             | Extra labels for querier pods                                                                     | `{}`            |
| `querier.podAnnotations`                        | Annotations for querier pods                                                                      | `{}`            |
| `querier.podAffinityPreset`                     | Pod affinity preset. Ignored if `querier.affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `querier.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `querier.affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `querier.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `querier.affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `querier.nodeAffinityPreset.key`                | Node label key to match. Ignored if `querier.affinity` is set                                     | `""`            |
| `querier.nodeAffinityPreset.values`             | Node label values to match. Ignored if `querier.affinity` is set                                  | `[]`            |
| `querier.affinity`                              | Affinity for Querier pods assignment                                                              | `{}`            |
| `querier.nodeSelector`                          | Node labels for Querier pods assignment                                                           | `{}`            |
| `querier.tolerations`                           | Tolerations for Querier pods assignment                                                           | `[]`            |
| `querier.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains   | `[]`            |
| `querier.priorityClassName`                     | Querier pods' priorityClassName                                                                   | `""`            |
| `querier.schedulerName`                         | Kubernetes pod scheduler registry                                                                 | `""`            |
| `querier.updateStrategy.type`                   | Querier statefulset strategy type                                                                 | `RollingUpdate` |
| `querier.updateStrategy.rollingUpdate`          | Querier statefulset rolling update configuration parameters                                       | `{}`            |
| `querier.extraVolumes`                          | Optionally specify extra list of additional volumes for the Querier pod(s)                        | `[]`            |
| `querier.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the querier container(s)             | `[]`            |
| `querier.sidecars`                              | Add additional sidecar containers to the Querier pod(s)                                           | `[]`            |
| `querier.initContainers`                        | Add additional init containers to the Querier pod(s)                                              | `[]`            |

### Querier Traffic Exposure Parameters

| Name                                       | Description                                                      | Value       |
| ------------------------------------------ | ---------------------------------------------------------------- | ----------- |
| `querier.service.type`                     | Querier service type                                             | `ClusterIP` |
| `querier.service.ports.http`               | Querier HTTP service port                                        | `3200`      |
| `querier.service.ports.grpc`               | Querier GRPC service port                                        | `9095`      |
| `querier.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `querier.service.nodePorts.grpc`           | Node port for GRPC                                               | `""`        |
| `querier.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `querier.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `querier.service.clusterIP`                | Querier service Cluster IP                                       | `""`        |
| `querier.service.loadBalancerIP`           | Querier service Load Balancer IP                                 | `""`        |
| `querier.service.loadBalancerSourceRanges` | Querier service Load Balancer sources                            | `[]`        |
| `querier.service.externalTrafficPolicy`    | Querier service external traffic policy                          | `Cluster`   |
| `querier.service.annotations`              | Additional custom annotations for Querier service                | `{}`        |
| `querier.service.extraPorts`               | Extra ports to expose in the Querier service                     | `[]`        |

### Query Frontend Deployment Parameters

| Name                                                        | Description                                                                                                         | Value                         |
| ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ----------------------------- |
| `queryFrontend.extraEnvVars`                                | Array with extra environment variables to add to queryFrontend nodes                                                | `[]`                          |
| `queryFrontend.extraEnvVarsCM`                              | Name of existing ConfigMap containing extra env vars for queryFrontend nodes                                        | `""`                          |
| `queryFrontend.extraEnvVarsSecret`                          | Name of existing Secret containing extra env vars for queryFrontend nodes                                           | `""`                          |
| `queryFrontend.command`                                     | Override default container command (useful when using custom images)                                                | `[]`                          |
| `queryFrontend.args`                                        | Override default container args (useful when using custom images)                                                   | `[]`                          |
| `queryFrontend.replicaCount`                                | Number of queryFrontend replicas to deploy                                                                          | `1`                           |
| `queryFrontend.livenessProbe.enabled`                       | Enable livenessProbe on queryFrontend nodes                                                                         | `true`                        |
| `queryFrontend.livenessProbe.initialDelaySeconds`           | Initial delay seconds for livenessProbe                                                                             | `10`                          |
| `queryFrontend.livenessProbe.periodSeconds`                 | Period seconds for livenessProbe                                                                                    | `10`                          |
| `queryFrontend.livenessProbe.timeoutSeconds`                | Timeout seconds for livenessProbe                                                                                   | `1`                           |
| `queryFrontend.livenessProbe.failureThreshold`              | Failure threshold for livenessProbe                                                                                 | `3`                           |
| `queryFrontend.livenessProbe.successThreshold`              | Success threshold for livenessProbe                                                                                 | `1`                           |
| `queryFrontend.readinessProbe.enabled`                      | Enable readinessProbe on queryFrontend nodes                                                                        | `true`                        |
| `queryFrontend.readinessProbe.initialDelaySeconds`          | Initial delay seconds for readinessProbe                                                                            | `10`                          |
| `queryFrontend.readinessProbe.periodSeconds`                | Period seconds for readinessProbe                                                                                   | `10`                          |
| `queryFrontend.readinessProbe.timeoutSeconds`               | Timeout seconds for readinessProbe                                                                                  | `1`                           |
| `queryFrontend.readinessProbe.failureThreshold`             | Failure threshold for readinessProbe                                                                                | `3`                           |
| `queryFrontend.readinessProbe.successThreshold`             | Success threshold for readinessProbe                                                                                | `1`                           |
| `queryFrontend.startupProbe.enabled`                        | Enable startupProbe on queryFrontend containers                                                                     | `false`                       |
| `queryFrontend.startupProbe.initialDelaySeconds`            | Initial delay seconds for startupProbe                                                                              | `30`                          |
| `queryFrontend.startupProbe.periodSeconds`                  | Period seconds for startupProbe                                                                                     | `10`                          |
| `queryFrontend.startupProbe.timeoutSeconds`                 | Timeout seconds for startupProbe                                                                                    | `1`                           |
| `queryFrontend.startupProbe.failureThreshold`               | Failure threshold for startupProbe                                                                                  | `15`                          |
| `queryFrontend.startupProbe.successThreshold`               | Success threshold for startupProbe                                                                                  | `1`                           |
| `queryFrontend.customLivenessProbe`                         | Custom livenessProbe that overrides the default one                                                                 | `{}`                          |
| `queryFrontend.customReadinessProbe`                        | Custom readinessProbe that overrides the default one                                                                | `{}`                          |
| `queryFrontend.customStartupProbe`                          | Custom startupProbe that overrides the default one                                                                  | `{}`                          |
| `queryFrontend.resources.limits`                            | The resources limits for the queryFrontend containers                                                               | `{}`                          |
| `queryFrontend.resources.requests`                          | The requested resources for the queryFrontend containers                                                            | `{}`                          |
| `queryFrontend.podSecurityContext.enabled`                  | Enabled queryFrontend pods' Security Context                                                                        | `true`                        |
| `queryFrontend.podSecurityContext.fsGroup`                  | Set queryFrontend pod's Security Context fsGroup                                                                    | `1001`                        |
| `queryFrontend.containerSecurityContext.enabled`            | Enabled queryFrontend containers' Security Context                                                                  | `true`                        |
| `queryFrontend.containerSecurityContext.runAsUser`          | Set queryFrontend containers' Security Context runAsUser                                                            | `1001`                        |
| `queryFrontend.containerSecurityContext.runAsNonRoot`       | Set queryFrontend containers' Security Context runAsNonRoot                                                         | `true`                        |
| `queryFrontend.lifecycleHooks`                              | for the queryFrontend container(s) to automate configuration before or after startup                                | `{}`                          |
| `queryFrontend.hostAliases`                                 | queryFrontend pods host aliases                                                                                     | `[]`                          |
| `queryFrontend.podLabels`                                   | Extra labels for queryFrontend pods                                                                                 | `{}`                          |
| `queryFrontend.podAnnotations`                              | Annotations for queryFrontend pods                                                                                  | `{}`                          |
| `queryFrontend.podAffinityPreset`                           | Pod affinity preset. Ignored if `queryFrontend.affinity` is set. Allowed values: `soft` or `hard`                   | `""`                          |
| `queryFrontend.podAntiAffinityPreset`                       | Pod anti-affinity preset. Ignored if `queryFrontend.affinity` is set. Allowed values: `soft` or `hard`              | `soft`                        |
| `queryFrontend.nodeAffinityPreset.type`                     | Node affinity preset type. Ignored if `queryFrontend.affinity` is set. Allowed values: `soft` or `hard`             | `""`                          |
| `queryFrontend.nodeAffinityPreset.key`                      | Node label key to match. Ignored if `queryFrontend.affinity` is set                                                 | `""`                          |
| `queryFrontend.nodeAffinityPreset.values`                   | Node label values to match. Ignored if `queryFrontend.affinity` is set                                              | `[]`                          |
| `queryFrontend.affinity`                                    | Affinity for queryFrontend pods assignment                                                                          | `{}`                          |
| `queryFrontend.nodeSelector`                                | Node labels for queryFrontend pods assignment                                                                       | `{}`                          |
| `queryFrontend.tolerations`                                 | Tolerations for queryFrontend pods assignment                                                                       | `[]`                          |
| `queryFrontend.topologySpreadConstraints`                   | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains                     | `[]`                          |
| `queryFrontend.priorityClassName`                           | queryFrontend pods' priorityClassName                                                                               | `""`                          |
| `queryFrontend.schedulerName`                               | Kubernetes pod scheduler registry                                                                                   | `""`                          |
| `queryFrontend.updateStrategy.type`                         | queryFrontend statefulset strategy type                                                                             | `RollingUpdate`               |
| `queryFrontend.updateStrategy.rollingUpdate`                | queryFrontend statefulset rolling update configuration parameters                                                   | `{}`                          |
| `queryFrontend.extraVolumes`                                | Optionally specify extra list of additional volumes for the queryFrontend pod(s)                                    | `[]`                          |
| `queryFrontend.extraVolumeMounts`                           | Optionally specify extra list of additional volumeMounts for the queryFrontend container(s)                         | `[]`                          |
| `queryFrontend.sidecars`                                    | Add additional sidecar containers to the queryFrontend pod(s)                                                       | `[]`                          |
| `queryFrontend.initContainers`                              | Add additional init containers to the queryFrontend pod(s)                                                          | `[]`                          |
| `queryFrontend.query.image.registry`                        | Grafana Tempo Query image registry                                                                                  | `docker.io`                   |
| `queryFrontend.query.image.repository`                      | Grafana Tempo Query image repository                                                                                | `bitnami/grafana-tempo-query` |
| `queryFrontend.query.image.tag`                             | Grafana Tempo Query image tag (immutable tags are recommended)                                                      | `2.1.1-debian-11-r8`          |
| `queryFrontend.query.image.digest`                          | Grafana Tempo Query image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                          |
| `queryFrontend.query.image.pullPolicy`                      | Grafana Tempo Query image pull policy                                                                               | `IfNotPresent`                |
| `queryFrontend.query.image.pullSecrets`                     | Grafana Tempo Query image pull secrets                                                                              | `[]`                          |
| `queryFrontend.query.configuration`                         | Query sidecar configuration                                                                                         | `""`                          |
| `queryFrontend.query.containerPorts.jaegerMetrics`          | queryFrontend query sidecar Jaeger metrics container port                                                           | `16687`                       |
| `queryFrontend.query.containerPorts.jaegerUI`               | queryFrontend query sidecar Jaeger UI container port                                                                | `16686`                       |
| `queryFrontend.query.existingConfigmap`                     | Name of a configmap with the query configuration                                                                    | `""`                          |
| `queryFrontend.query.extraEnvVars`                          | Array with extra environment variables to add to queryFrontend nodes                                                | `[]`                          |
| `queryFrontend.query.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for queryFrontend nodes                                        | `""`                          |
| `queryFrontend.query.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for queryFrontend nodes                                           | `""`                          |
| `queryFrontend.query.command`                               | Override default container command (useful when using custom images)                                                | `[]`                          |
| `queryFrontend.query.args`                                  | Override default container args (useful when using custom images)                                                   | `[]`                          |
| `queryFrontend.query.livenessProbe.enabled`                 | Enable livenessProbe on Query sidecar nodes                                                                         | `true`                        |
| `queryFrontend.query.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                             | `10`                          |
| `queryFrontend.query.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                                    | `10`                          |
| `queryFrontend.query.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                                   | `1`                           |
| `queryFrontend.query.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                                 | `3`                           |
| `queryFrontend.query.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                                 | `1`                           |
| `queryFrontend.query.readinessProbe.enabled`                | Enable readinessProbe on Query sidecar nodes                                                                        | `true`                        |
| `queryFrontend.query.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                            | `10`                          |
| `queryFrontend.query.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                                   | `10`                          |
| `queryFrontend.query.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                                  | `1`                           |
| `queryFrontend.query.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                                | `3`                           |
| `queryFrontend.query.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                                | `1`                           |
| `queryFrontend.query.startupProbe.enabled`                  | Enable startupProbe on Query sidecar containers                                                                     | `false`                       |
| `queryFrontend.query.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                              | `30`                          |
| `queryFrontend.query.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                                     | `10`                          |
| `queryFrontend.query.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                                    | `1`                           |
| `queryFrontend.query.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                                  | `15`                          |
| `queryFrontend.query.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                                  | `1`                           |
| `queryFrontend.query.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                                 | `{}`                          |
| `queryFrontend.query.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                                | `{}`                          |
| `queryFrontend.query.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                                  | `{}`                          |
| `queryFrontend.query.lifecycleHooks`                        | for the query sidecar container(s) to automate configuration before or after startup                                | `{}`                          |
| `queryFrontend.query.containerSecurityContext.enabled`      | Enabled queryFrontend query sidecar containers' Security Context                                                    | `true`                        |
| `queryFrontend.query.containerSecurityContext.runAsUser`    | Set queryFrontend query sidecar containers' Security Context runAsUser                                              | `1001`                        |
| `queryFrontend.query.containerSecurityContext.runAsNonRoot` | Set queryFrontend query sidecar containers' Security Context runAsNonRoot                                           | `true`                        |
| `queryFrontend.query.resources.limits`                      | The resources limits for the query sidecar containers                                                               | `{}`                          |
| `queryFrontend.query.resources.requests`                    | The requested resources for the query sidecar containers                                                            | `{}`                          |
| `queryFrontend.query.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the queryFrontend container(s)                         | `[]`                          |

### Query Frontend Traffic Exposure Parameters

| Name                                             | Description                                                      | Value       |
| ------------------------------------------------ | ---------------------------------------------------------------- | ----------- |
| `queryFrontend.service.type`                     | queryFrontend service type                                       | `ClusterIP` |
| `queryFrontend.service.ports.http`               | queryFrontend HTTP service port                                  | `3200`      |
| `queryFrontend.service.ports.grpc`               | queryFrontend GRPC service port                                  | `9095`      |
| `queryFrontend.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `queryFrontend.service.nodePorts.grpc`           | Node port for GRPC                                               | `""`        |
| `queryFrontend.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `queryFrontend.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `queryFrontend.service.clusterIP`                | queryFrontend service Cluster IP                                 | `""`        |
| `queryFrontend.service.loadBalancerIP`           | queryFrontend service Load Balancer IP                           | `""`        |
| `queryFrontend.service.loadBalancerSourceRanges` | queryFrontend service Load Balancer sources                      | `[]`        |
| `queryFrontend.service.externalTrafficPolicy`    | queryFrontend service external traffic policy                    | `Cluster`   |
| `queryFrontend.service.annotations`              | Additional custom annotations for queryFrontend service          | `{}`        |
| `queryFrontend.service.extraPorts`               | Extra ports to expose in the queryFrontend service               | `[]`        |
| `queryFrontend.service.headless.annotations`     | Annotations for the headless service.                            | `{}`        |

### Vulture Deployment Parameters

| Name                                            | Description                                                                                                     | Value                           |
| ----------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| `vulture.enabled`                               | Enable vulture deployment                                                                                       | `true`                          |
| `vulture.image.registry`                        | Grafana Vulture image registry                                                                                  | `docker.io`                     |
| `vulture.image.repository`                      | Grafana Vulture image repository                                                                                | `bitnami/grafana-tempo-vulture` |
| `vulture.image.tag`                             | Grafana Vulture image tag (immutable tags are recommended)                                                      | `2.1.1-debian-11-r6`            |
| `vulture.image.digest`                          | Grafana Vulture image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                            |
| `vulture.image.pullPolicy`                      | Grafana Vulture image pull policy                                                                               | `IfNotPresent`                  |
| `vulture.image.pullSecrets`                     | Grafana Vulture image pull secrets                                                                              | `[]`                            |
| `vulture.extraEnvVars`                          | Array with extra environment variables to add to vulture nodes                                                  | `[]`                            |
| `vulture.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for vulture nodes                                          | `""`                            |
| `vulture.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for vulture nodes                                             | `""`                            |
| `vulture.command`                               | Override default container command (useful when using custom images)                                            | `[]`                            |
| `vulture.args`                                  | Override default container args (useful when using custom images)                                               | `[]`                            |
| `vulture.replicaCount`                          | Number of Vulture replicas to deploy                                                                            | `1`                             |
| `vulture.livenessProbe.enabled`                 | Enable livenessProbe on Vulture nodes                                                                           | `true`                          |
| `vulture.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                         | `10`                            |
| `vulture.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                                | `10`                            |
| `vulture.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                               | `1`                             |
| `vulture.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                             | `3`                             |
| `vulture.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                             | `1`                             |
| `vulture.readinessProbe.enabled`                | Enable readinessProbe on Vulture nodes                                                                          | `true`                          |
| `vulture.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                        | `10`                            |
| `vulture.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                               | `10`                            |
| `vulture.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                              | `1`                             |
| `vulture.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                            | `3`                             |
| `vulture.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                            | `1`                             |
| `vulture.startupProbe.enabled`                  | Enable startupProbe on Vulture containers                                                                       | `false`                         |
| `vulture.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                          | `30`                            |
| `vulture.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                                 | `10`                            |
| `vulture.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                                | `1`                             |
| `vulture.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                              | `15`                            |
| `vulture.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                              | `1`                             |
| `vulture.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                             | `{}`                            |
| `vulture.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                            | `{}`                            |
| `vulture.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                              | `{}`                            |
| `vulture.resources.limits`                      | The resources limits for the Vulture containers                                                                 | `{}`                            |
| `vulture.resources.requests`                    | The requested resources for the Vulture containers                                                              | `{}`                            |
| `vulture.podSecurityContext.enabled`            | Enabled Vulture pods' Security Context                                                                          | `true`                          |
| `vulture.podSecurityContext.fsGroup`            | Set Vulture pod's Security Context fsGroup                                                                      | `1001`                          |
| `vulture.containerSecurityContext.enabled`      | Enabled Vulture containers' Security Context                                                                    | `true`                          |
| `vulture.containerSecurityContext.runAsUser`    | Set Vulture containers' Security Context runAsUser                                                              | `1001`                          |
| `vulture.containerSecurityContext.runAsNonRoot` | Set Vulture containers' Security Context runAsNonRoot                                                           | `true`                          |
| `vulture.lifecycleHooks`                        | for the vulture container(s) to automate configuration before or after startup                                  | `{}`                            |
| `vulture.hostAliases`                           | vulture pods host aliases                                                                                       | `[]`                            |
| `vulture.podLabels`                             | Extra labels for vulture pods                                                                                   | `{}`                            |
| `vulture.podAnnotations`                        | Annotations for vulture pods                                                                                    | `{}`                            |
| `vulture.podAffinityPreset`                     | Pod affinity preset. Ignored if `vulture.affinity` is set. Allowed values: `soft` or `hard`                     | `""`                            |
| `vulture.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `vulture.affinity` is set. Allowed values: `soft` or `hard`                | `soft`                          |
| `vulture.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `vulture.affinity` is set. Allowed values: `soft` or `hard`               | `""`                            |
| `vulture.nodeAffinityPreset.key`                | Node label key to match. Ignored if `vulture.affinity` is set                                                   | `""`                            |
| `vulture.nodeAffinityPreset.values`             | Node label values to match. Ignored if `vulture.affinity` is set                                                | `[]`                            |
| `vulture.containerPorts.http`                   | Vulture components HTTP container port                                                                          | `8080`                          |
| `vulture.affinity`                              | Affinity for Vulture pods assignment                                                                            | `{}`                            |
| `vulture.nodeSelector`                          | Node labels for Vulture pods assignment                                                                         | `{}`                            |
| `vulture.tolerations`                           | Tolerations for Vulture pods assignment                                                                         | `[]`                            |
| `vulture.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains                 | `[]`                            |
| `vulture.priorityClassName`                     | Vulture pods' priorityClassName                                                                                 | `""`                            |
| `vulture.schedulerName`                         | Kubernetes pod scheduler registry                                                                               | `""`                            |
| `vulture.updateStrategy.type`                   | Vulture statefulset strategy type                                                                               | `RollingUpdate`                 |
| `vulture.updateStrategy.rollingUpdate`          | Vulture statefulset rolling update configuration parameters                                                     | `{}`                            |
| `vulture.extraVolumes`                          | Optionally specify extra list of additional volumes for the Vulture pod(s)                                      | `[]`                            |
| `vulture.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Vulture container(s)                           | `[]`                            |
| `vulture.sidecars`                              | Add additional sidecar containers to the Vulture pod(s)                                                         | `[]`                            |
| `vulture.initContainers`                        | Add additional init containers to the Vulture pod(s)                                                            | `[]`                            |

### Vulture Traffic Exposure Parameters

| Name                                       | Description                                                      | Value       |
| ------------------------------------------ | ---------------------------------------------------------------- | ----------- |
| `vulture.service.type`                     | Vulture service type                                             | `ClusterIP` |
| `vulture.service.ports.http`               | Vulture HTTP service port                                        | `3200`      |
| `vulture.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `vulture.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `vulture.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `vulture.service.clusterIP`                | Vulture service Cluster IP                                       | `""`        |
| `vulture.service.loadBalancerIP`           | Vulture service Load Balancer IP                                 | `""`        |
| `vulture.service.loadBalancerSourceRanges` | Vulture service Load Balancer sources                            | `[]`        |
| `vulture.service.externalTrafficPolicy`    | Vulture service external traffic policy                          | `Cluster`   |
| `vulture.service.annotations`              | Additional custom annotations for Vulture service                | `{}`        |
| `vulture.service.extraPorts`               | Extra ports to expose in the Vulture service                     | `[]`        |

### Init Container Parameters

| Name                                                   | Description                                                                                                   | Value                   |
| ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `volumePermissions.enabled`                            | Enable init container that changes the owner/group of the PV mount point to `runAsUser:fsGroup`               | `false`                 |
| `volumePermissions.image.registry`                     | Bitnami Shell image registry                                                                                  | `docker.io`             |
| `volumePermissions.image.repository`                   | Bitnami Shell image repository                                                                                | `bitnami/bitnami-shell` |
| `volumePermissions.image.tag`                          | Bitnami Shell image tag (immutable tags are recommended)                                                      | `11-debian-11-r118`     |
| `volumePermissions.image.digest`                       | Bitnami Shell image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                    |
| `volumePermissions.image.pullPolicy`                   | Bitnami Shell image pull policy                                                                               | `IfNotPresent`          |
| `volumePermissions.image.pullSecrets`                  | Bitnami Shell image pull secrets                                                                              | `[]`                    |
| `volumePermissions.resources.limits`                   | The resources limits for the init container                                                                   | `{}`                    |
| `volumePermissions.resources.requests`                 | The requested resources for the init container                                                                | `{}`                    |
| `volumePermissions.containerSecurityContext.runAsUser` | Set init container's Security Context runAsUser                                                               | `0`                     |

### Other Parameters

| Name                                          | Description                                                            | Value   |
| --------------------------------------------- | ---------------------------------------------------------------------- | ------- |
| `serviceAccount.create`                       | Enable creation of ServiceAccount for Tempo pods                       | `false` |
| `serviceAccount.name`                         | The name of the ServiceAccount to use                                  | `""`    |
| `serviceAccount.automountServiceAccountToken` | Allows auto mount of ServiceAccountToken on the serviceAccount created | `true`  |
| `serviceAccount.annotations`                  | Additional custom annotations for the ServiceAccount                   | `{}`    |

### Metrics Parameters

| Name                                       | Description                                                                           | Value   |
| ------------------------------------------ | ------------------------------------------------------------------------------------- | ------- |
| `metrics.enabled`                          | Enable metrics                                                                        | `false` |
| `metrics.serviceMonitor.enabled`           | Create ServiceMonitor Resource for scraping metrics using Prometheus Operator         | `false` |
| `metrics.serviceMonitor.namespace`         | Namespace for the ServiceMonitor Resource (defaults to the Release Namespace)         | `""`    |
| `metrics.serviceMonitor.interval`          | Interval at which metrics should be scraped.                                          | `""`    |
| `metrics.serviceMonitor.scrapeTimeout`     | Timeout after which the scrape is ended                                               | `""`    |
| `metrics.serviceMonitor.labels`            | Additional labels that can be used so ServiceMonitor will be discovered by Prometheus | `{}`    |
| `metrics.serviceMonitor.selector`          | Prometheus instance selector labels                                                   | `{}`    |
| `metrics.serviceMonitor.relabelings`       | RelabelConfigs to apply to samples before scraping                                    | `[]`    |
| `metrics.serviceMonitor.metricRelabelings` | MetricRelabelConfigs to apply to samples before ingestion                             | `[]`    |
| `metrics.serviceMonitor.honorLabels`       | Specify honorLabels parameter to add the scrape endpoint                              | `false` |
| `metrics.serviceMonitor.jobLabel`          | The name of the label on the target service to use as the job name in prometheus.     | `""`    |

### External Memcached Parameters

| Name                     | Description                                   | Value   |
| ------------------------ | --------------------------------------------- | ------- |
| `externalMemcached.host` | Host of a running external memcached instance | `""`    |
| `externalMemcached.port` | Port of a running external memcached instance | `11211` |

### Memcached Sub-chart Parameters

| Name                                | Description                     | Value   |
| ----------------------------------- | ------------------------------- | ------- |
| `memcached.enabled`                 | Deploy memcached sub-chart      | `true`  |
| `memcached.auth.enabled`            | Enable Memcached authentication | `false` |
| `memcached.auth.username`           | Memcached admin user            | `""`    |
| `memcached.auth.password`           | Memcached admin password        | `""`    |
| `memcached.service.ports.memcached` | Memcached service port          | `11211` |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set tempo.traces.jaeger.grpc=true \
  oci://registry-1.docker.io/bitnamicharts/grafana-tempo
```

The above command enables the Jaeger GRPC traces.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/grafana-tempo
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Tempo configuration

The tempo configuration file `tempo.yaml` is shared across the different components: `distributor`, `compactor`, `ingester`, `querier` and `queryFrontend`. This is set in the `tempo.configuration` value. Check the official [Tempo Grafana documentation](https://grafana.com/docs/tempo/latest/configuration/) for the list of possible configurations.

## Persistence

The [Bitnami grafana-tempo](https://github.com/bitnami/containers/tree/main/bitnami/grafana-tempo) image stores the grafana-tempo `ingester` data at the `/bitnami` path of the container. Persistent Volume Claims are used to keep the data across deployments.

### Additional environment variables

In case you want to add extra environment variables (useful for advanced operations like custom init scripts), you can use the `extraEnvVars` property inside each of the subsections: `distributor`, `compactor`, `ingester`, `querier`, `queryFrontend` and `vulture`.

```yaml
compactor:
  extraEnvVars:
    - name: LOG_LEVEL
      value: error

distributor:
  extraEnvVars:
    - name: LOG_LEVEL
      value: error

ingester:
  extraEnvVars:
    - name: LOG_LEVEL
      value: error

querier:
  extraEnvVars:
    - name: LOG_LEVEL
      value: error

queryFrontend:
  extraEnvVars:
    - name: LOG_LEVEL
      value: error

vulture:
  extraEnvVars:
    - name: LOG_LEVEL
      value: error
```

Alternatively, you can use a ConfigMap or a Secret with the environment variables. To do so, use the `extraEnvVarsCM` or the `extraEnvVarsSecret` values.

### Sidecars

If additional containers are needed in the same pod as grafana-tempo (such as additional metrics or logging exporters), they can be defined using the `sidecars` parameter inside each of the subsections: `distributor`, `compactor`, `ingester`, `querier`, `queryFrontend` and `vulture` . If these sidecars export extra ports, extra port definitions can be added using the `service.extraPorts` parameter. [Learn more about configuring and using sidecar containers](https://docs.bitnami.com/kubernetes/infrastructure/grafana-tempo/configuration/configure-sidecar-init-containers/).

### Pod affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, use one of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters inside each of the subsections: `distributor`, `compactor`, `ingester`, `querier`, `queryFrontend` and `vulture`.

### External cache support

You may want to have Grafana Tempo connect to an external Memcached rather than installing one inside your cluster. Typical reasons for this are to use a managed cache service, or to share a common cache server for all your applications. To achieve this, the chart allows you to specify credentials for an external database with the [`externalMemcached` parameter](#parameters). You should also disable the Memcached installation with the `memcached.enabled` option. Here is an example:

```console
memcached.enabled=false
externalMemcached.host=myexternalhost
externalMemcached.port=11211
```

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

## Upgrading

### To 2.0.0

This major release removes `search_enabled` and `metrics_generator_enabled` configuration parameters, assuming they are always enabled.

### To 1.0.0

This major release renames several values in this chart and adds missing features, in order to be inline with the rest of assets in the Bitnami charts repository.

- `tempo.containerPort`, `tempo.grpcContainerPort` and `tempo.gossipRing.containerPort` have been regrouped under the `tempo.containerPorts` map.
- `queryFrontend.query.jaegerMetricsContainerPort` and `queryFrontend.query.jaegerUIContainerPort` have been regrouped under the `queryFrontend.query.containerPorts` map.
- `vulture.containerPort` has been regrouped under the `vulture.containerPorts` map.
- `XXX.service.port` and `XXX.service.grpcPort` have been regrouped under the `XXX.service.ports` map.

Additionally updates the Memcached subchart to its newest major `6.x.x`, which contains similar changes.

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