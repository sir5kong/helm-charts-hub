<!--- app-name: Grafana Loki -->

# Grafana Loki packaged by Bitnami

Grafana Loki is a horizontally scalable, highly available, and multi-tenant log aggregation system. It provides real-time long tailing and full persistence to object storage.

[Overview of Grafana Loki](https://grafana.com/oss/loki/)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/grafana-loki
```

## Introduction

Bitnami charts for Helm are carefully engineered, actively maintained and are the quickest and easiest way to deploy containers on a Kubernetes cluster that are ready to handle production workloads.

This chart bootstraps a [Grafana Loki](https://github.com/grafana/loki) Deployment in a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

[Learn more about the default configuration of the chart](https://docs.bitnami.com/kubernetes/infrastructure/grafana-loki/get-started/).

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/grafana-loki
```

The command deploys grafana-loki on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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

### Common Grafana Loki Parameters

| Name                                  | Description                                                                                                  | Value                   |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------ | ----------------------- |
| `loki.image.registry`                 | Grafana Loki image registry                                                                                  | `docker.io`             |
| `loki.image.repository`               | Grafana Loki image repository                                                                                | `bitnami/grafana-loki`  |
| `loki.image.tag`                      | Grafana Loki image tag (immutable tags are recommended)                                                      | `2.8.2-debian-11-r6`    |
| `loki.image.digest`                   | Grafana Loki image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                    |
| `loki.image.pullPolicy`               | Grafana Loki image pull policy                                                                               | `IfNotPresent`          |
| `loki.image.pullSecrets`              | Grafana Loki image pull secrets                                                                              | `[]`                    |
| `loki.configuration`                  | Loki components configuration                                                                                | `""`                    |
| `loki.overrideConfiguration`          | Loki components configuration override. Values defined here takes precedence over loki.configuration         | `{}`                    |
| `loki.existingConfigmap`              | Name of a ConfigMap with the Loki configuration                                                              | `""`                    |
| `loki.dataDir`                        | path to the Loki data directory                                                                              | `/bitnami/grafana-loki` |
| `loki.containerPorts.http`            | Loki components web container port                                                                           | `3100`                  |
| `loki.containerPorts.grpc`            | Loki components GRPC container port                                                                          | `9095`                  |
| `loki.containerPorts.gossipRing`      | Loki components Gossip Ring container port                                                                   | `7946`                  |
| `loki.gossipRing.service.ports.http`  | Gossip Ring HTTP headless service port                                                                       | `7946`                  |
| `loki.gossipRing.service.annotations` | Additional custom annotations for Gossip Ring headless service                                               | `{}`                    |

### Compactor Deployment Parameters

| Name                                              | Description                                                                                         | Value               |
| ------------------------------------------------- | --------------------------------------------------------------------------------------------------- | ------------------- |
| `compactor.enabled`                               | Enable Compactor deployment                                                                         | `true`              |
| `compactor.extraEnvVars`                          | Array with extra environment variables to add to compactor nodes                                    | `[]`                |
| `compactor.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for compactor nodes                            | `""`                |
| `compactor.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for compactor nodes                               | `""`                |
| `compactor.command`                               | Override default container command (useful when using custom images)                                | `[]`                |
| `compactor.args`                                  | Override default container args (useful when using custom images)                                   | `[]`                |
| `compactor.replicaCount`                          | Number of Compactor replicas to deploy                                                              | `1`                 |
| `compactor.livenessProbe.enabled`                 | Enable livenessProbe on Compactor nodes                                                             | `true`              |
| `compactor.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                             | `60`                |
| `compactor.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                    | `10`                |
| `compactor.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                   | `1`                 |
| `compactor.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                 | `3`                 |
| `compactor.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                 | `1`                 |
| `compactor.readinessProbe.enabled`                | Enable readinessProbe on Compactor nodes                                                            | `true`              |
| `compactor.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                            | `60`                |
| `compactor.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                   | `10`                |
| `compactor.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                  | `1`                 |
| `compactor.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                | `3`                 |
| `compactor.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                | `1`                 |
| `compactor.startupProbe.enabled`                  | Enable startupProbe on Compactor containers                                                         | `false`             |
| `compactor.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                              | `30`                |
| `compactor.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                     | `10`                |
| `compactor.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                    | `1`                 |
| `compactor.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                  | `15`                |
| `compactor.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                  | `1`                 |
| `compactor.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                 | `{}`                |
| `compactor.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                | `{}`                |
| `compactor.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                  | `{}`                |
| `compactor.resources.limits`                      | The resources limits for the compactor containers                                                   | `{}`                |
| `compactor.resources.requests`                    | The requested resources for the compactor containers                                                | `{}`                |
| `compactor.podSecurityContext.enabled`            | Enabled Compactor pods' Security Context                                                            | `true`              |
| `compactor.podSecurityContext.fsGroup`            | Set Compactor pod's Security Context fsGroup                                                        | `1001`              |
| `compactor.containerSecurityContext.enabled`      | Enabled Compactor containers' Security Context                                                      | `true`              |
| `compactor.containerSecurityContext.runAsUser`    | Set Compactor containers' Security Context runAsUser                                                | `1001`              |
| `compactor.containerSecurityContext.runAsNonRoot` | Set Compactor containers' Security Context runAsNonRoot                                             | `true`              |
| `compactor.lifecycleHooks`                        | for the compactor container(s) to automate configuration before or after startup                    | `{}`                |
| `compactor.hostAliases`                           | compactor pods host aliases                                                                         | `[]`                |
| `compactor.podLabels`                             | Extra labels for compactor pods                                                                     | `{}`                |
| `compactor.podAnnotations`                        | Annotations for compactor pods                                                                      | `{}`                |
| `compactor.podAffinityPreset`                     | Pod affinity preset. Ignored if `compactor.affinity` is set. Allowed values: `soft` or `hard`       | `""`                |
| `compactor.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `compactor.affinity` is set. Allowed values: `soft` or `hard`  | `soft`              |
| `compactor.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `compactor.affinity` is set. Allowed values: `soft` or `hard` | `""`                |
| `compactor.nodeAffinityPreset.key`                | Node label key to match. Ignored if `compactor.affinity` is set                                     | `""`                |
| `compactor.nodeAffinityPreset.values`             | Node label values to match. Ignored if `compactor.affinity` is set                                  | `[]`                |
| `compactor.affinity`                              | Affinity for Compactor pods assignment                                                              | `{}`                |
| `compactor.nodeSelector`                          | Node labels for Compactor pods assignment                                                           | `{}`                |
| `compactor.tolerations`                           | Tolerations for Compactor pods assignment                                                           | `[]`                |
| `compactor.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains     | `[]`                |
| `compactor.priorityClassName`                     | Compactor pods' priorityClassName                                                                   | `""`                |
| `compactor.schedulerName`                         | Kubernetes pod scheduler registry                                                                   | `""`                |
| `compactor.updateStrategy.type`                   | Compactor statefulset strategy type                                                                 | `RollingUpdate`     |
| `compactor.updateStrategy.rollingUpdate`          | Compactor statefulset rolling update configuration parameters                                       | `{}`                |
| `compactor.extraVolumes`                          | Optionally specify extra list of additional volumes for the Compactor pod(s)                        | `[]`                |
| `compactor.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Compactor container(s)             | `[]`                |
| `compactor.sidecars`                              | Add additional sidecar containers to the Compactor pod(s)                                           | `[]`                |
| `compactor.initContainers`                        | Add additional init containers to the Compactor pod(s)                                              | `[]`                |
| `compactor.persistence.enabled`                   | Enable persistence in Compactor instances                                                           | `true`              |
| `compactor.persistence.existingClaim`             | Name of an existing PVC to use                                                                      | `""`                |
| `compactor.persistence.storageClass`              | PVC Storage Class for Memcached data volume                                                         | `""`                |
| `compactor.persistence.accessModes`               | PVC Access modes                                                                                    | `["ReadWriteOnce"]` |
| `compactor.persistence.size`                      | PVC Storage Request for Memcached data volume                                                       | `8Gi`               |
| `compactor.persistence.annotations`               | Additional PVC annotations                                                                          | `{}`                |
| `compactor.persistence.selector`                  | Selector to match an existing Persistent Volume for Compactor's data PVC                            | `{}`                |
| `compactor.persistence.dataSource`                | PVC data source                                                                                     | `{}`                |

### Compactor Traffic Exposure Parameters

| Name                                         | Description                                                      | Value       |
| -------------------------------------------- | ---------------------------------------------------------------- | ----------- |
| `compactor.service.type`                     | Compactor service type                                           | `ClusterIP` |
| `compactor.service.ports.http`               | Compactor HTTP service port                                      | `3100`      |
| `compactor.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `compactor.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `compactor.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `compactor.service.clusterIP`                | Compactor service Cluster IP                                     | `""`        |
| `compactor.service.loadBalancerIP`           | Compactor service Load Balancer IP                               | `""`        |
| `compactor.service.loadBalancerSourceRanges` | Compactor service Load Balancer sources                          | `[]`        |
| `compactor.service.externalTrafficPolicy`    | Compactor service external traffic policy                        | `Cluster`   |
| `compactor.service.annotations`              | Additional custom annotations for Compactor service              | `{}`        |
| `compactor.service.extraPorts`               | Extra ports to expose in the Compactor service                   | `[]`        |

### Gateway Deployment Parameters

| Name                                            | Description                                                                                           | Value                  |
| ----------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ---------------------- |
| `gateway.enabled`                               | Enable Gateway deployment                                                                             | `true`                 |
| `gateway.image.registry`                        | Nginx image registry                                                                                  | `docker.io`            |
| `gateway.image.repository`                      | Nginx image repository                                                                                | `bitnami/nginx`        |
| `gateway.image.tag`                             | Nginx image tag (immutable tags are recommended)                                                      | `1.23.4-debian-11-r18` |
| `gateway.image.digest`                          | Nginx image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                   |
| `gateway.image.pullPolicy`                      | Nginx image pull policy                                                                               | `IfNotPresent`         |
| `gateway.image.pullSecrets`                     | Nginx image pull secrets                                                                              | `[]`                   |
| `gateway.image.debug`                           | Enable debugging in the initialization process                                                        | `false`                |
| `gateway.extraEnvVars`                          | Array with extra environment variables to add to gateway nodes                                        | `[]`                   |
| `gateway.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for gateway nodes                                | `""`                   |
| `gateway.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for gateway nodes                                   | `""`                   |
| `gateway.command`                               | Override default container command (useful when using custom images)                                  | `[]`                   |
| `gateway.args`                                  | Override default container args (useful when using custom images)                                     | `[]`                   |
| `gateway.verboseLogging`                        | Show the gateway access_log                                                                           | `false`                |
| `gateway.replicaCount`                          | Number of Gateway replicas to deploy                                                                  | `1`                    |
| `gateway.auth.enabled`                          | Enable basic auth                                                                                     | `false`                |
| `gateway.auth.username`                         | Basic auth username                                                                                   | `user`                 |
| `gateway.auth.password`                         | Basic auth password                                                                                   | `""`                   |
| `gateway.auth.existingSecret`                   | Name of a secret containing the Basic auth password                                                   | `""`                   |
| `gateway.livenessProbe.enabled`                 | Enable livenessProbe on Gateway nodes                                                                 | `true`                 |
| `gateway.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                               | `10`                   |
| `gateway.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                      | `10`                   |
| `gateway.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                     | `1`                    |
| `gateway.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                   | `3`                    |
| `gateway.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                   | `1`                    |
| `gateway.readinessProbe.enabled`                | Enable readinessProbe on Gateway nodes                                                                | `true`                 |
| `gateway.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                              | `10`                   |
| `gateway.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                     | `10`                   |
| `gateway.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                    | `1`                    |
| `gateway.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                  | `3`                    |
| `gateway.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                  | `1`                    |
| `gateway.startupProbe.enabled`                  | Enable startupProbe on Gateway containers                                                             | `false`                |
| `gateway.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                | `10`                   |
| `gateway.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                       | `10`                   |
| `gateway.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                      | `1`                    |
| `gateway.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                    | `15`                   |
| `gateway.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                    | `1`                    |
| `gateway.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                   | `{}`                   |
| `gateway.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                  | `{}`                   |
| `gateway.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                    | `{}`                   |
| `gateway.containerPorts.http`                   | Gateway HTTP port                                                                                     | `8080`                 |
| `gateway.resources.limits`                      | The resources limits for the gateway containers                                                       | `{}`                   |
| `gateway.resources.requests`                    | The requested resources for the gateway containers                                                    | `{}`                   |
| `gateway.podSecurityContext.enabled`            | Enabled Gateway pods' Security Context                                                                | `true`                 |
| `gateway.podSecurityContext.fsGroup`            | Set Gateway pod's Security Context fsGroup                                                            | `1001`                 |
| `gateway.containerSecurityContext.enabled`      | Enabled Gateway containers' Security Context                                                          | `true`                 |
| `gateway.containerSecurityContext.runAsUser`    | Set Gateway containers' Security Context runAsUser                                                    | `1001`                 |
| `gateway.containerSecurityContext.runAsNonRoot` | Set Gateway containers' Security Context runAsNonRoot                                                 | `true`                 |
| `gateway.lifecycleHooks`                        | for the gateway container(s) to automate configuration before or after startup                        | `{}`                   |
| `gateway.hostAliases`                           | gateway pods host aliases                                                                             | `[]`                   |
| `gateway.podLabels`                             | Extra labels for gateway pods                                                                         | `{}`                   |
| `gateway.podAnnotations`                        | Annotations for gateway pods                                                                          | `{}`                   |
| `gateway.podAffinityPreset`                     | Pod affinity preset. Ignored if `gateway.affinity` is set. Allowed values: `soft` or `hard`           | `""`                   |
| `gateway.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `gateway.affinity` is set. Allowed values: `soft` or `hard`      | `soft`                 |
| `gateway.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `gateway.affinity` is set. Allowed values: `soft` or `hard`     | `""`                   |
| `gateway.nodeAffinityPreset.key`                | Node label key to match. Ignored if `gateway.affinity` is set                                         | `""`                   |
| `gateway.nodeAffinityPreset.values`             | Node label values to match. Ignored if `gateway.affinity` is set                                      | `[]`                   |
| `gateway.affinity`                              | Affinity for Gateway pods assignment                                                                  | `{}`                   |
| `gateway.nodeSelector`                          | Node labels for Gateway pods assignment                                                               | `{}`                   |
| `gateway.tolerations`                           | Tolerations for Gateway pods assignment                                                               | `[]`                   |
| `gateway.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains       | `[]`                   |
| `gateway.priorityClassName`                     | Gateway pods' priorityClassName                                                                       | `""`                   |
| `gateway.schedulerName`                         | Kubernetes pod scheduler registry                                                                     | `""`                   |
| `gateway.updateStrategy.type`                   | Gateway statefulset strategy type                                                                     | `RollingUpdate`        |
| `gateway.updateStrategy.rollingUpdate`          | Gateway statefulset rolling update configuration parameters                                           | `{}`                   |
| `gateway.extraVolumes`                          | Optionally specify extra list of additional volumes for the Gateway pod(s)                            | `[]`                   |
| `gateway.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Gateway container(s)                 | `[]`                   |
| `gateway.sidecars`                              | Add additional sidecar containers to the Gateway pod(s)                                               | `[]`                   |
| `gateway.initContainers`                        | Add additional init containers to the Gateway pod(s)                                                  | `[]`                   |

### Gateway Traffic Exposure Parameters

| Name                                       | Description                                                                                                                      | Value                    |
| ------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `gateway.service.type`                     | Gateway service type                                                                                                             | `ClusterIP`              |
| `gateway.service.ports.http`               | Gateway HTTP service port                                                                                                        | `80`                     |
| `gateway.service.nodePorts.http`           | Node port for HTTP                                                                                                               | `""`                     |
| `gateway.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                     |
| `gateway.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin                                                                 | `None`                   |
| `gateway.service.clusterIP`                | Gateway service Cluster IP                                                                                                       | `""`                     |
| `gateway.service.loadBalancerIP`           | Gateway service Load Balancer IP                                                                                                 | `""`                     |
| `gateway.service.loadBalancerSourceRanges` | Gateway service Load Balancer sources                                                                                            | `[]`                     |
| `gateway.service.externalTrafficPolicy`    | Gateway service external traffic policy                                                                                          | `Cluster`                |
| `gateway.service.annotations`              | Additional custom annotations for Gateway service                                                                                | `{}`                     |
| `gateway.service.extraPorts`               | Extra ports to expose in the Gateway service                                                                                     | `[]`                     |
| `gateway.ingress.enabled`                  | Enable ingress record generation for Loki Gateway                                                                                | `false`                  |
| `gateway.ingress.pathType`                 | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `gateway.ingress.apiVersion`               | Force Ingress API version (automatically detected if not set)                                                                    | `""`                     |
| `gateway.ingress.ingressClassName`         | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                     |
| `gateway.ingress.hostname`                 | Default host for the ingress record                                                                                              | `grafana-loki.local`     |
| `gateway.ingress.path`                     | Default path for the ingress record                                                                                              | `/`                      |
| `gateway.ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `gateway.ingress.tls`                      | Enable TLS configuration for the host defined at `ingress.hostname` parameter                                                    | `false`                  |
| `gateway.ingress.selfSigned`               | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                  |
| `gateway.ingress.extraHosts`               | An array with additional hostname(s) to be covered with the ingress record                                                       | `[]`                     |
| `gateway.ingress.extraPaths`               | An array with additional arbitrary paths that may need to be added to the ingress under the main host                            | `[]`                     |
| `gateway.ingress.extraTls`                 | TLS configuration for additional hostname(s) to be covered with this ingress record                                              | `[]`                     |
| `gateway.ingress.secrets`                  | Custom TLS certificates as secrets                                                                                               | `[]`                     |

### index-gateway Deployment Parameters

| Name                                                 | Description                                                                                            | Value           |
| ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | --------------- |
| `indexGateway.enabled`                               | Enable index-gateway deployment                                                                        | `false`         |
| `indexGateway.extraEnvVars`                          | Array with extra environment variables to add to indexGateway nodes                                    | `[]`            |
| `indexGateway.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for indexGateway nodes                            | `""`            |
| `indexGateway.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for indexGateway nodes                               | `""`            |
| `indexGateway.command`                               | Override default container command (useful when using custom images)                                   | `[]`            |
| `indexGateway.args`                                  | Override default container args (useful when using custom images)                                      | `[]`            |
| `indexGateway.replicaCount`                          | Number of index-gateway replicas to deploy                                                             | `1`             |
| `indexGateway.podManagementPolicy`                   | podManagementPolicy to manage scaling operation                                                        | `""`            |
| `indexGateway.livenessProbe.enabled`                 | Enable livenessProbe on index-gateway nodes                                                            | `true`          |
| `indexGateway.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                | `60`            |
| `indexGateway.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                       | `10`            |
| `indexGateway.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                      | `1`             |
| `indexGateway.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                    | `3`             |
| `indexGateway.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                    | `1`             |
| `indexGateway.readinessProbe.enabled`                | Enable readinessProbe on index-gateway nodes                                                           | `true`          |
| `indexGateway.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                               | `60`            |
| `indexGateway.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                      | `10`            |
| `indexGateway.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                     | `1`             |
| `indexGateway.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                   | `3`             |
| `indexGateway.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                   | `1`             |
| `indexGateway.startupProbe.enabled`                  | Enable startupProbe on index-gateway containers                                                        | `false`         |
| `indexGateway.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                 | `30`            |
| `indexGateway.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                        | `10`            |
| `indexGateway.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                       | `1`             |
| `indexGateway.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                     | `15`            |
| `indexGateway.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                     | `1`             |
| `indexGateway.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                    | `{}`            |
| `indexGateway.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                   | `{}`            |
| `indexGateway.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                     | `{}`            |
| `indexGateway.resources.limits`                      | The resources limits for the indexGateway containers                                                   | `{}`            |
| `indexGateway.resources.requests`                    | The requested resources for the indexGateway containers                                                | `{}`            |
| `indexGateway.podSecurityContext.enabled`            | Enabled index-gateway pods' Security Context                                                           | `true`          |
| `indexGateway.podSecurityContext.fsGroup`            | Set index-gateway pod's Security Context fsGroup                                                       | `1001`          |
| `indexGateway.containerSecurityContext.enabled`      | Enabled index-gateway containers' Security Context                                                     | `true`          |
| `indexGateway.containerSecurityContext.runAsUser`    | Set index-gateway containers' Security Context runAsUser                                               | `1001`          |
| `indexGateway.containerSecurityContext.runAsNonRoot` | Set index-gateway containers' Security Context runAsNonRoot                                            | `true`          |
| `indexGateway.lifecycleHooks`                        | for the indexGateway container(s) to automate configuration before or after startup                    | `{}`            |
| `indexGateway.hostAliases`                           | indexGateway pods host aliases                                                                         | `[]`            |
| `indexGateway.podLabels`                             | Extra labels for indexGateway pods                                                                     | `{}`            |
| `indexGateway.podAnnotations`                        | Annotations for indexGateway pods                                                                      | `{}`            |
| `indexGateway.podAffinityPreset`                     | Pod affinity preset. Ignored if `indexGateway.affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `indexGateway.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `indexGateway.affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `indexGateway.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `indexGateway.affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `indexGateway.nodeAffinityPreset.key`                | Node label key to match. Ignored if `indexGateway.affinity` is set                                     | `""`            |
| `indexGateway.nodeAffinityPreset.values`             | Node label values to match. Ignored if `indexGateway.affinity` is set                                  | `[]`            |
| `indexGateway.affinity`                              | Affinity for index-gateway pods assignment                                                             | `{}`            |
| `indexGateway.nodeSelector`                          | Node labels for index-gateway pods assignment                                                          | `{}`            |
| `indexGateway.tolerations`                           | Tolerations for index-gateway pods assignment                                                          | `[]`            |
| `indexGateway.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains        | `[]`            |
| `indexGateway.priorityClassName`                     | index-gateway pods' priorityClassName                                                                  | `""`            |
| `indexGateway.schedulerName`                         | Kubernetes pod scheduler registry                                                                      | `""`            |
| `indexGateway.updateStrategy.type`                   | index-gateway statefulset strategy type                                                                | `RollingUpdate` |
| `indexGateway.updateStrategy.rollingUpdate`          | index-gateway statefulset rolling update configuration parameters                                      | `{}`            |
| `indexGateway.extraVolumes`                          | Optionally specify extra list of additional volumes for the index-gateway pod(s)                       | `[]`            |
| `indexGateway.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the index-gateway container(s)            | `[]`            |
| `indexGateway.sidecars`                              | Add additional sidecar containers to the index-gateway pod(s)                                          | `[]`            |
| `indexGateway.initContainers`                        | Add additional init containers to the index-gateway pod(s)                                             | `[]`            |

### index-gateway Traffic Exposure Parameters

| Name                                            | Description                                                      | Value       |
| ----------------------------------------------- | ---------------------------------------------------------------- | ----------- |
| `indexGateway.service.type`                     | index-gateway service type                                       | `ClusterIP` |
| `indexGateway.service.ports.http`               | index-gateway HTTP service port                                  | `3100`      |
| `indexGateway.service.ports.grpc`               | index-gateway GRPC service port                                  | `9095`      |
| `indexGateway.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `indexGateway.service.nodePorts.grpc`           | Node port for GRPC                                               | `""`        |
| `indexGateway.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `indexGateway.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `indexGateway.service.clusterIP`                | index-gateway service Cluster IP                                 | `""`        |
| `indexGateway.service.loadBalancerIP`           | index-gateway service Load Balancer IP                           | `""`        |
| `indexGateway.service.loadBalancerSourceRanges` | index-gateway service Load Balancer sources                      | `[]`        |
| `indexGateway.service.externalTrafficPolicy`    | index-gateway service external traffic policy                    | `Cluster`   |
| `indexGateway.service.annotations`              | Additional custom annotations for index-gateway service          | `{}`        |
| `indexGateway.service.extraPorts`               | Extra ports to expose in the index-gateway service               | `[]`        |

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
| `distributor.service.ports.http`               | Distributor HTTP service port                                    | `3100`      |
| `distributor.service.ports.grpc`               | Distributor GRPC service port                                    | `9095`      |
| `distributor.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `distributor.service.nodePorts.grpc`           | Node port for GRPC                                               | `""`        |
| `distributor.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `distributor.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `distributor.service.clusterIP`                | Distributor service Cluster IP                                   | `""`        |
| `distributor.service.loadBalancerIP`           | Distributor service Load Balancer IP                             | `""`        |
| `distributor.service.loadBalancerSourceRanges` | Distributor service Load Balancer sources                        | `[]`        |
| `distributor.service.externalTrafficPolicy`    | Distributor service external traffic policy                      | `Cluster`   |
| `distributor.service.annotations`              | Additional custom annotations for Distributor service            | `{}`        |
| `distributor.service.extraPorts`               | Extra ports to expose in the Distributor service                 | `[]`        |

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
| `ingester.podManagementPolicy`                   | podManagementPolicy to manage scaling operation                                                    | `""`            |
| `ingester.priorityClassName`                     | Ingester pods' priorityClassName                                                                   | `""`            |
| `ingester.schedulerName`                         | Kubernetes pod scheduler registry                                                                  | `""`            |
| `ingester.updateStrategy.type`                   | Ingester statefulset strategy type                                                                 | `RollingUpdate` |
| `ingester.updateStrategy.rollingUpdate`          | Ingester statefulset rolling update configuration parameters                                       | `{}`            |
| `ingester.extraVolumes`                          | Optionally specify extra list of additional volumes for the Ingester pod(s)                        | `[]`            |
| `ingester.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the ingester container(s)             | `[]`            |
| `ingester.sidecars`                              | Add additional sidecar containers to the Ingester pod(s)                                           | `[]`            |
| `ingester.initContainers`                        | Add additional init containers to the Ingester pod(s)                                              | `[]`            |

### Ingester Persistence Parameters

| Name                                | Description                                                             | Value               |
| ----------------------------------- | ----------------------------------------------------------------------- | ------------------- |
| `ingester.persistence.enabled`      | Enable persistence in Ingester instances                                | `true`              |
| `ingester.persistence.storageClass` | PVC Storage Class for Memcached data volume                             | `""`                |
| `ingester.persistence.subPath`      | The subdirectory of the volume to mount to                              | `""`                |
| `ingester.persistence.accessModes`  | PVC Access modes                                                        | `["ReadWriteOnce"]` |
| `ingester.persistence.size`         | PVC Storage Request for Memcached data volume                           | `8Gi`               |
| `ingester.persistence.annotations`  | Additional PVC annotations                                              | `{}`                |
| `ingester.persistence.selector`     | Selector to match an existing Persistent Volume for Ingester's data PVC | `{}`                |

### Ingester Traffic Exposure Parameters

| Name                                        | Description                                                      | Value       |
| ------------------------------------------- | ---------------------------------------------------------------- | ----------- |
| `ingester.service.type`                     | Ingester service type                                            | `ClusterIP` |
| `ingester.service.ports.http`               | Ingester HTTP service port                                       | `3100`      |
| `ingester.service.ports.grpc`               | Ingester GRPC service port                                       | `9095`      |
| `ingester.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `ingester.service.nodePorts.grpc`           | Node port for GRPC                                               | `""`        |
| `ingester.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `ingester.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
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
| `querier.podManagementPolicy`                   | podManagementPolicy to manage scaling operation                                                   | `""`            |
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

### Querier Persistence Parameters

| Name                               | Description                                                            | Value               |
| ---------------------------------- | ---------------------------------------------------------------------- | ------------------- |
| `querier.persistence.enabled`      | Enable persistence in Querier instances                                | `true`              |
| `querier.persistence.storageClass` | PVC Storage Class for Memcached data volume                            | `""`                |
| `querier.persistence.subPath`      | The subdirectory of the volume to mount to                             | `""`                |
| `querier.persistence.accessModes`  | PVC Access modes                                                       | `["ReadWriteOnce"]` |
| `querier.persistence.size`         | PVC Storage Request for Memcached data volume                          | `8Gi`               |
| `querier.persistence.annotations`  | Additional PVC annotations                                             | `{}`                |
| `querier.persistence.selector`     | Selector to match an existing Persistent Volume for Querier's data PVC | `{}`                |

### Querier Traffic Exposure Parameters

| Name                                       | Description                                                      | Value       |
| ------------------------------------------ | ---------------------------------------------------------------- | ----------- |
| `querier.service.type`                     | Querier service type                                             | `ClusterIP` |
| `querier.service.ports.http`               | Querier HTTP service port                                        | `3100`      |
| `querier.service.ports.grpc`               | Querier GRPC service port                                        | `9095`      |
| `querier.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `querier.service.nodePorts.grpc`           | Node port for GRPC                                               | `""`        |
| `querier.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `querier.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `querier.service.clusterIP`                | Querier service Cluster IP                                       | `""`        |
| `querier.service.loadBalancerIP`           | Querier service Load Balancer IP                                 | `""`        |
| `querier.service.loadBalancerSourceRanges` | Querier service Load Balancer sources                            | `[]`        |
| `querier.service.externalTrafficPolicy`    | Querier service external traffic policy                          | `Cluster`   |
| `querier.service.annotations`              | Additional custom annotations for Querier service                | `{}`        |
| `querier.service.extraPorts`               | Extra ports to expose in the Querier service                     | `[]`        |

### Query Frontend Deployment Parameters

| Name                                                  | Description                                                                                             | Value           |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | --------------- |
| `queryFrontend.extraEnvVars`                          | Array with extra environment variables to add to queryFrontend nodes                                    | `[]`            |
| `queryFrontend.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for queryFrontend nodes                            | `""`            |
| `queryFrontend.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for queryFrontend nodes                               | `""`            |
| `queryFrontend.command`                               | Override default container command (useful when using custom images)                                    | `[]`            |
| `queryFrontend.args`                                  | Override default container args (useful when using custom images)                                       | `[]`            |
| `queryFrontend.replicaCount`                          | Number of queryFrontend replicas to deploy                                                              | `1`             |
| `queryFrontend.livenessProbe.enabled`                 | Enable livenessProbe on queryFrontend nodes                                                             | `true`          |
| `queryFrontend.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                 | `10`            |
| `queryFrontend.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                        | `10`            |
| `queryFrontend.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                       | `1`             |
| `queryFrontend.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                     | `3`             |
| `queryFrontend.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                     | `1`             |
| `queryFrontend.readinessProbe.enabled`                | Enable readinessProbe on queryFrontend nodes                                                            | `true`          |
| `queryFrontend.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                | `10`            |
| `queryFrontend.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                       | `10`            |
| `queryFrontend.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                      | `1`             |
| `queryFrontend.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                    | `3`             |
| `queryFrontend.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                    | `1`             |
| `queryFrontend.startupProbe.enabled`                  | Enable startupProbe on queryFrontend containers                                                         | `false`         |
| `queryFrontend.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                  | `30`            |
| `queryFrontend.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                         | `10`            |
| `queryFrontend.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                        | `1`             |
| `queryFrontend.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                      | `15`            |
| `queryFrontend.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                      | `1`             |
| `queryFrontend.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                     | `{}`            |
| `queryFrontend.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                    | `{}`            |
| `queryFrontend.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                      | `{}`            |
| `queryFrontend.resources.limits`                      | The resources limits for the queryFrontend containers                                                   | `{}`            |
| `queryFrontend.resources.requests`                    | The requested resources for the queryFrontend containers                                                | `{}`            |
| `queryFrontend.podSecurityContext.enabled`            | Enabled queryFrontend pods' Security Context                                                            | `true`          |
| `queryFrontend.podSecurityContext.fsGroup`            | Set queryFrontend pod's Security Context fsGroup                                                        | `1001`          |
| `queryFrontend.containerSecurityContext.enabled`      | Enabled queryFrontend containers' Security Context                                                      | `true`          |
| `queryFrontend.containerSecurityContext.runAsUser`    | Set queryFrontend containers' Security Context runAsUser                                                | `1001`          |
| `queryFrontend.containerSecurityContext.runAsNonRoot` | Set queryFrontend containers' Security Context runAsNonRoot                                             | `true`          |
| `queryFrontend.lifecycleHooks`                        | for the queryFrontend container(s) to automate configuration before or after startup                    | `{}`            |
| `queryFrontend.hostAliases`                           | queryFrontend pods host aliases                                                                         | `[]`            |
| `queryFrontend.podLabels`                             | Extra labels for queryFrontend pods                                                                     | `{}`            |
| `queryFrontend.podAnnotations`                        | Annotations for queryFrontend pods                                                                      | `{}`            |
| `queryFrontend.podAffinityPreset`                     | Pod affinity preset. Ignored if `queryFrontend.affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `queryFrontend.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `queryFrontend.affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `queryFrontend.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `queryFrontend.affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `queryFrontend.nodeAffinityPreset.key`                | Node label key to match. Ignored if `queryFrontend.affinity` is set                                     | `""`            |
| `queryFrontend.nodeAffinityPreset.values`             | Node label values to match. Ignored if `queryFrontend.affinity` is set                                  | `[]`            |
| `queryFrontend.affinity`                              | Affinity for queryFrontend pods assignment                                                              | `{}`            |
| `queryFrontend.nodeSelector`                          | Node labels for queryFrontend pods assignment                                                           | `{}`            |
| `queryFrontend.tolerations`                           | Tolerations for queryFrontend pods assignment                                                           | `[]`            |
| `queryFrontend.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains         | `[]`            |
| `queryFrontend.priorityClassName`                     | queryFrontend pods' priorityClassName                                                                   | `""`            |
| `queryFrontend.schedulerName`                         | Kubernetes pod scheduler registry                                                                       | `""`            |
| `queryFrontend.updateStrategy.type`                   | queryFrontend statefulset strategy type                                                                 | `RollingUpdate` |
| `queryFrontend.updateStrategy.rollingUpdate`          | queryFrontend statefulset rolling update configuration parameters                                       | `{}`            |
| `queryFrontend.extraVolumes`                          | Optionally specify extra list of additional volumes for the queryFrontend pod(s)                        | `[]`            |
| `queryFrontend.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the queryFrontend container(s)             | `[]`            |
| `queryFrontend.sidecars`                              | Add additional sidecar containers to the queryFrontend pod(s)                                           | `[]`            |
| `queryFrontend.initContainers`                        | Add additional init containers to the queryFrontend pod(s)                                              | `[]`            |

### Query Frontend Traffic Exposure Parameters

| Name                                             | Description                                                      | Value       |
| ------------------------------------------------ | ---------------------------------------------------------------- | ----------- |
| `queryFrontend.service.type`                     | queryFrontend service type                                       | `ClusterIP` |
| `queryFrontend.service.ports.http`               | queryFrontend HTTP service port                                  | `3100`      |
| `queryFrontend.service.ports.grpc`               | queryFrontend GRPC service port                                  | `9095`      |
| `queryFrontend.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `queryFrontend.service.nodePorts.grpc`           | Node port for GRPC                                               | `""`        |
| `queryFrontend.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `queryFrontend.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `queryFrontend.service.clusterIP`                | queryFrontend service Cluster IP                                 | `""`        |
| `queryFrontend.service.loadBalancerIP`           | queryFrontend service Load Balancer IP                           | `""`        |
| `queryFrontend.service.loadBalancerSourceRanges` | queryFrontend service Load Balancer sources                      | `[]`        |
| `queryFrontend.service.externalTrafficPolicy`    | queryFrontend service external traffic policy                    | `Cluster`   |
| `queryFrontend.service.annotations`              | Additional custom annotations for queryFrontend service          | `{}`        |
| `queryFrontend.service.extraPorts`               | Extra ports to expose in the queryFrontend service               | `[]`        |
| `queryFrontend.service.headless.annotations`     | Annotations for the headless service.                            | `{}`        |

### Query Scheduler Deployment Parameters

| Name                                                   | Description                                                                                              | Value           |
| ------------------------------------------------------ | -------------------------------------------------------------------------------------------------------- | --------------- |
| `queryScheduler.extraEnvVars`                          | Array with extra environment variables to add to queryScheduler nodes                                    | `[]`            |
| `queryScheduler.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for queryScheduler nodes                            | `""`            |
| `queryScheduler.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for queryScheduler nodes                               | `""`            |
| `queryScheduler.command`                               | Override default container command (useful when using custom images)                                     | `[]`            |
| `queryScheduler.args`                                  | Override default container args (useful when using custom images)                                        | `[]`            |
| `queryScheduler.replicaCount`                          | Number of queryScheduler replicas to deploy                                                              | `1`             |
| `queryScheduler.livenessProbe.enabled`                 | Enable livenessProbe on queryScheduler nodes                                                             | `true`          |
| `queryScheduler.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                  | `10`            |
| `queryScheduler.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                         | `10`            |
| `queryScheduler.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                        | `1`             |
| `queryScheduler.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                      | `3`             |
| `queryScheduler.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                      | `1`             |
| `queryScheduler.minReadySeconds`                       | Minimum time to wait before performing readiness check                                                   | `10`            |
| `queryScheduler.readinessProbe.enabled`                | Enable readinessProbe on queryScheduler nodes                                                            | `true`          |
| `queryScheduler.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                 | `10`            |
| `queryScheduler.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                        | `10`            |
| `queryScheduler.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                       | `1`             |
| `queryScheduler.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                     | `3`             |
| `queryScheduler.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                     | `1`             |
| `queryScheduler.startupProbe.enabled`                  | Enable startupProbe on queryScheduler containers                                                         | `false`         |
| `queryScheduler.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                   | `30`            |
| `queryScheduler.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                          | `10`            |
| `queryScheduler.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                         | `1`             |
| `queryScheduler.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                       | `15`            |
| `queryScheduler.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                       | `1`             |
| `queryScheduler.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                      | `{}`            |
| `queryScheduler.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                     | `{}`            |
| `queryScheduler.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                       | `{}`            |
| `queryScheduler.resources.limits`                      | The resources limits for the queryScheduler containers                                                   | `{}`            |
| `queryScheduler.resources.requests`                    | The requested resources for the queryScheduler containers                                                | `{}`            |
| `queryScheduler.podSecurityContext.enabled`            | Enabled queryScheduler pods' Security Context                                                            | `true`          |
| `queryScheduler.podSecurityContext.fsGroup`            | Set queryScheduler pod's Security Context fsGroup                                                        | `1001`          |
| `queryScheduler.containerSecurityContext.enabled`      | Enabled queryScheduler containers' Security Context                                                      | `true`          |
| `queryScheduler.containerSecurityContext.runAsUser`    | Set queryScheduler containers' Security Context runAsUser                                                | `1001`          |
| `queryScheduler.containerSecurityContext.runAsNonRoot` | Set queryScheduler containers' Security Context runAsNonRoot                                             | `true`          |
| `queryScheduler.lifecycleHooks`                        | for the queryScheduler container(s) to automate configuration before or after startup                    | `{}`            |
| `queryScheduler.hostAliases`                           | queryScheduler pods host aliases                                                                         | `[]`            |
| `queryScheduler.podLabels`                             | Extra labels for queryScheduler pods                                                                     | `{}`            |
| `queryScheduler.podAnnotations`                        | Annotations for queryScheduler pods                                                                      | `{}`            |
| `queryScheduler.podAffinityPreset`                     | Pod affinity preset. Ignored if `queryScheduler.affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `queryScheduler.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `queryScheduler.affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `queryScheduler.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `queryScheduler.affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `queryScheduler.nodeAffinityPreset.key`                | Node label key to match. Ignored if `queryScheduler.affinity` is set                                     | `""`            |
| `queryScheduler.nodeAffinityPreset.values`             | Node label values to match. Ignored if `queryScheduler.affinity` is set                                  | `[]`            |
| `queryScheduler.affinity`                              | Affinity for queryScheduler pods assignment                                                              | `{}`            |
| `queryScheduler.nodeSelector`                          | Node labels for queryScheduler pods assignment                                                           | `{}`            |
| `queryScheduler.tolerations`                           | Tolerations for queryScheduler pods assignment                                                           | `[]`            |
| `queryScheduler.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains          | `[]`            |
| `queryScheduler.priorityClassName`                     | queryScheduler pods' priorityClassName                                                                   | `""`            |
| `queryScheduler.schedulerName`                         | Kubernetes pod scheduler registry                                                                        | `""`            |
| `queryScheduler.updateStrategy.type`                   | queryScheduler statefulset strategy type                                                                 | `RollingUpdate` |
| `queryScheduler.updateStrategy.rollingUpdate`          | queryScheduler statefulset rolling update configuration parameters                                       | `{}`            |
| `queryScheduler.extraVolumes`                          | Optionally specify extra list of additional volumes for the queryScheduler pod(s)                        | `[]`            |
| `queryScheduler.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the queryScheduler container(s)             | `[]`            |
| `queryScheduler.sidecars`                              | Add additional sidecar containers to the queryScheduler pod(s)                                           | `[]`            |
| `queryScheduler.initContainers`                        | Add additional init containers to the queryScheduler pod(s)                                              | `[]`            |

### Query Scheduler Traffic Exposure Parameters

| Name                                              | Description                                                      | Value       |
| ------------------------------------------------- | ---------------------------------------------------------------- | ----------- |
| `queryScheduler.service.type`                     | queryScheduler service type                                      | `ClusterIP` |
| `queryScheduler.service.ports.http`               | queryScheduler HTTP service port                                 | `3100`      |
| `queryScheduler.service.ports.grpc`               | queryScheduler GRPC service port                                 | `9095`      |
| `queryScheduler.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `queryScheduler.service.nodePorts.grpc`           | Node port for GRPC                                               | `""`        |
| `queryScheduler.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `queryScheduler.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `queryScheduler.service.clusterIP`                | queryScheduler service Cluster IP                                | `""`        |
| `queryScheduler.service.loadBalancerIP`           | queryScheduler service Load Balancer IP                          | `""`        |
| `queryScheduler.service.loadBalancerSourceRanges` | queryScheduler service Load Balancer sources                     | `[]`        |
| `queryScheduler.service.externalTrafficPolicy`    | queryScheduler service external traffic policy                   | `Cluster`   |
| `queryScheduler.service.annotations`              | Additional custom annotations for queryScheduler service         | `{}`        |
| `queryScheduler.service.extraPorts`               | Extra ports to expose in the queryScheduler service              | `[]`        |

### Ruler Deployment Parameters

| Name                                          | Description                                                                                     | Value           |
| --------------------------------------------- | ----------------------------------------------------------------------------------------------- | --------------- |
| `ruler.enabled`                               | Deploy ruler component                                                                          | `false`         |
| `ruler.extraEnvVars`                          | Array with extra environment variables to add to ruler nodes                                    | `[]`            |
| `ruler.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for ruler nodes                            | `""`            |
| `ruler.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for ruler nodes                               | `""`            |
| `ruler.command`                               | Override default container command (useful when using custom images)                            | `[]`            |
| `ruler.args`                                  | Override default container args (useful when using custom images)                               | `[]`            |
| `ruler.podManagementPolicy`                   | podManagementPolicy to manage scaling operation                                                 | `""`            |
| `ruler.replicaCount`                          | Number of Ruler replicas to deploy                                                              | `1`             |
| `ruler.livenessProbe.enabled`                 | Enable livenessProbe on Ruler nodes                                                             | `true`          |
| `ruler.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                         | `10`            |
| `ruler.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                | `10`            |
| `ruler.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                               | `1`             |
| `ruler.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                             | `3`             |
| `ruler.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                             | `1`             |
| `ruler.readinessProbe.enabled`                | Enable readinessProbe on Ruler nodes                                                            | `true`          |
| `ruler.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                        | `10`            |
| `ruler.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                               | `10`            |
| `ruler.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                              | `1`             |
| `ruler.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                            | `3`             |
| `ruler.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                            | `1`             |
| `ruler.startupProbe.enabled`                  | Enable startupProbe on Ruler containers                                                         | `false`         |
| `ruler.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                          | `30`            |
| `ruler.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                 | `10`            |
| `ruler.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                | `1`             |
| `ruler.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                              | `15`            |
| `ruler.startupProbe.successThreshold`         | Success threshold for startupProbe                                                              | `1`             |
| `ruler.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                             | `{}`            |
| `ruler.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                            | `{}`            |
| `ruler.customStartupProbe`                    | Custom startupProbe that overrides the default one                                              | `{}`            |
| `ruler.lifecycleHooks`                        | for the ruler container(s) to automate configuration before or after startup                    | `{}`            |
| `ruler.resources.limits`                      | The resources limits for the Ruler containers                                                   | `{}`            |
| `ruler.resources.requests`                    | The requested resources for the Ruler containers                                                | `{}`            |
| `ruler.podSecurityContext.enabled`            | Enabled Ruler pods' Security Context                                                            | `true`          |
| `ruler.podSecurityContext.fsGroup`            | Set Ruler pod's Security Context fsGroup                                                        | `1001`          |
| `ruler.containerSecurityContext.enabled`      | Enabled Ruler containers' Security Context                                                      | `true`          |
| `ruler.containerSecurityContext.runAsUser`    | Set Ruler containers' Security Context runAsUser                                                | `1001`          |
| `ruler.containerSecurityContext.runAsNonRoot` | Set Ruler containers' Security Context runAsNonRoot                                             | `true`          |
| `ruler.hostAliases`                           | ruler pods host aliases                                                                         | `[]`            |
| `ruler.podLabels`                             | Extra labels for ruler pods                                                                     | `{}`            |
| `ruler.podAnnotations`                        | Annotations for ruler pods                                                                      | `{}`            |
| `ruler.podAffinityPreset`                     | Pod affinity preset. Ignored if `ruler.affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `ruler.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `ruler.affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `ruler.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `ruler.affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `ruler.nodeAffinityPreset.key`                | Node label key to match. Ignored if `ruler.affinity` is set                                     | `""`            |
| `ruler.nodeAffinityPreset.values`             | Node label values to match. Ignored if `ruler.affinity` is set                                  | `[]`            |
| `ruler.affinity`                              | Affinity for ruler pods assignment                                                              | `{}`            |
| `ruler.nodeSelector`                          | Node labels for Ruler pods assignment                                                           | `{}`            |
| `ruler.tolerations`                           | Tolerations for Ruler pods assignment                                                           | `[]`            |
| `ruler.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains | `[]`            |
| `ruler.priorityClassName`                     | Ruler pods' priorityClassName                                                                   | `""`            |
| `ruler.schedulerName`                         | Kubernetes pod scheduler registry                                                               | `""`            |
| `ruler.updateStrategy.type`                   | Ruler statefulset strategy type                                                                 | `RollingUpdate` |
| `ruler.updateStrategy.rollingUpdate`          | Ruler statefulset rolling update configuration parameters                                       | `{}`            |
| `ruler.extraVolumes`                          | Optionally specify extra list of additional volumes for the Ruler pod(s)                        | `[]`            |
| `ruler.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the ruler container(s)             | `[]`            |
| `ruler.sidecars`                              | Add additional sidecar containers to the Ruler pod(s)                                           | `[]`            |
| `ruler.initContainers`                        | Add additional init containers to the Ruler pod(s)                                              | `[]`            |

### Ruler Persistence Parameters

| Name                             | Description                                                          | Value               |
| -------------------------------- | -------------------------------------------------------------------- | ------------------- |
| `ruler.persistence.enabled`      | Enable persistence in Ruler instances                                | `true`              |
| `ruler.persistence.storageClass` | PVC Storage Class for Memcached data volume                          | `""`                |
| `ruler.persistence.subPath`      | The subdirectory of the volume to mount to                           | `""`                |
| `ruler.persistence.accessModes`  | PVC Access modes                                                     | `["ReadWriteOnce"]` |
| `ruler.persistence.size`         | PVC Storage Request for Memcached data volume                        | `8Gi`               |
| `ruler.persistence.annotations`  | Additional PVC annotations                                           | `{}`                |
| `ruler.persistence.selector`     | Selector to match an existing Persistent Volume for Ruler's data PVC | `{}`                |

### Ruler Traffic Exposure Parameters

| Name                                     | Description                                                      | Value       |
| ---------------------------------------- | ---------------------------------------------------------------- | ----------- |
| `ruler.service.type`                     | Ruler service type                                               | `ClusterIP` |
| `ruler.service.ports.http`               | Ruler HTTP service port                                          | `3100`      |
| `ruler.service.ports.grpc`               | Ruler GRPC service port                                          | `9095`      |
| `ruler.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `ruler.service.nodePorts.grpc`           | Node port for GRPC                                               | `""`        |
| `ruler.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `ruler.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `ruler.service.clusterIP`                | Ruler service Cluster IP                                         | `""`        |
| `ruler.service.loadBalancerIP`           | Ruler service Load Balancer IP                                   | `""`        |
| `ruler.service.loadBalancerSourceRanges` | Ruler service Load Balancer sources                              | `[]`        |
| `ruler.service.externalTrafficPolicy`    | Ruler service external traffic policy                            | `Cluster`   |
| `ruler.service.annotations`              | Additional custom annotations for Ruler service                  | `{}`        |
| `ruler.service.extraPorts`               | Extra ports to expose in the Ruler service                       | `[]`        |

### table-manager Deployment Parameters

| Name                                                 | Description                                                                                            | Value           |
| ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | --------------- |
| `tableManager.enabled`                               | Deploy table-manager                                                                                   | `false`         |
| `tableManager.extraEnvVars`                          | Array with extra environment variables to add to tableManager nodes                                    | `[]`            |
| `tableManager.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for tableManager nodes                            | `""`            |
| `tableManager.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for tableManager nodes                               | `""`            |
| `tableManager.command`                               | Override default container command (useful when using custom images)                                   | `[]`            |
| `tableManager.args`                                  | Override default container args (useful when using custom images)                                      | `[]`            |
| `tableManager.replicaCount`                          | Number of table-manager replicas to deploy                                                             | `1`             |
| `tableManager.livenessProbe.enabled`                 | Enable livenessProbe on table-manager nodes                                                            | `true`          |
| `tableManager.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                | `10`            |
| `tableManager.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                       | `10`            |
| `tableManager.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                      | `1`             |
| `tableManager.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                    | `3`             |
| `tableManager.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                    | `1`             |
| `tableManager.readinessProbe.enabled`                | Enable readinessProbe on table-manager nodes                                                           | `true`          |
| `tableManager.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                               | `10`            |
| `tableManager.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                      | `10`            |
| `tableManager.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                     | `1`             |
| `tableManager.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                   | `3`             |
| `tableManager.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                   | `1`             |
| `tableManager.startupProbe.enabled`                  | Enable startupProbe on table-manager containers                                                        | `false`         |
| `tableManager.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                 | `30`            |
| `tableManager.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                        | `10`            |
| `tableManager.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                       | `1`             |
| `tableManager.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                     | `15`            |
| `tableManager.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                     | `1`             |
| `tableManager.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                    | `{}`            |
| `tableManager.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                   | `{}`            |
| `tableManager.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                     | `{}`            |
| `tableManager.resources.limits`                      | The resources limits for the tableManager containers                                                   | `{}`            |
| `tableManager.resources.requests`                    | The requested resources for the tableManager containers                                                | `{}`            |
| `tableManager.podSecurityContext.enabled`            | Enabled table-manager pods' Security Context                                                           | `true`          |
| `tableManager.podSecurityContext.fsGroup`            | Set table-manager pod's Security Context fsGroup                                                       | `1001`          |
| `tableManager.containerSecurityContext.enabled`      | Enabled table-manager containers' Security Context                                                     | `true`          |
| `tableManager.containerSecurityContext.runAsUser`    | Set table-manager containers' Security Context runAsUser                                               | `1001`          |
| `tableManager.containerSecurityContext.runAsNonRoot` | Set table-manager containers' Security Context runAsNonRoot                                            | `true`          |
| `tableManager.lifecycleHooks`                        | for the tableManager container(s) to automate configuration before or after startup                    | `{}`            |
| `tableManager.hostAliases`                           | tableManager pods host aliases                                                                         | `[]`            |
| `tableManager.podLabels`                             | Extra labels for tableManager pods                                                                     | `{}`            |
| `tableManager.podAnnotations`                        | Annotations for tableManager pods                                                                      | `{}`            |
| `tableManager.podAffinityPreset`                     | Pod affinity preset. Ignored if `tableManager.affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `tableManager.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `tableManager.affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `tableManager.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `tableManager.affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `tableManager.nodeAffinityPreset.key`                | Node label key to match. Ignored if `tableManager.affinity` is set                                     | `""`            |
| `tableManager.nodeAffinityPreset.values`             | Node label values to match. Ignored if `tableManager.affinity` is set                                  | `[]`            |
| `tableManager.affinity`                              | Affinity for table-manager pods assignment                                                             | `{}`            |
| `tableManager.nodeSelector`                          | Node labels for table-manager pods assignment                                                          | `{}`            |
| `tableManager.tolerations`                           | Tolerations for table-manager pods assignment                                                          | `[]`            |
| `tableManager.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains        | `[]`            |
| `tableManager.priorityClassName`                     | table-manager pods' priorityClassName                                                                  | `""`            |
| `tableManager.schedulerName`                         | Kubernetes pod scheduler registry                                                                      | `""`            |
| `tableManager.updateStrategy.type`                   | table-manager statefulset strategy type                                                                | `RollingUpdate` |
| `tableManager.updateStrategy.rollingUpdate`          | table-manager statefulset rolling update configuration parameters                                      | `{}`            |
| `tableManager.extraVolumes`                          | Optionally specify extra list of additional volumes for the table-manager pod(s)                       | `[]`            |
| `tableManager.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the table-manager container(s)            | `[]`            |
| `tableManager.sidecars`                              | Add additional sidecar containers to the table-manager pod(s)                                          | `[]`            |
| `tableManager.initContainers`                        | Add additional init containers to the table-manager pod(s)                                             | `[]`            |

### table-manager Traffic Exposure Parameters

| Name                                            | Description                                                      | Value       |
| ----------------------------------------------- | ---------------------------------------------------------------- | ----------- |
| `tableManager.service.type`                     | table-manager service type                                       | `ClusterIP` |
| `tableManager.service.ports.http`               | table-manager HTTP service port                                  | `3100`      |
| `tableManager.service.ports.grpc`               | table-manager GRPC service port                                  | `9095`      |
| `tableManager.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `tableManager.service.nodePorts.grpc`           | Node port for GRPC                                               | `""`        |
| `tableManager.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `tableManager.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `tableManager.service.clusterIP`                | table-manager service Cluster IP                                 | `""`        |
| `tableManager.service.loadBalancerIP`           | table-manager service Load Balancer IP                           | `""`        |
| `tableManager.service.loadBalancerSourceRanges` | table-manager service Load Balancer sources                      | `[]`        |
| `tableManager.service.externalTrafficPolicy`    | table-manager service external traffic policy                    | `Cluster`   |
| `tableManager.service.annotations`              | Additional custom annotations for table-manager service          | `{}`        |
| `tableManager.service.extraPorts`               | Extra ports to expose in the table-manager service               | `[]`        |

### Promtail Deployment Parameters

| Name                                             | Description                                                                                                      | Value                |
| ------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------- | -------------------- |
| `promtail.enabled`                               | Deploy promtail                                                                                                  | `true`               |
| `promtail.image.registry`                        | Grafana Promtail image registry                                                                                  | `docker.io`          |
| `promtail.image.repository`                      | Grafana Promtail image repository                                                                                | `bitnami/promtail`   |
| `promtail.image.tag`                             | Grafana Promtail image tag (immutable tags are recommended)                                                      | `2.8.2-debian-11-r5` |
| `promtail.image.digest`                          | Grafana Promtail image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                 |
| `promtail.image.pullPolicy`                      | Grafana Promtail image pull policy                                                                               | `IfNotPresent`       |
| `promtail.image.pullSecrets`                     | Grafana Promtail image pull secrets                                                                              | `[]`                 |
| `promtail.extraEnvVars`                          | Array with extra environment variables to add to promtail nodes                                                  | `[]`                 |
| `promtail.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for promtail nodes                                          | `""`                 |
| `promtail.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for promtail nodes                                             | `""`                 |
| `promtail.command`                               | Override default container command (useful when using custom images)                                             | `[]`                 |
| `promtail.args`                                  | Override default container args (useful when using custom images)                                                | `[]`                 |
| `promtail.containerPorts.http`                   | Promtail HTTP port                                                                                               | `8080`               |
| `promtail.livenessProbe.enabled`                 | Enable livenessProbe on Promtail nodes                                                                           | `true`               |
| `promtail.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                          | `10`                 |
| `promtail.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                                 | `10`                 |
| `promtail.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                                | `1`                  |
| `promtail.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                              | `3`                  |
| `promtail.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                              | `1`                  |
| `promtail.readinessProbe.enabled`                | Enable readinessProbe on Promtail nodes                                                                          | `true`               |
| `promtail.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                         | `10`                 |
| `promtail.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                                | `10`                 |
| `promtail.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                               | `1`                  |
| `promtail.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                             | `3`                  |
| `promtail.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                             | `1`                  |
| `promtail.startupProbe.enabled`                  | Enable startupProbe on Promtail containers                                                                       | `false`              |
| `promtail.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                           | `30`                 |
| `promtail.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                                  | `10`                 |
| `promtail.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                                 | `1`                  |
| `promtail.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                               | `15`                 |
| `promtail.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                               | `1`                  |
| `promtail.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                              | `{}`                 |
| `promtail.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                             | `{}`                 |
| `promtail.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                               | `{}`                 |
| `promtail.lifecycleHooks`                        | for the promtail container(s) to automate configuration before or after startup                                  | `{}`                 |
| `promtail.resources.limits`                      | The resources limits for the Promtail containers                                                                 | `{}`                 |
| `promtail.resources.requests`                    | The requested resources for the Promtail containers                                                              | `{}`                 |
| `promtail.podSecurityContext.enabled`            | Enabled Promtail pods' Security Context                                                                          | `true`               |
| `promtail.podSecurityContext.fsGroup`            | Set Promtail pod's Security Context fsGroup                                                                      | `0`                  |
| `promtail.containerSecurityContext.enabled`      | Enabled Promtail containers' Security Context                                                                    | `true`               |
| `promtail.containerSecurityContext.runAsUser`    | Set Promtail containers' Security Context runAsUser                                                              | `0`                  |
| `promtail.containerSecurityContext.runAsNonRoot` | Set Promtail containers' Security Context runAsNonRoot                                                           | `false`              |
| `promtail.hostAliases`                           | promtail pods host aliases                                                                                       | `[]`                 |
| `promtail.podLabels`                             | Extra labels for promtail pods                                                                                   | `{}`                 |
| `promtail.podAnnotations`                        | Annotations for promtail pods                                                                                    | `{}`                 |
| `promtail.podAffinityPreset`                     | Pod affinity preset. Ignored if `promtail.affinity` is set. Allowed values: `soft` or `hard`                     | `""`                 |
| `promtail.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `promtail.affinity` is set. Allowed values: `soft` or `hard`                | `soft`               |
| `promtail.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `promtail.affinity` is set. Allowed values: `soft` or `hard`               | `""`                 |
| `promtail.nodeAffinityPreset.key`                | Node label key to match. Ignored if `promtail.affinity` is set                                                   | `""`                 |
| `promtail.nodeAffinityPreset.values`             | Node label values to match. Ignored if `promtail.affinity` is set                                                | `[]`                 |
| `promtail.affinity`                              | Affinity for promtail pods assignment                                                                            | `{}`                 |
| `promtail.nodeSelector`                          | Node labels for Promtail pods assignment                                                                         | `{}`                 |
| `promtail.tolerations`                           | Tolerations for Promtail pods assignment                                                                         | `[]`                 |
| `promtail.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains                  | `[]`                 |
| `promtail.priorityClassName`                     | Promtail pods' priorityClassName                                                                                 | `""`                 |
| `promtail.schedulerName`                         | Kubernetes pod scheduler registry                                                                                | `""`                 |
| `promtail.updateStrategy.type`                   | Promtail statefulset strategy type                                                                               | `RollingUpdate`      |
| `promtail.updateStrategy.rollingUpdate`          | Promtail statefulset rolling update configuration parameters                                                     | `{}`                 |
| `promtail.extraVolumes`                          | Optionally specify extra list of additional volumes for the Promtail pod(s)                                      | `[]`                 |
| `promtail.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the promtail container(s)                           | `[]`                 |
| `promtail.sidecars`                              | Add additional sidecar containers to the Promtail pod(s)                                                         | `[]`                 |
| `promtail.initContainers`                        | Add additional init containers to the Promtail pod(s)                                                            | `[]`                 |
| `promtail.configuration`                         | Promtail configuration                                                                                           | `""`                 |
| `promtail.existingSecret`                        | Name of a Secret that contains the Promtail configuration                                                        | `""`                 |
| `promtail.logLevel`                              | Promtail logging level                                                                                           | `info`               |

### Promtail Traffic Exposure Parameters

| Name                                                   | Description                                                                     | Value       |
| ------------------------------------------------------ | ------------------------------------------------------------------------------- | ----------- |
| `promtail.service.type`                                | Promtail service type                                                           | `ClusterIP` |
| `promtail.service.ports.http`                          | Promtail HTTP service port                                                      | `3100`      |
| `promtail.service.nodePorts.http`                      | Node port for HTTP                                                              | `""`        |
| `promtail.service.sessionAffinityConfig`               | Additional settings for the sessionAffinity                                     | `{}`        |
| `promtail.service.sessionAffinity`                     | Control where client requests go, to the same pod or round-robin                | `None`      |
| `promtail.service.clusterIP`                           | Promtail service Cluster IP                                                     | `""`        |
| `promtail.service.loadBalancerIP`                      | Promtail service Load Balancer IP                                               | `""`        |
| `promtail.service.loadBalancerSourceRanges`            | Promtail service Load Balancer sources                                          | `[]`        |
| `promtail.service.externalTrafficPolicy`               | Promtail service external traffic policy                                        | `Cluster`   |
| `promtail.service.annotations`                         | Additional custom annotations for Promtail service                              | `{}`        |
| `promtail.service.extraPorts`                          | Extra ports to expose in the Promtail service                                   | `[]`        |
| `promtail.rbac.create`                                 | Create RBAC rules                                                               | `true`      |
| `promtail.serviceAccount.create`                       | Enable creation of ServiceAccount for Promtail pods                             | `true`      |
| `promtail.serviceAccount.name`                         | The name of the ServiceAccount to use                                           | `""`        |
| `promtail.serviceAccount.automountServiceAccountToken` | Allows auto mount of ServiceAccountToken on the promtail.serviceAccount.created | `true`      |
| `promtail.serviceAccount.annotations`                  | Additional custom annotations for the ServiceAccount                            | `{}`        |

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
| `serviceAccount.create`                       | Enable creation of ServiceAccount for Loki pods                        | `false` |
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

### External Memcached (Chunks) Parameters

| Name                           | Description                                   | Value   |
| ------------------------------ | --------------------------------------------- | ------- |
| `externalMemcachedChunks.host` | Host of a running external memcached instance | `""`    |
| `externalMemcachedChunks.port` | Port of a running external memcached instance | `11211` |

### Memcached Sub-chart Parameters (Chunks)

| Name                                      | Description                                                                                               | Value                 |
| ----------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------- |
| `memcachedchunks.enabled`                 | Deploy memcached sub-chart                                                                                | `true`                |
| `memcachedchunks.image.registry`          | Memcached image registry                                                                                  | `docker.io`           |
| `memcachedchunks.image.repository`        | Memcached image repository                                                                                | `bitnami/memcached`   |
| `memcachedchunks.image.tag`               | Memcached image tag (immutable tags are recommended)                                                      | `1.6.20-debian-11-r2` |
| `memcachedchunks.image.digest`            | Memcached image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                  |
| `memcachedchunks.nameOverride`            | override the subchart name                                                                                | `""`                  |
| `memcachedchunks.architecture`            | Memcached architecture                                                                                    | `high-availability`   |
| `memcachedchunks.service.ports.memcached` | Memcached service port                                                                                    | `11211`               |

### External Memcached (Frontend) Parameters

| Name                             | Description                                   | Value   |
| -------------------------------- | --------------------------------------------- | ------- |
| `externalMemcachedFrontend.host` | Host of a running external memcached instance | `""`    |
| `externalMemcachedFrontend.port` | Port of a running external memcached instance | `11211` |

### Memcached Sub-chart Parameters (Frontend)

| Name                                        | Description                                                                                               | Value                 |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------- |
| `memcachedfrontend.enabled`                 | Deploy memcached sub-chart                                                                                | `true`                |
| `memcachedfrontend.image.registry`          | Memcached image registry                                                                                  | `docker.io`           |
| `memcachedfrontend.image.repository`        | Memcached image repository                                                                                | `bitnami/memcached`   |
| `memcachedfrontend.image.tag`               | Memcached image tag (immutable tags are recommended)                                                      | `1.6.20-debian-11-r2` |
| `memcachedfrontend.image.digest`            | Memcached image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                  |
| `memcachedfrontend.architecture`            | Memcached architecture                                                                                    | `high-availability`   |
| `memcachedfrontend.nameOverride`            | override the subchart name                                                                                | `""`                  |
| `memcachedfrontend.service.ports.memcached` | Memcached service port                                                                                    | `11211`               |

### External Memcached (Index-Queries) Parameters

| Name                                 | Description                                   | Value   |
| ------------------------------------ | --------------------------------------------- | ------- |
| `externalMemcachedIndexQueries.host` | Host of a running external memcached instance | `""`    |
| `externalMemcachedIndexQueries.port` | Port of a running external memcached instance | `11211` |

### Memcached Sub-chart Parameters (Index-Queries)

| Name                                            | Description                                                                                               | Value                 |
| ----------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------- |
| `memcachedindexqueries.enabled`                 | Deploy memcached sub-chart                                                                                | `true`                |
| `memcachedindexqueries.image.registry`          | Memcached image registry                                                                                  | `docker.io`           |
| `memcachedindexqueries.image.repository`        | Memcached image repository                                                                                | `bitnami/memcached`   |
| `memcachedindexqueries.image.tag`               | Memcached image tag (immutable tags are recommended)                                                      | `1.6.20-debian-11-r2` |
| `memcachedindexqueries.image.digest`            | Memcached image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                  |
| `memcachedindexqueries.architecture`            | Memcached architecture                                                                                    | `high-availability`   |
| `memcachedindexqueries.nameOverride`            | override the subchart name                                                                                | `""`                  |
| `memcachedindexqueries.service.ports.memcached` | Memcached service port                                                                                    | `11211`               |

### External Memcached (IndexWrites) Parameters

| Name                                | Description                                   | Value   |
| ----------------------------------- | --------------------------------------------- | ------- |
| `externalMemcachedIndexWrites.host` | Host of a running external memcached instance | `""`    |
| `externalMemcachedIndexWrites.port` | Port of a running external memcached instance | `11211` |

### Memcached Sub-chart Parameters (Index-Writes)

| Name                                           | Description                                                                                               | Value                 |
| ---------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------- |
| `memcachedindexwrites.enabled`                 | Deploy memcached sub-chart                                                                                | `false`               |
| `memcachedindexwrites.image.registry`          | Memcached image registry                                                                                  | `docker.io`           |
| `memcachedindexwrites.image.repository`        | Memcached image repository                                                                                | `bitnami/memcached`   |
| `memcachedindexwrites.image.tag`               | Memcached image tag (immutable tags are recommended)                                                      | `1.6.20-debian-11-r2` |
| `memcachedindexwrites.image.digest`            | Memcached image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                  |
| `memcachedindexwrites.architecture`            | Memcached architecture                                                                                    | `high-availability`   |
| `memcachedindexwrites.nameOverride`            | override the subchart name                                                                                | `""`                  |
| `memcachedindexwrites.service.ports.memcached` | Memcached service port                                                                                    | `11211`               |

See <https://github.com/bitnami-labs/readme-generator-for-helm> to create the table.

The above parameters map to the env variables defined in [bitnami/grafana-loki](https://github.com/bitnami/containers/tree/main/bitnami/grafana-loki). For more information please refer to the [bitnami/grafana-loki](https://github.com/bitnami/containers/tree/main/bitnami/grafana-loki) image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set loki.traces.jaeger.grpc=true \
  oci://registry-1.docker.io/bitnamicharts/grafana-loki
```

The above command enables the Jaeger GRPC traces.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/grafana-loki
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Loki configuration

The loki configuration file `loki.yaml` is shared across the different components: `distributor`, `compactor`, `ingester`, `querier` and `queryFrontend`. This is set in the `loki.configuration` value. Check the official [Loki Grafana documentation](https://grafana.com/docs/loki/latest/configuration/) for the list of possible configurations.

## Persistence

### Limitation

This chart does not function fully when using local filesystem as a persistence store. When using a local filesystem as a persistence store, querying will not be possible (or limited to the ingesters' in-memory caches). For a fully functional deployment of this helm chart, an object storage backend is required.

### Data

The [Bitnami grafana-loki](https://github.com/bitnami/containers/tree/main/bitnami/grafana-loki) image stores the grafana-loki `ingester` data at the `/bitnami` path of the container. Persistent Volume Claims are used to keep the data across deployments.

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

If additional containers are needed in the same pod as grafana-loki (such as additional metrics or logging exporters), they can be defined using the `sidecars` parameter inside each of the subsections: `distributor`, `compactor`, `ingester`, `querier`, `queryFrontend` and `vulture` . If these sidecars export extra ports, extra port definitions can be added using the `service.extraPorts` parameter. [Learn more about configuring and using sidecar containers](https://docs.bitnami.com/kubernetes/infrastructure/grafana-loki/configuration/configure-sidecar-init-containers/).

### Pod affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, use one of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters inside each of the subsections: `distributor`, `compactor`, `ingester`, `querier`, `queryFrontend` and `vulture`.

### External cache support

You may want to have Grafana Loki connect to an external Memcached rather than installing one inside your cluster. Typical reasons for this are to use a managed cache service, or to share a common cache server for all your applications. To achieve this, the chart allows you to specify credentials for an external database with the [`externalMemcached` parameter](#parameters). You should also disable the Memcached installation with the `memcached.enabled` option. Here is an example:

```console
memcached.enabled=false
externalMemcached.host=myexternalhost
externalMemcached.port=11211
```

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

## Upgrading

### To 1.0.0

This major release renames several values in this chart and adds missing features, in order to be inline with the rest of assets in the Bitnami charts repository.

- `loki.containerPort`, `loki.grpcContainerPort` and `loki.gossipRing.containerPort` have been regrouped under the `loki.containerPorts` map.
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