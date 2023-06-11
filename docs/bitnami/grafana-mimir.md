<!--- app-name: Grafana Mimir -->

# Grafana Mimir packaged by Bitnami

Grafana Mimir is an open source, horizontally scalable, highly available, multi-tenant, long-term storage for Prometheus.

[Overview of Grafana Mimir](https://grafana.com/oss/mimir/)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/grafana-mimir
```

## Introduction

Bitnami charts for Helm are carefully engineered, actively maintained and are the quickest and easiest way to deploy containers on a Kubernetes cluster that are ready to handle production workloads.

This chart bootstraps a [Grafana Mimir](https://github.com/grafana/mimir) Deployment in a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

[Learn more about the default configuration of the chart](https://docs.bitnami.com/kubernetes/infrastructure/grafana-mimir/get-started/).

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/grafana-mimir
```

The command deploys grafana-mimir on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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
| `nameOverride`           | String to partially override common.names.name                                          | `""`            |
| `fullnameOverride`       | String to fully override common.names.fullname                                          | `""`            |
| `namespaceOverride`      | String to fully override common.names.namespace                                         | `""`            |
| `commonLabels`           | Labels to add to all deployed objects                                                   | `{}`            |
| `commonAnnotations`      | Annotations to add to all deployed objects                                              | `{}`            |
| `clusterDomain`          | Kubernetes cluster domain name                                                          | `cluster.local` |
| `extraDeploy`            | Array of extra objects to deploy with the release                                       | `[]`            |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden) | `false`         |
| `diagnosticMode.command` | Command to override all containers in the deployment                                    | `["sleep"]`     |
| `diagnosticMode.args`    | Args to override all containers in the deployment                                       | `["infinity"]`  |

### Common Grafana Mimir Parameters

| Name                                   | Description                                                                                                                                              | Value                    |
| -------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `mimir.image.registry`                 | Grafana Mimir image registry                                                                                                                             | `docker.io`              |
| `mimir.image.repository`               | Grafana Mimir image repository                                                                                                                           | `bitnami/grafana-mimir`  |
| `mimir.image.tag`                      | Grafana Mimir image tag (immutable tags are recommended)                                                                                                 | `2.8.0-debian-11-r6`     |
| `mimir.image.digest`                   | Grafana Mimir image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                     |
| `mimir.image.pullPolicy`               | Grafana Mimir image pull policy                                                                                                                          | `IfNotPresent`           |
| `mimir.image.pullSecrets`              | Grafana Mimir image pull secrets                                                                                                                         | `[]`                     |
| `mimir.dataDir`                        | path to the Mimir data directory                                                                                                                         | `/bitnami/grafana-mimir` |
| `mimir.configuration`                  | Mimir components configuration                                                                                                                           | `""`                     |
| `mimir.overrideConfiguration`          | Mimir components configuration override. Values defined here takes precedence over mimir.configuration                                                   | `{}`                     |
| `mimir.existingConfigmap`              | Name of a ConfigMap with the Mimir configuration                                                                                                         | `""`                     |
| `mimir.httpPrefix.prometheus`          | HTTP URL path under which the Prometheus api will be served.                                                                                             | `/prometheus`            |
| `mimir.httpPrefix.alertmanager`        | HTTP URL path under which the Alertmanager ui and api will be served.                                                                                    | `/alertmanager`          |
| `mimir.containerPorts.http`            | Grafana Mimir HTTP container port. This configuration is set mimir.yaml config file and is common for all Grafana Mimir components.                      | `8080`                   |
| `mimir.containerPorts.grpc`            | Grafana Mimir GRPC container port. This configuration is set mimir.yaml config file and is common for all Grafana Mimircomponents.                       | `9095`                   |
| `mimir.containerPorts.gossipRing`      | Grafana Mimir memberlist container port. This configuration is set mimir.yaml config file and is common for all Grafana Mimir components.                | `7946`                   |
| `mimir.gossipRing.service.ports.http`  | Gossip Ring HTTP headless service port                                                                                                                   | `7946`                   |
| `mimir.gossipRing.service.annotations` | Additional custom annotations for Gossip Ring headless service                                                                                           | `{}`                     |
| `mimir.blockStorage.backend`           | Backend storage to use. NOTE: if minio.enable == true, this configuration will be ignored.                                                               | `s3`                     |
| `mimir.blockStorage.config`            | Configures connection to the backend store. NOTE: if minio.enable == true, this configuration will be ignored.                                           | `{}`                     |

### Alertmanager Deployment Parameters

| Name                                                 | Description                                                                                            | Value               |
| ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ------------------- |
| `alertmanager.enabled`                               | Enable alertmanager deployment                                                                         | `false`             |
| `alertmanager.extraEnvVars`                          | Array with extra environment variables to add to alertmanager nodes                                    | `[]`                |
| `alertmanager.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for alertmanager nodes                            | `""`                |
| `alertmanager.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for alertmanager nodes                               | `""`                |
| `alertmanager.command`                               | Override default container command (useful when using custom images)                                   | `[]`                |
| `alertmanager.args`                                  | Override default container args (useful when using custom images)                                      | `[]`                |
| `alertmanager.extraArgs`                             | Add additional args to the default container args (useful to override configuration)                   | `[]`                |
| `alertmanager.replicaCount`                          | Number of Alertmanager replicas to deploy                                                              | `1`                 |
| `alertmanager.podManagementPolicy`                   | Statefulset Pod management policy, it needs to be Parallel to be able to complete the cluster join     | `OrderedReady`      |
| `alertmanager.livenessProbe.enabled`                 | Enable livenessProbe on Alertmanager nodes                                                             | `true`              |
| `alertmanager.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                | `30`                |
| `alertmanager.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                       | `10`                |
| `alertmanager.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                      | `1`                 |
| `alertmanager.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                    | `3`                 |
| `alertmanager.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                    | `1`                 |
| `alertmanager.readinessProbe.enabled`                | Enable readinessProbe on Alertmanager nodes                                                            | `true`              |
| `alertmanager.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                               | `30`                |
| `alertmanager.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                      | `10`                |
| `alertmanager.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                     | `1`                 |
| `alertmanager.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                   | `3`                 |
| `alertmanager.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                   | `1`                 |
| `alertmanager.startupProbe.enabled`                  | Enable startupProbe on Alertmanager containers                                                         | `false`             |
| `alertmanager.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                 | `30`                |
| `alertmanager.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                        | `10`                |
| `alertmanager.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                       | `1`                 |
| `alertmanager.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                     | `15`                |
| `alertmanager.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                     | `1`                 |
| `alertmanager.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                    | `{}`                |
| `alertmanager.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                   | `{}`                |
| `alertmanager.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                     | `{}`                |
| `alertmanager.resources.limits`                      | The resources limits for the alertmanager containers                                                   | `{}`                |
| `alertmanager.resources.requests`                    | The requested resources for the alertmanager containers                                                | `{}`                |
| `alertmanager.podSecurityContext.enabled`            | Enabled Alertmanager pods' Security Context                                                            | `true`              |
| `alertmanager.podSecurityContext.fsGroup`            | Set Alertmanager pod's Security Context fsGroup                                                        | `1001`              |
| `alertmanager.containerSecurityContext.enabled`      | Enabled Alertmanager containers' Security Context                                                      | `true`              |
| `alertmanager.containerSecurityContext.runAsUser`    | Set Alertmanager containers' Security Context runAsUser                                                | `1001`              |
| `alertmanager.containerSecurityContext.runAsNonRoot` | Set Alertmanager containers' Security Context runAsNonRoot                                             | `true`              |
| `alertmanager.lifecycleHooks`                        | for the ingester container(s) to automate configuration before or after startup                        | `{}`                |
| `alertmanager.hostAliases`                           | ingester pods host aliases                                                                             | `[]`                |
| `alertmanager.podLabels`                             | Extra labels for ingester pods                                                                         | `{}`                |
| `alertmanager.podAnnotations`                        | Annotations for ingester pods                                                                          | `{}`                |
| `alertmanager.podAffinityPreset`                     | Pod affinity preset. Ignored if `alertmanager.affinity` is set. Allowed values: `soft` or `hard`       | `""`                |
| `alertmanager.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `alertmanager.affinity` is set. Allowed values: `soft` or `hard`  | `soft`              |
| `alertmanager.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `alertmanager.affinity` is set. Allowed values: `soft` or `hard` | `""`                |
| `alertmanager.nodeAffinityPreset.key`                | Node label key to match. Ignored if `alertmanager.affinity` is set                                     | `""`                |
| `alertmanager.nodeAffinityPreset.values`             | Node label values to match. Ignored if `alertmanager.affinity` is set                                  | `[]`                |
| `alertmanager.affinity`                              | Affinity for Alertmanager pods assignment                                                              | `{}`                |
| `alertmanager.nodeSelector`                          | Node labels for Alertmanager pods assignment                                                           | `{}`                |
| `alertmanager.tolerations`                           | Tolerations for Alertmanager pods assignment                                                           | `[]`                |
| `alertmanager.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains        | `[]`                |
| `alertmanager.priorityClassName`                     | Alertmanager pods' priorityClassName                                                                   | `""`                |
| `alertmanager.schedulerName`                         | Kubernetes pod scheduler registry                                                                      | `""`                |
| `alertmanager.terminationGracePeriodSeconds`         | Seconds pod needs to terminate gracefully                                                              | `""`                |
| `alertmanager.updateStrategy.type`                   | Alertmanager statefulset strategy type                                                                 | `RollingUpdate`     |
| `alertmanager.updateStrategy.rollingUpdate`          | Alertmanager statefulset rolling update configuration parameters                                       | `{}`                |
| `alertmanager.extraVolumes`                          | Optionally specify extra list of additional volumes for the Alertmanager pod(s)                        | `[]`                |
| `alertmanager.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Alertmanager container(s)             | `[]`                |
| `alertmanager.sidecars`                              | Add additional sidecar containers to the Alertmanager pod(s)                                           | `[]`                |
| `alertmanager.initContainers`                        | Add additional init containers to the Alertmanager pod(s)                                              | `[]`                |
| `alertmanager.persistence.enabled`                   | Enable persistence in alertmanager instances                                                           | `true`              |
| `alertmanager.persistence.storageClass`              | PVC Storage Class for alertmanager data volume                                                         | `""`                |
| `alertmanager.persistence.accessModes`               | PVC Access modes                                                                                       | `["ReadWriteOnce"]` |
| `alertmanager.persistence.size`                      | PVC Storage Request for alertmanager data volume                                                       | `8Gi`               |
| `alertmanager.persistence.annotations`               | Additional PVC annotations                                                                             | `{}`                |
| `alertmanager.persistence.selector`                  | Selector to match an existing Persistent Volume for alertmanager's data PVC                            | `{}`                |
| `alertmanager.persistence.dataSource`                | PVC data source                                                                                        | `{}`                |

### Alertmanager Traffic Exposure Parameters

| Name                                            | Description                                                                                                    | Value       |
| ----------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | ----------- |
| `alertmanager.service.type`                     | Alertmanager service type                                                                                      | `ClusterIP` |
| `alertmanager.service.ports.http`               | Alertmanager HTTP service port                                                                                 | `8080`      |
| `alertmanager.service.ports.grpc`               | Alertmanager GRPC service port                                                                                 | `9095`      |
| `alertmanager.service.nodePorts.http`           | Node port for HTTP                                                                                             | `""`        |
| `alertmanager.service.nodePorts.grpc`           | Node port for GRPC                                                                                             | `9095`      |
| `alertmanager.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                    | `{}`        |
| `alertmanager.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin                                               | `None`      |
| `alertmanager.service.clusterIP`                | Alertmanager service Cluster IP                                                                                | `""`        |
| `alertmanager.service.loadBalancerIP`           | Alertmanager service Load Balancer IP                                                                          | `""`        |
| `alertmanager.service.loadBalancerSourceRanges` | Alertmanager service Load Balancer sources                                                                     | `[]`        |
| `alertmanager.service.externalTrafficPolicy`    | Alertmanager service external traffic policy                                                                   | `Cluster`   |
| `alertmanager.service.annotations`              | Additional custom annotations for Alertmanager service                                                         | `{}`        |
| `alertmanager.service.extraPorts`               | Extra ports to expose in the Alertmanager service                                                              | `[]`        |
| `alertmanager.service.headless.annotations`     | Annotations for the headless service.                                                                          | `{}`        |
| `alertmanager.pdb.create`                       | Enable/disable a Pod Disruption Budget creation                                                                | `false`     |
| `alertmanager.pdb.minAvailable`                 | Minimum number/percentage of pods that should remain scheduled                                                 | `1`         |
| `alertmanager.pdb.maxUnavailable`               | Maximum number/percentage of pods that may be made unavailable                                                 | `""`        |
| `alertmanager.blockStorage.backend`             | Backend storage to use. NOTE: if minio.enable == true, this configuration will be ignored.                     | `s3`        |
| `alertmanager.blockStorage.config`              | Configures connection to the backend store. NOTE: if minio.enable == true, this configuration will be ignored. | `{}`        |

### Compactor Deployment Parameters

| Name                                              | Description                                                                                         | Value               |
| ------------------------------------------------- | --------------------------------------------------------------------------------------------------- | ------------------- |
| `compactor.extraEnvVars`                          | Array with extra environment variables to add to compactor nodes                                    | `[]`                |
| `compactor.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for compactor nodes                            | `""`                |
| `compactor.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for compactor nodes                               | `""`                |
| `compactor.command`                               | Override default container command (useful when using custom images)                                | `[]`                |
| `compactor.args`                                  | Override default container args (useful when using custom images)                                   | `[]`                |
| `compactor.extraArgs`                             | Add additional args to the default container args (useful to override configuration)                | `[]`                |
| `compactor.replicaCount`                          | Number of Compactor replicas to deploy                                                              | `1`                 |
| `compactor.podManagementPolicy`                   | Statefulset Pod management policy, it needs to be Parallel to be able to complete the cluster join  | `OrderedReady`      |
| `compactor.livenessProbe.enabled`                 | Enable livenessProbe on Compactor nodes                                                             | `true`              |
| `compactor.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                             | `30`                |
| `compactor.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                    | `10`                |
| `compactor.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                   | `1`                 |
| `compactor.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                 | `3`                 |
| `compactor.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                 | `1`                 |
| `compactor.readinessProbe.enabled`                | Enable readinessProbe on Compactor nodes                                                            | `true`              |
| `compactor.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                            | `30`                |
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
| `compactor.terminationGracePeriodSeconds`         | Seconds pod needs to terminate gracefully                                                           | `""`                |
| `compactor.updateStrategy.type`                   | Compactor statefulset strategy type                                                                 | `RollingUpdate`     |
| `compactor.updateStrategy.rollingUpdate`          | Compactor statefulset rolling update configuration parameters                                       | `{}`                |
| `compactor.extraVolumes`                          | Optionally specify extra list of additional volumes for the Compactor pod(s)                        | `[]`                |
| `compactor.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Compactor container(s)             | `[]`                |
| `compactor.sidecars`                              | Add additional sidecar containers to the Compactor pod(s)                                           | `[]`                |
| `compactor.initContainers`                        | Add additional init containers to the Compactor pod(s)                                              | `[]`                |
| `compactor.persistence.enabled`                   | Enable persistence in Compactor instances                                                           | `true`              |
| `compactor.persistence.storageClass`              | PVC Storage Class for Compactor data volume                                                         | `""`                |
| `compactor.persistence.accessModes`               | PVC Access modes                                                                                    | `["ReadWriteOnce"]` |
| `compactor.persistence.size`                      | PVC Storage Request for Compactor data volume                                                       | `8Gi`               |
| `compactor.persistence.annotations`               | Additional PVC annotations                                                                          | `{}`                |
| `compactor.persistence.selector`                  | Selector to match an existing Persistent Volume for Compactor's data PVC                            | `{}`                |
| `compactor.persistence.dataSource`                | PVC data source                                                                                     | `{}`                |

### Compactor Traffic Exposure Parameters

| Name                                         | Description                                                      | Value       |
| -------------------------------------------- | ---------------------------------------------------------------- | ----------- |
| `compactor.service.type`                     | Compactor service type                                           | `ClusterIP` |
| `compactor.service.ports.http`               | Compactor HTTP service port                                      | `8080`      |
| `compactor.service.ports.grpc`               | Compactor GRPC service port                                      | `9095`      |
| `compactor.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `compactor.service.nodePorts.grpc`           | Node port for GRPC                                               | `9095`      |
| `compactor.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `compactor.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `compactor.service.clusterIP`                | Compactor service Cluster IP                                     | `""`        |
| `compactor.service.loadBalancerIP`           | Compactor service Load Balancer IP                               | `""`        |
| `compactor.service.loadBalancerSourceRanges` | Compactor service Load Balancer sources                          | `[]`        |
| `compactor.service.externalTrafficPolicy`    | Compactor service external traffic policy                        | `Cluster`   |
| `compactor.service.annotations`              | Additional custom annotations for Compactor service              | `{}`        |
| `compactor.service.extraPorts`               | Extra ports to expose in the Compactor service                   | `[]`        |
| `compactor.pdb.create`                       | Enable/disable a Pod Disruption Budget creation                  | `false`     |
| `compactor.pdb.minAvailable`                 | Minimum number/percentage of pods that should remain scheduled   | `1`         |
| `compactor.pdb.maxUnavailable`               | Maximum number/percentage of pods that may be made unavailable   | `""`        |

### Distributor Deployment Parameters

| Name                                                | Description                                                                                           | Value           |
| --------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | --------------- |
| `distributor.extraEnvVars`                          | Array with extra environment variables to add to distributor nodes                                    | `[]`            |
| `distributor.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for distributor nodes                            | `""`            |
| `distributor.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for distributor nodes                               | `""`            |
| `distributor.command`                               | Override default container command (useful when using custom images)                                  | `[]`            |
| `distributor.args`                                  | Override default container args (useful when using custom images)                                     | `[]`            |
| `distributor.extraArgs`                             | Add additional args to the default container args (useful to override configuration)                  | `[]`            |
| `distributor.replicaCount`                          | Number of Distributor replicas to deploy                                                              | `1`             |
| `distributor.livenessProbe.enabled`                 | Enable livenessProbe on Distributor nodes                                                             | `true`          |
| `distributor.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                               | `30`            |
| `distributor.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                      | `10`            |
| `distributor.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                     | `1`             |
| `distributor.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                   | `3`             |
| `distributor.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                   | `1`             |
| `distributor.readinessProbe.enabled`                | Enable readinessProbe on Distributor nodes                                                            | `true`          |
| `distributor.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                              | `30`            |
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
| `distributor.terminationGracePeriodSeconds`         | Seconds pod needs to terminate gracefully                                                             | `""`            |
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
| `distributor.service.ports.http`               | Distributor HTTP service port                                    | `8080`      |
| `distributor.service.ports.grpc`               | Distributor GRPC service port                                    | `9095`      |
| `distributor.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `distributor.service.nodePorts.grpc`           | Node port for GRPC                                               | `9095`      |
| `distributor.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `distributor.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `distributor.service.clusterIP`                | Distributor service Cluster IP                                   | `""`        |
| `distributor.service.loadBalancerIP`           | Distributor service Load Balancer IP                             | `""`        |
| `distributor.service.loadBalancerSourceRanges` | Distributor service Load Balancer sources                        | `[]`        |
| `distributor.service.externalTrafficPolicy`    | Distributor service external traffic policy                      | `Cluster`   |
| `distributor.service.annotations`              | Additional custom annotations for Distributor service            | `{}`        |
| `distributor.service.extraPorts`               | Extra ports to expose in the Distributor service                 | `[]`        |
| `distributor.service.headless.annotations`     | Annotations for the headless service.                            | `{}`        |
| `distributor.pdb.create`                       | Enable/disable a Pod Disruption Budget creation                  | `false`     |
| `distributor.pdb.minAvailable`                 | Minimum number/percentage of pods that should remain scheduled   | `1`         |
| `distributor.pdb.maxUnavailable`               | Maximum number/percentage of pods that may be made unavailable   | `""`        |

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
| `gateway.ingress.enabled`                  | Enable ingress record generation for Mimir Gateway                                                                               | `false`                  |
| `gateway.ingress.pathType`                 | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `gateway.ingress.apiVersion`               | Force Ingress API version (automatically detected if not set)                                                                    | `""`                     |
| `gateway.ingress.ingressClassName`         | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                     |
| `gateway.ingress.hostname`                 | Default host for the ingress record                                                                                              | `grafana-mimir.local`    |
| `gateway.ingress.path`                     | Default path for the ingress record                                                                                              | `/`                      |
| `gateway.ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `gateway.ingress.tls`                      | Enable TLS configuration for the host defined at `ingress.hostname` parameter                                                    | `false`                  |
| `gateway.ingress.selfSigned`               | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                  |
| `gateway.ingress.extraHosts`               | An array with additional hostname(s) to be covered with the ingress record                                                       | `[]`                     |
| `gateway.ingress.extraPaths`               | An array with additional arbitrary paths that may need to be added to the ingress under the main host                            | `[]`                     |
| `gateway.ingress.extraTls`                 | TLS configuration for additional hostname(s) to be covered with this ingress record                                              | `[]`                     |
| `gateway.ingress.secrets`                  | Custom TLS certificates as secrets                                                                                               | `[]`                     |
| `gateway.pdb.create`                       | Enable/disable a Pod Disruption Budget creation                                                                                  | `false`                  |
| `gateway.pdb.minAvailable`                 | Minimum number/percentage of pods that should remain scheduled                                                                   | `1`                      |
| `gateway.pdb.maxUnavailable`               | Maximum number/percentage of pods that may be made unavailable                                                                   | `""`                     |

### Ingester Deployment Parameters

| Name                                             | Description                                                                                        | Value               |
| ------------------------------------------------ | -------------------------------------------------------------------------------------------------- | ------------------- |
| `ingester.extraEnvVars`                          | Array with extra environment variables to add to ingester nodes                                    | `[]`                |
| `ingester.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for ingester nodes                            | `""`                |
| `ingester.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for ingester nodes                               | `""`                |
| `ingester.command`                               | Override default container command (useful when using custom images)                               | `[]`                |
| `ingester.args`                                  | Override default container args (useful when using custom images)                                  | `[]`                |
| `ingester.extraArgs`                             | Add additional args to the default container args (useful to override configuration)               | `[]`                |
| `ingester.replicaCount`                          | Number of Ingester replicas to deploy                                                              | `2`                 |
| `ingester.podManagementPolicy`                   | Statefulset Pod management policy, it needs to be Parallel to be able to complete the cluster join | `OrderedReady`      |
| `ingester.livenessProbe.enabled`                 | Enable livenessProbe on Ingester nodes                                                             | `true`              |
| `ingester.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                            | `30`                |
| `ingester.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                   | `10`                |
| `ingester.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                  | `1`                 |
| `ingester.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                | `3`                 |
| `ingester.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                | `1`                 |
| `ingester.readinessProbe.enabled`                | Enable readinessProbe on Ingester nodes                                                            | `true`              |
| `ingester.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                           | `30`                |
| `ingester.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                  | `10`                |
| `ingester.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                 | `1`                 |
| `ingester.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                               | `3`                 |
| `ingester.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                               | `1`                 |
| `ingester.startupProbe.enabled`                  | Enable startupProbe on Ingester containers                                                         | `false`             |
| `ingester.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                             | `30`                |
| `ingester.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                    | `10`                |
| `ingester.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                   | `1`                 |
| `ingester.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                 | `15`                |
| `ingester.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                 | `1`                 |
| `ingester.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                | `{}`                |
| `ingester.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                               | `{}`                |
| `ingester.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                 | `{}`                |
| `ingester.resources.limits`                      | The resources limits for the ingester containers                                                   | `{}`                |
| `ingester.resources.requests`                    | The requested resources for the ingester containers                                                | `{}`                |
| `ingester.podSecurityContext.enabled`            | Enabled Ingester pods' Security Context                                                            | `true`              |
| `ingester.podSecurityContext.fsGroup`            | Set Ingester pod's Security Context fsGroup                                                        | `1001`              |
| `ingester.containerSecurityContext.enabled`      | Enabled Ingester containers' Security Context                                                      | `true`              |
| `ingester.containerSecurityContext.runAsUser`    | Set Ingester containers' Security Context runAsUser                                                | `1001`              |
| `ingester.containerSecurityContext.runAsNonRoot` | Set Ingester containers' Security Context runAsNonRoot                                             | `true`              |
| `ingester.lifecycleHooks`                        | for the ingester container(s) to automate configuration before or after startup                    | `{}`                |
| `ingester.hostAliases`                           | ingester pods host aliases                                                                         | `[]`                |
| `ingester.podLabels`                             | Extra labels for ingester pods                                                                     | `{}`                |
| `ingester.podAnnotations`                        | Annotations for ingester pods                                                                      | `{}`                |
| `ingester.podAffinityPreset`                     | Pod affinity preset. Ignored if `ingester.affinity` is set. Allowed values: `soft` or `hard`       | `""`                |
| `ingester.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `ingester.affinity` is set. Allowed values: `soft` or `hard`  | `soft`              |
| `ingester.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `ingester.affinity` is set. Allowed values: `soft` or `hard` | `""`                |
| `ingester.nodeAffinityPreset.key`                | Node label key to match. Ignored if `ingester.affinity` is set                                     | `""`                |
| `ingester.nodeAffinityPreset.values`             | Node label values to match. Ignored if `ingester.affinity` is set                                  | `[]`                |
| `ingester.affinity`                              | Affinity for Ingester pods assignment                                                              | `{}`                |
| `ingester.nodeSelector`                          | Node labels for Ingester pods assignment                                                           | `{}`                |
| `ingester.tolerations`                           | Tolerations for Ingester pods assignment                                                           | `[]`                |
| `ingester.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains    | `[]`                |
| `ingester.priorityClassName`                     | Ingester pods' priorityClassName                                                                   | `""`                |
| `ingester.schedulerName`                         | Kubernetes pod scheduler registry                                                                  | `""`                |
| `ingester.terminationGracePeriodSeconds`         | Seconds pod needs to terminate gracefully                                                          | `""`                |
| `ingester.updateStrategy.type`                   | Ingester statefulset strategy type                                                                 | `RollingUpdate`     |
| `ingester.updateStrategy.rollingUpdate`          | Ingester statefulset rolling update configuration parameters                                       | `{}`                |
| `ingester.extraVolumes`                          | Optionally specify extra list of additional volumes for the Ingester pod(s)                        | `[]`                |
| `ingester.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Ingester container(s)             | `[]`                |
| `ingester.sidecars`                              | Add additional sidecar containers to the Ingester pod(s)                                           | `[]`                |
| `ingester.initContainers`                        | Add additional init containers to the Ingester pod(s)                                              | `[]`                |
| `ingester.persistence.enabled`                   | Enable persistence in Ingester instances                                                           | `true`              |
| `ingester.persistence.storageClass`              | PVC Storage Class for Ingester data volume                                                         | `""`                |
| `ingester.persistence.accessModes`               | PVC Access modes                                                                                   | `["ReadWriteOnce"]` |
| `ingester.persistence.size`                      | PVC Storage Request for Ingester data volume                                                       | `8Gi`               |
| `ingester.persistence.annotations`               | Additional PVC annotations                                                                         | `{}`                |
| `ingester.persistence.selector`                  | Selector to match an existing Persistent Volume for Ingester's data PVC                            | `{}`                |
| `ingester.persistence.dataSource`                | PVC data source                                                                                    | `{}`                |

### Ingester Traffic Exposure Parameters

| Name                                                      | Description                                                                                                 | Value           |
| --------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | --------------- |
| `ingester.service.type`                                   | Ingester service type                                                                                       | `ClusterIP`     |
| `ingester.service.ports.http`                             | Ingester HTTP service port                                                                                  | `8080`          |
| `ingester.service.ports.grpc`                             | Ingester GRPC service port                                                                                  | `9095`          |
| `ingester.service.nodePorts.http`                         | Node port for HTTP                                                                                          | `""`            |
| `ingester.service.nodePorts.grpc`                         | Node port for GRPC                                                                                          | `9095`          |
| `ingester.service.sessionAffinityConfig`                  | Additional settings for the sessionAffinity                                                                 | `{}`            |
| `ingester.service.sessionAffinity`                        | Control where client requests go, to the same pod or round-robin                                            | `None`          |
| `ingester.service.clusterIP`                              | Ingester service Cluster IP                                                                                 | `""`            |
| `ingester.service.loadBalancerIP`                         | Ingester service Load Balancer IP                                                                           | `""`            |
| `ingester.service.loadBalancerSourceRanges`               | Ingester service Load Balancer sources                                                                      | `[]`            |
| `ingester.service.externalTrafficPolicy`                  | Ingester service external traffic policy                                                                    | `Cluster`       |
| `ingester.service.annotations`                            | Additional custom annotations for Ingester service                                                          | `{}`            |
| `ingester.service.extraPorts`                             | Extra ports to expose in the Ingester service                                                               | `[]`            |
| `ingester.service.headless.annotations`                   | Annotations for the headless service.                                                                       | `{}`            |
| `ingester.pdb.create`                                     | Enable/disable a Pod Disruption Budget creation                                                             | `false`         |
| `ingester.pdb.minAvailable`                               | Minimum number/percentage of pods that should remain scheduled                                              | `1`             |
| `ingester.pdb.maxUnavailable`                             | Maximum number/percentage of pods that may be made unavailable                                              | `""`            |
| `overridesExporter.enabled`                               | Enable overrides-exporter deployment                                                                        | `false`         |
| `overridesExporter.extraEnvVars`                          | Array with extra environment variables to add to overrides-exporter nodes                                   | `[]`            |
| `overridesExporter.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for overrides-exporter nodes                           | `""`            |
| `overridesExporter.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for overrides-exporter nodes                              | `""`            |
| `overridesExporter.command`                               | Override default container command (useful when using custom images)                                        | `[]`            |
| `overridesExporter.args`                                  | Override default container args (useful when using custom images)                                           | `[]`            |
| `overridesExporter.extraArgs`                             | Add additional args to the default container args (useful to override configuration)                        | `[]`            |
| `overridesExporter.replicaCount`                          | Number of Overrides Exporter replicas to deploy                                                             | `1`             |
| `overridesExporter.livenessProbe.enabled`                 | Enable livenessProbe on Overrides Exporter nodes                                                            | `true`          |
| `overridesExporter.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                     | `30`            |
| `overridesExporter.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                            | `10`            |
| `overridesExporter.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                           | `1`             |
| `overridesExporter.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                         | `3`             |
| `overridesExporter.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                         | `1`             |
| `overridesExporter.readinessProbe.enabled`                | Enable readinessProbe on Overrides Exporter nodes                                                           | `true`          |
| `overridesExporter.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                    | `30`            |
| `overridesExporter.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                           | `10`            |
| `overridesExporter.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                          | `1`             |
| `overridesExporter.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                        | `3`             |
| `overridesExporter.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                        | `1`             |
| `overridesExporter.startupProbe.enabled`                  | Enable startupProbe on Overrides Exporter containers                                                        | `false`         |
| `overridesExporter.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                      | `30`            |
| `overridesExporter.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                             | `10`            |
| `overridesExporter.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                            | `1`             |
| `overridesExporter.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                          | `15`            |
| `overridesExporter.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                          | `1`             |
| `overridesExporter.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                         | `{}`            |
| `overridesExporter.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                        | `{}`            |
| `overridesExporter.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                          | `{}`            |
| `overridesExporter.resources.limits`                      | The resources limits for the overrides-exporter containers                                                  | `{}`            |
| `overridesExporter.resources.requests`                    | The requested resources for the overrides-exporter containers                                               | `{}`            |
| `overridesExporter.podSecurityContext.enabled`            | Enabled Overrides Exporter pods' Security Context                                                           | `true`          |
| `overridesExporter.podSecurityContext.fsGroup`            | Set Overrides Exporter pod's Security Context fsGroup                                                       | `1001`          |
| `overridesExporter.containerSecurityContext.enabled`      | Enabled Overrides Exporter containers' Security Context                                                     | `true`          |
| `overridesExporter.containerSecurityContext.runAsUser`    | Set Overrides Exporter containers' Security Context runAsUser                                               | `1001`          |
| `overridesExporter.containerSecurityContext.runAsNonRoot` | Set Overrides Exporter containers' Security Context runAsNonRoot                                            | `true`          |
| `overridesExporter.lifecycleHooks`                        | for the ingester container(s) to automate configuration before or after startup                             | `{}`            |
| `overridesExporter.hostAliases`                           | ingester pods host aliases                                                                                  | `[]`            |
| `overridesExporter.podLabels`                             | Extra labels for ingester pods                                                                              | `{}`            |
| `overridesExporter.podAnnotations`                        | Annotations for ingester pods                                                                               | `{}`            |
| `overridesExporter.podAffinityPreset`                     | Pod affinity preset. Ignored if `overridesExporter.affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `overridesExporter.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `overridesExporter.affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `overridesExporter.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `overridesExporter.affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `overridesExporter.nodeAffinityPreset.key`                | Node label key to match. Ignored if `overridesExporter.affinity` is set                                     | `""`            |
| `overridesExporter.nodeAffinityPreset.values`             | Node label values to match. Ignored if `overridesExporter.affinity` is set                                  | `[]`            |
| `overridesExporter.affinity`                              | Affinity for Overrides Exporter pods assignment                                                             | `{}`            |
| `overridesExporter.nodeSelector`                          | Node labels for Overrides Exporter pods assignment                                                          | `{}`            |
| `overridesExporter.tolerations`                           | Tolerations for Overrides Exporter pods assignment                                                          | `[]`            |
| `overridesExporter.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains             | `[]`            |
| `overridesExporter.priorityClassName`                     | Overrides Exporter pods' priorityClassName                                                                  | `""`            |
| `overridesExporter.schedulerName`                         | Kubernetes pod scheduler registry                                                                           | `""`            |
| `overridesExporter.terminationGracePeriodSeconds`         | Seconds pod needs to terminate gracefully                                                                   | `""`            |
| `overridesExporter.updateStrategy.type`                   | Overrides Exporter statefulset strategy type                                                                | `RollingUpdate` |
| `overridesExporter.updateStrategy.rollingUpdate`          | Overrides Exporter statefulset rolling update configuration parameters                                      | `{}`            |
| `overridesExporter.extraVolumes`                          | Optionally specify extra list of additional volumes for the Overrides Exporter pod(s)                       | `[]`            |
| `overridesExporter.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Overrides Exporter container(s)            | `[]`            |
| `overridesExporter.sidecars`                              | Add additional sidecar containers to the Overrides Exporter pod(s)                                          | `[]`            |
| `overridesExporter.initContainers`                        | Add additional init containers to the Overrides Exporter pod(s)                                             | `[]`            |

### Overrides Exporter Traffic Exposure Parameters

| Name                                                 | Description                                                      | Value       |
| ---------------------------------------------------- | ---------------------------------------------------------------- | ----------- |
| `overridesExporter.service.type`                     | Overrides Exporter service type                                  | `ClusterIP` |
| `overridesExporter.service.ports.http`               | Overrides Exporter HTTP service port                             | `8080`      |
| `overridesExporter.service.ports.grpc`               | Overrides Exporter GRPC service port                             | `9095`      |
| `overridesExporter.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `overridesExporter.service.nodePorts.grpc`           | Node port for GRPC                                               | `9095`      |
| `overridesExporter.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `overridesExporter.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `overridesExporter.service.clusterIP`                | Overrides Exporter service Cluster IP                            | `""`        |
| `overridesExporter.service.loadBalancerIP`           | Overrides Exporter service Load Balancer IP                      | `""`        |
| `overridesExporter.service.loadBalancerSourceRanges` | Overrides Exporter service Load Balancer sources                 | `[]`        |
| `overridesExporter.service.externalTrafficPolicy`    | Overrides Exporter service external traffic policy               | `Cluster`   |
| `overridesExporter.service.annotations`              | Additional custom annotations for Overrides Exporter service     | `{}`        |
| `overridesExporter.service.extraPorts`               | Extra ports to expose in the Overrides Export service            | `[]`        |
| `overridesExporter.service.headless.annotations`     | Annotations for the headless service.                            | `{}`        |
| `overridesExporter.pdb.create`                       | Enable/disable a Pod Disruption Budget creation                  | `false`     |
| `overridesExporter.pdb.minAvailable`                 | Minimum number/percentage of pods that should remain scheduled   | `1`         |
| `overridesExporter.pdb.maxUnavailable`               | Maximum number/percentage of pods that may be made unavailable   | `""`        |

### Querier Deployment Parameters

| Name                                            | Description                                                                                       | Value           |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------- | --------------- |
| `querier.extraEnvVars`                          | Array with extra environment variables to add to querier nodes                                    | `[]`            |
| `querier.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for querier nodes                            | `""`            |
| `querier.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for querier nodes                               | `""`            |
| `querier.command`                               | Override default container command (useful when using custom images)                              | `[]`            |
| `querier.args`                                  | Override default container args (useful when using custom images)                                 | `[]`            |
| `querier.extraArgs`                             | Add additional args to the default container args (useful to override configuration)              | `[]`            |
| `querier.replicaCount`                          | Number of Querier replicas to deploy                                                              | `1`             |
| `querier.livenessProbe.enabled`                 | Enable livenessProbe on Querier nodes                                                             | `true`          |
| `querier.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                           | `30`            |
| `querier.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                  | `10`            |
| `querier.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                 | `1`             |
| `querier.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                               | `3`             |
| `querier.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                               | `1`             |
| `querier.readinessProbe.enabled`                | Enable readinessProbe on Querier nodes                                                            | `true`          |
| `querier.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                          | `30`            |
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
| `querier.resources.limits`                      | The resources limits for the querier containers                                                   | `{}`            |
| `querier.resources.requests`                    | The requested resources for the querier containers                                                | `{}`            |
| `querier.podSecurityContext.enabled`            | Enabled Querier pods' Security Context                                                            | `true`          |
| `querier.podSecurityContext.fsGroup`            | Set Querier pod's Security Context fsGroup                                                        | `1001`          |
| `querier.containerSecurityContext.enabled`      | Enabled Querier containers' Security Context                                                      | `true`          |
| `querier.containerSecurityContext.runAsUser`    | Set Querier containers' Security Context runAsUser                                                | `1001`          |
| `querier.containerSecurityContext.runAsNonRoot` | Set Querier containers' Security Context runAsNonRoot                                             | `true`          |
| `querier.lifecycleHooks`                        | for the ingester container(s) to automate configuration before or after startup                   | `{}`            |
| `querier.hostAliases`                           | ingester pods host aliases                                                                        | `[]`            |
| `querier.podLabels`                             | Extra labels for ingester pods                                                                    | `{}`            |
| `querier.podAnnotations`                        | Annotations for ingester pods                                                                     | `{}`            |
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
| `querier.terminationGracePeriodSeconds`         | Seconds pod needs to terminate gracefully                                                         | `""`            |
| `querier.updateStrategy.type`                   | Querier statefulset strategy type                                                                 | `RollingUpdate` |
| `querier.updateStrategy.rollingUpdate`          | Querier statefulset rolling update configuration parameters                                       | `{}`            |
| `querier.extraVolumes`                          | Optionally specify extra list of additional volumes for the Querier pod(s)                        | `[]`            |
| `querier.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Querier container(s)             | `[]`            |
| `querier.sidecars`                              | Add additional sidecar containers to the Querier pod(s)                                           | `[]`            |
| `querier.initContainers`                        | Add additional init containers to the Querier pod(s)                                              | `[]`            |

### Querier Traffic Exposure Parameters

| Name                                       | Description                                                      | Value       |
| ------------------------------------------ | ---------------------------------------------------------------- | ----------- |
| `querier.service.type`                     | Querier service type                                             | `ClusterIP` |
| `querier.service.ports.http`               | Querier HTTP service port                                        | `8080`      |
| `querier.service.ports.grpc`               | Querier GRPC service port                                        | `9095`      |
| `querier.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `querier.service.nodePorts.grpc`           | Node port for GRPC                                               | `9095`      |
| `querier.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `querier.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `querier.service.clusterIP`                | Querier service Cluster IP                                       | `""`        |
| `querier.service.loadBalancerIP`           | Querier service Load Balancer IP                                 | `""`        |
| `querier.service.loadBalancerSourceRanges` | Querier service Load Balancer sources                            | `[]`        |
| `querier.service.externalTrafficPolicy`    | Querier service external traffic policy                          | `Cluster`   |
| `querier.service.annotations`              | Additional custom annotations for Querier service                | `{}`        |
| `querier.service.extraPorts`               | Extra ports to expose in the Querier service                     | `[]`        |
| `querier.service.headless.annotations`     | Annotations for the headless service.                            | `{}`        |
| `querier.pdb.create`                       | Enable/disable a Pod Disruption Budget creation                  | `false`     |
| `querier.pdb.minAvailable`                 | Minimum number/percentage of pods that should remain scheduled   | `1`         |
| `querier.pdb.maxUnavailable`               | Maximum number/percentage of pods that may be made unavailable   | `""`        |

### Query Frontend Deployment Parameters

| Name                                                  | Description                                                                                             | Value           |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | --------------- |
| `queryFrontend.extraEnvVars`                          | Array with extra environment variables to add to ingester nodes                                         | `[]`            |
| `queryFrontend.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for ingester nodes                                 | `""`            |
| `queryFrontend.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for ingester nodes                                    | `""`            |
| `queryFrontend.command`                               | Override default container command (useful when using custom images)                                    | `[]`            |
| `queryFrontend.args`                                  | Override default container args (useful when using custom images)                                       | `[]`            |
| `queryFrontend.extraArgs`                             | Add additional args to the default container args (useful to override configuration)                    | `[]`            |
| `queryFrontend.replicaCount`                          | Number of Query Frontend replicas to deploy                                                             | `1`             |
| `queryFrontend.livenessProbe.enabled`                 | Enable livenessProbe on Query Frontend nodes                                                            | `true`          |
| `queryFrontend.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                 | `30`            |
| `queryFrontend.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                        | `10`            |
| `queryFrontend.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                       | `1`             |
| `queryFrontend.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                     | `3`             |
| `queryFrontend.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                     | `1`             |
| `queryFrontend.readinessProbe.enabled`                | Enable readinessProbe on Query Frontend nodes                                                           | `true`          |
| `queryFrontend.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                | `30`            |
| `queryFrontend.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                       | `10`            |
| `queryFrontend.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                      | `1`             |
| `queryFrontend.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                    | `3`             |
| `queryFrontend.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                    | `1`             |
| `queryFrontend.startupProbe.enabled`                  | Enable startupProbe on Query Frontend containers                                                        | `false`         |
| `queryFrontend.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                  | `30`            |
| `queryFrontend.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                         | `10`            |
| `queryFrontend.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                        | `1`             |
| `queryFrontend.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                      | `15`            |
| `queryFrontend.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                      | `1`             |
| `queryFrontend.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                     | `{}`            |
| `queryFrontend.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                    | `{}`            |
| `queryFrontend.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                      | `{}`            |
| `queryFrontend.resources.limits`                      | The resources limits for the ingester containers                                                        | `{}`            |
| `queryFrontend.resources.requests`                    | The requested resources for the ingester containers                                                     | `{}`            |
| `queryFrontend.podSecurityContext.enabled`            | Enabled Query Frontend pods' Security Context                                                           | `true`          |
| `queryFrontend.podSecurityContext.fsGroup`            | Set Query Frontend pod's Security Context fsGroup                                                       | `1001`          |
| `queryFrontend.containerSecurityContext.enabled`      | Enabled Query Frontend containers' Security Context                                                     | `true`          |
| `queryFrontend.containerSecurityContext.runAsUser`    | Set Query Frontend containers' Security Context runAsUser                                               | `1001`          |
| `queryFrontend.containerSecurityContext.runAsNonRoot` | Set Query Frontend containers' Security Context runAsNonRoot                                            | `true`          |
| `queryFrontend.lifecycleHooks`                        | for the ingester container(s) to automate configuration before or after startup                         | `{}`            |
| `queryFrontend.hostAliases`                           | ingester pods host aliases                                                                              | `[]`            |
| `queryFrontend.podLabels`                             | Extra labels for ingester pods                                                                          | `{}`            |
| `queryFrontend.podAnnotations`                        | Annotations for ingester pods                                                                           | `{}`            |
| `queryFrontend.podAffinityPreset`                     | Pod affinity preset. Ignored if `queryFrontend.affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `queryFrontend.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `queryFrontend.affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `queryFrontend.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `queryFrontend.affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `queryFrontend.nodeAffinityPreset.key`                | Node label key to match. Ignored if `queryFrontend.affinity` is set                                     | `""`            |
| `queryFrontend.nodeAffinityPreset.values`             | Node label values to match. Ignored if `queryFrontend.affinity` is set                                  | `[]`            |
| `queryFrontend.affinity`                              | Affinity for Query Frontend pods assignment                                                             | `{}`            |
| `queryFrontend.nodeSelector`                          | Node labels for Query Frontend pods assignment                                                          | `{}`            |
| `queryFrontend.tolerations`                           | Tolerations for Query Frontend pods assignment                                                          | `[]`            |
| `queryFrontend.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains         | `[]`            |
| `queryFrontend.priorityClassName`                     | Query Frontend pods' priorityClassName                                                                  | `""`            |
| `queryFrontend.schedulerName`                         | Kubernetes pod scheduler registry                                                                       | `""`            |
| `queryFrontend.terminationGracePeriodSeconds`         | Seconds pod needs to terminate gracefully                                                               | `""`            |
| `queryFrontend.updateStrategy.type`                   | Query Frontend statefulset strategy type                                                                | `RollingUpdate` |
| `queryFrontend.updateStrategy.rollingUpdate`          | Query Frontend statefulset rolling update configuration parameters                                      | `{}`            |
| `queryFrontend.extraVolumes`                          | Optionally specify extra list of additional volumes for the Query Frontend pod(s)                       | `[]`            |
| `queryFrontend.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Query Frontend container(s)            | `[]`            |
| `queryFrontend.sidecars`                              | Add additional sidecar containers to the Query Frontend pod(s)                                          | `[]`            |
| `queryFrontend.initContainers`                        | Add additional init containers to the Query Frontend pod(s)                                             | `[]`            |

### Query Frontend Traffic Exposure Parameters

| Name                                                   | Description                                                                                              | Value           |
| ------------------------------------------------------ | -------------------------------------------------------------------------------------------------------- | --------------- |
| `queryFrontend.service.type`                           | Query Frontend service type                                                                              | `ClusterIP`     |
| `queryFrontend.service.ports.http`                     | Query Frontend HTTP service port                                                                         | `8080`          |
| `queryFrontend.service.ports.grpc`                     | Query Frontend GRPC service port                                                                         | `9095`          |
| `queryFrontend.service.nodePorts.http`                 | Node port for HTTP                                                                                       | `""`            |
| `queryFrontend.service.nodePorts.grpc`                 | Node port for GRPC                                                                                       | `9095`          |
| `queryFrontend.service.sessionAffinityConfig`          | Additional settings for the sessionAffinity                                                              | `{}`            |
| `queryFrontend.service.sessionAffinity`                | Control where client requests go, to the same pod or round-robin                                         | `None`          |
| `queryFrontend.service.clusterIP`                      | Query Frontend service Cluster IP                                                                        | `""`            |
| `queryFrontend.service.loadBalancerIP`                 | Query Frontend service Load Balancer IP                                                                  | `""`            |
| `queryFrontend.service.loadBalancerSourceRanges`       | Query Frontend service Load Balancer sources                                                             | `[]`            |
| `queryFrontend.service.externalTrafficPolicy`          | Query Frontend service external traffic policy                                                           | `Cluster`       |
| `queryFrontend.service.annotations`                    | Additional custom annotations for Query Frontend service                                                 | `{}`            |
| `queryFrontend.service.extraPorts`                     | Extra ports to expose in the Query Frontend service                                                      | `[]`            |
| `queryFrontend.service.headless.annotations`           | Annotations for the headless service.                                                                    | `{}`            |
| `queryFrontend.pdb.create`                             | Enable/disable a Pod Disruption Budget creation                                                          | `false`         |
| `queryFrontend.pdb.minAvailable`                       | Minimum number/percentage of pods that should remain scheduled                                           | `1`             |
| `queryFrontend.pdb.maxUnavailable`                     | Maximum number/percentage of pods that may be made unavailable                                           | `""`            |
| `queryScheduler.enabled`                               | Enable query-scheduler deployment                                                                        | `false`         |
| `queryScheduler.extraEnvVars`                          | Array with extra environment variables to add to query-scheduler nodes                                   | `[]`            |
| `queryScheduler.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for query-scheduler nodes                           | `""`            |
| `queryScheduler.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for query-scheduler nodes                              | `""`            |
| `queryScheduler.command`                               | Override default container command (useful when using custom images)                                     | `[]`            |
| `queryScheduler.args`                                  | Override default container args (useful when using custom images)                                        | `[]`            |
| `queryScheduler.extraArgs`                             | Add additional args to the default container args (useful to override configuration)                     | `[]`            |
| `queryScheduler.replicaCount`                          | Number of Query Scheduler replicas to deploy                                                             | `1`             |
| `queryScheduler.livenessProbe.enabled`                 | Enable livenessProbe on Query Scheduler nodes                                                            | `true`          |
| `queryScheduler.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                  | `30`            |
| `queryScheduler.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                         | `10`            |
| `queryScheduler.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                        | `1`             |
| `queryScheduler.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                      | `3`             |
| `queryScheduler.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                      | `1`             |
| `queryScheduler.readinessProbe.enabled`                | Enable readinessProbe on Query Scheduler nodes                                                           | `true`          |
| `queryScheduler.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                 | `30`            |
| `queryScheduler.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                        | `10`            |
| `queryScheduler.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                       | `1`             |
| `queryScheduler.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                     | `3`             |
| `queryScheduler.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                     | `1`             |
| `queryScheduler.startupProbe.enabled`                  | Enable startupProbe on Query Scheduler containers                                                        | `false`         |
| `queryScheduler.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                   | `30`            |
| `queryScheduler.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                          | `10`            |
| `queryScheduler.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                         | `1`             |
| `queryScheduler.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                       | `15`            |
| `queryScheduler.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                       | `1`             |
| `queryScheduler.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                      | `{}`            |
| `queryScheduler.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                     | `{}`            |
| `queryScheduler.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                       | `{}`            |
| `queryScheduler.resources.limits`                      | The resources limits for the query-scheduler containers                                                  | `{}`            |
| `queryScheduler.resources.requests`                    | The requested resources for the query-scheduler containers                                               | `{}`            |
| `queryScheduler.podSecurityContext.enabled`            | Enabled Query Scheduler pods' Security Context                                                           | `true`          |
| `queryScheduler.podSecurityContext.fsGroup`            | Set Query Scheduler pod's Security Context fsGroup                                                       | `1001`          |
| `queryScheduler.containerSecurityContext.enabled`      | Enabled Query Scheduler containers' Security Context                                                     | `true`          |
| `queryScheduler.containerSecurityContext.runAsUser`    | Set Query Scheduler containers' Security Context runAsUser                                               | `1001`          |
| `queryScheduler.containerSecurityContext.runAsNonRoot` | Set Query Scheduler containers' Security Context runAsNonRoot                                            | `true`          |
| `queryScheduler.lifecycleHooks`                        | for the ingester container(s) to automate configuration before or after startup                          | `{}`            |
| `queryScheduler.hostAliases`                           | ingester pods host aliases                                                                               | `[]`            |
| `queryScheduler.podLabels`                             | Extra labels for ingester pods                                                                           | `{}`            |
| `queryScheduler.podAnnotations`                        | Annotations for ingester pods                                                                            | `{}`            |
| `queryScheduler.podAffinityPreset`                     | Pod affinity preset. Ignored if `queryScheduler.affinity` is set. Allowed values: `soft` or `hard`       | `""`            |
| `queryScheduler.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `queryScheduler.affinity` is set. Allowed values: `soft` or `hard`  | `soft`          |
| `queryScheduler.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `queryScheduler.affinity` is set. Allowed values: `soft` or `hard` | `""`            |
| `queryScheduler.nodeAffinityPreset.key`                | Node label key to match. Ignored if `queryScheduler.affinity` is set                                     | `""`            |
| `queryScheduler.nodeAffinityPreset.values`             | Node label values to match. Ignored if `queryScheduler.affinity` is set                                  | `[]`            |
| `queryScheduler.affinity`                              | Affinity for Query Scheduler pods assignment                                                             | `{}`            |
| `queryScheduler.nodeSelector`                          | Node labels for Query Scheduler pods assignment                                                          | `{}`            |
| `queryScheduler.tolerations`                           | Tolerations for Query Scheduler pods assignment                                                          | `[]`            |
| `queryScheduler.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains          | `[]`            |
| `queryScheduler.priorityClassName`                     | Query Scheduler pods' priorityClassName                                                                  | `""`            |
| `queryScheduler.schedulerName`                         | Kubernetes pod scheduler registry                                                                        | `""`            |
| `queryScheduler.terminationGracePeriodSeconds`         | Seconds pod needs to terminate gracefully                                                                | `""`            |
| `queryScheduler.updateStrategy.type`                   | Query Scheduler statefulset strategy type                                                                | `RollingUpdate` |
| `queryScheduler.updateStrategy.rollingUpdate`          | Query Scheduler statefulset rolling update configuration parameters                                      | `{}`            |
| `queryScheduler.extraVolumes`                          | Optionally specify extra list of additional volumes for the Query Scheduler pod(s)                       | `[]`            |
| `queryScheduler.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Query Scheduler container(s)            | `[]`            |
| `queryScheduler.sidecars`                              | Add additional sidecar containers to the Query Scheduler pod(s)                                          | `[]`            |
| `queryScheduler.initContainers`                        | Add additional init containers to the Query Scheduler pod(s)                                             | `[]`            |

### Query Scheduler Traffic Exposure Parameters

| Name                                              | Description                                                      | Value       |
| ------------------------------------------------- | ---------------------------------------------------------------- | ----------- |
| `queryScheduler.service.type`                     | Query Scheduler service type                                     | `ClusterIP` |
| `queryScheduler.service.ports.http`               | Query Scheduler HTTP service port                                | `8080`      |
| `queryScheduler.service.ports.grpc`               | Query Scheduler GRPC service port                                | `9095`      |
| `queryScheduler.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `queryScheduler.service.nodePorts.grpc`           | Node port for GRPC                                               | `9095`      |
| `queryScheduler.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `queryScheduler.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `queryScheduler.service.clusterIP`                | Query Scheduler service Cluster IP                               | `""`        |
| `queryScheduler.service.loadBalancerIP`           | Query Scheduler service Load Balancer IP                         | `""`        |
| `queryScheduler.service.loadBalancerSourceRanges` | Query Scheduler service Load Balancer sources                    | `[]`        |
| `queryScheduler.service.externalTrafficPolicy`    | Query Scheduler service external traffic policy                  | `Cluster`   |
| `queryScheduler.service.annotations`              | Additional custom annotations for Query Scheduler service        | `{}`        |
| `queryScheduler.service.extraPorts`               | Extra ports to expose in the Query Scheduler service             | `[]`        |
| `queryScheduler.service.headless.annotations`     | Annotations for the headless service.                            | `{}`        |
| `queryScheduler.pdb.create`                       | Enable/disable a Pod Disruption Budget creation                  | `false`     |
| `queryScheduler.pdb.minAvailable`                 | Minimum number/percentage of pods that should remain scheduled   | `1`         |
| `queryScheduler.pdb.maxUnavailable`               | Maximum number/percentage of pods that may be made unavailable   | `""`        |

### Store Gateway Deployment Parameters

| Name                                                 | Description                                                                                            | Value               |
| ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ------------------- |
| `storeGateway.extraEnvVars`                          | Array with extra environment variables to add to ingester nodes                                        | `[]`                |
| `storeGateway.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for ingester nodes                                | `""`                |
| `storeGateway.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for ingester nodes                                   | `""`                |
| `storeGateway.command`                               | Override default container command (useful when using custom images)                                   | `[]`                |
| `storeGateway.args`                                  | Override default container args (useful when using custom images)                                      | `[]`                |
| `storeGateway.extraArgs`                             | Add additional args to the default container args (useful to override configuration)                   | `[]`                |
| `storeGateway.replicaCount`                          | Number of Store Gateway replicas to deploy                                                             | `1`                 |
| `storeGateway.podManagementPolicy`                   | Statefulset Pod management policy, it needs to be Parallel to be able to complete the cluster join     | `OrderedReady`      |
| `storeGateway.livenessProbe.enabled`                 | Enable livenessProbe on Store Gateway nodes                                                            | `true`              |
| `storeGateway.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                | `60`                |
| `storeGateway.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                       | `10`                |
| `storeGateway.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                      | `1`                 |
| `storeGateway.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                    | `3`                 |
| `storeGateway.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                    | `1`                 |
| `storeGateway.readinessProbe.enabled`                | Enable readinessProbe on Store Gateway nodes                                                           | `true`              |
| `storeGateway.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                               | `60`                |
| `storeGateway.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                      | `10`                |
| `storeGateway.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                     | `1`                 |
| `storeGateway.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                   | `3`                 |
| `storeGateway.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                   | `1`                 |
| `storeGateway.startupProbe.enabled`                  | Enable startupProbe on Store Gateway containers                                                        | `false`             |
| `storeGateway.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                 | `30`                |
| `storeGateway.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                        | `10`                |
| `storeGateway.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                       | `1`                 |
| `storeGateway.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                     | `15`                |
| `storeGateway.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                     | `1`                 |
| `storeGateway.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                    | `{}`                |
| `storeGateway.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                   | `{}`                |
| `storeGateway.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                     | `{}`                |
| `storeGateway.resources.limits`                      | The resources limits for the ingester containers                                                       | `{}`                |
| `storeGateway.resources.requests`                    | The requested resources for the ingester containers                                                    | `{}`                |
| `storeGateway.podSecurityContext.enabled`            | Enabled Store Gateway pods' Security Context                                                           | `true`              |
| `storeGateway.podSecurityContext.fsGroup`            | Set Store Gateway pod's Security Context fsGroup                                                       | `1001`              |
| `storeGateway.containerSecurityContext.enabled`      | Enabled Store Gateway containers' Security Context                                                     | `true`              |
| `storeGateway.containerSecurityContext.runAsUser`    | Set Store Gateway containers' Security Context runAsUser                                               | `1001`              |
| `storeGateway.containerSecurityContext.runAsNonRoot` | Set Store Gateway containers' Security Context runAsNonRoot                                            | `true`              |
| `storeGateway.lifecycleHooks`                        | for the ingester container(s) to automate configuration before or after startup                        | `{}`                |
| `storeGateway.hostAliases`                           | ingester pods host aliases                                                                             | `[]`                |
| `storeGateway.podLabels`                             | Extra labels for ingester pods                                                                         | `{}`                |
| `storeGateway.podAnnotations`                        | Annotations for ingester pods                                                                          | `{}`                |
| `storeGateway.podAffinityPreset`                     | Pod affinity preset. Ignored if `storeGateway.affinity` is set. Allowed values: `soft` or `hard`       | `""`                |
| `storeGateway.podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `storeGateway.affinity` is set. Allowed values: `soft` or `hard`  | `soft`              |
| `storeGateway.nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `storeGateway.affinity` is set. Allowed values: `soft` or `hard` | `""`                |
| `storeGateway.nodeAffinityPreset.key`                | Node label key to match. Ignored if `storeGateway.affinity` is set                                     | `""`                |
| `storeGateway.nodeAffinityPreset.values`             | Node label values to match. Ignored if `storeGateway.affinity` is set                                  | `[]`                |
| `storeGateway.affinity`                              | Affinity for Store Gateway pods assignment                                                             | `{}`                |
| `storeGateway.nodeSelector`                          | Node labels for Store Gateway pods assignment                                                          | `{}`                |
| `storeGateway.tolerations`                           | Tolerations for Store Gateway pods assignment                                                          | `[]`                |
| `storeGateway.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains        | `[]`                |
| `storeGateway.priorityClassName`                     | Store Gateway pods' priorityClassName                                                                  | `""`                |
| `storeGateway.schedulerName`                         | Kubernetes pod scheduler registry                                                                      | `""`                |
| `storeGateway.terminationGracePeriodSeconds`         | Seconds pod needs to terminate gracefully                                                              | `""`                |
| `storeGateway.updateStrategy.type`                   | Store Gateway statefulset strategy type                                                                | `RollingUpdate`     |
| `storeGateway.updateStrategy.rollingUpdate`          | Store Gateway statefulset rolling update configuration parameters                                      | `{}`                |
| `storeGateway.extraVolumes`                          | Optionally specify extra list of additional volumes for the Store Gateway pod(s)                       | `[]`                |
| `storeGateway.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Store Gateway container(s)            | `[]`                |
| `storeGateway.sidecars`                              | Add additional sidecar containers to the Store Gateway pod(s)                                          | `[]`                |
| `storeGateway.initContainers`                        | Add additional init containers to the Store Gateway pod(s)                                             | `[]`                |
| `storeGateway.persistence.enabled`                   | Enable persistence in Store Gateway instances                                                          | `true`              |
| `storeGateway.persistence.existingClaim`             | Name of an existing PVC to use                                                                         | `""`                |
| `storeGateway.persistence.storageClass`              | PVC Storage Class for Store Gateway data volume                                                        | `""`                |
| `storeGateway.persistence.accessModes`               | PVC Access modes                                                                                       | `["ReadWriteOnce"]` |
| `storeGateway.persistence.size`                      | PVC Storage Request for Store Gateway data volume                                                      | `8Gi`               |
| `storeGateway.persistence.annotations`               | Additional PVC annotations                                                                             | `{}`                |
| `storeGateway.persistence.selector`                  | Selector to match an existing Persistent Volume for Store Gateway's data PVC                           | `{}`                |
| `storeGateway.persistence.dataSource`                | PVC data source                                                                                        | `{}`                |

### Store Gateway Traffic Exposure Parameters

| Name                                            | Description                                                      | Value       |
| ----------------------------------------------- | ---------------------------------------------------------------- | ----------- |
| `storeGateway.service.type`                     | Store Gateway service type                                       | `ClusterIP` |
| `storeGateway.service.ports.http`               | Store Gateway HTTP service port                                  | `8080`      |
| `storeGateway.service.ports.grpc`               | Store Gateway GRPC service port                                  | `9095`      |
| `storeGateway.service.nodePorts.http`           | Node port for HTTP                                               | `""`        |
| `storeGateway.service.nodePorts.grpc`           | Node port for GRPC                                               | `9095`      |
| `storeGateway.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                      | `{}`        |
| `storeGateway.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin | `None`      |
| `storeGateway.service.clusterIP`                | Store Gateway service Cluster IP                                 | `""`        |
| `storeGateway.service.loadBalancerIP`           | Store Gateway service Load Balancer IP                           | `""`        |
| `storeGateway.service.loadBalancerSourceRanges` | Store Gateway service Load Balancer sources                      | `[]`        |
| `storeGateway.service.externalTrafficPolicy`    | Store Gateway service external traffic policy                    | `Cluster`   |
| `storeGateway.service.annotations`              | Additional custom annotations for Store Gateway service          | `{}`        |
| `storeGateway.service.extraPorts`               | Extra ports to expose in the Store Gateway service               | `[]`        |
| `storeGateway.service.headless.annotations`     | Annotations for the headless service.                            | `{}`        |
| `storeGateway.pdb.create`                       | Enable/disable a Pod Disruption Budget creation                  | `false`     |
| `storeGateway.pdb.minAvailable`                 | Minimum number/percentage of pods that should remain scheduled   | `1`         |
| `storeGateway.pdb.maxUnavailable`               | Maximum number/percentage of pods that may be made unavailable   | `""`        |

### Ruler Deployment Parameters

| Name                                          | Description                                                                                     | Value           |
| --------------------------------------------- | ----------------------------------------------------------------------------------------------- | --------------- |
| `ruler.enabled`                               | Deploy ruler component                                                                          | `false`         |
| `ruler.extraEnvVars`                          | Array with extra environment variables to add to ruler nodes                                    | `[]`            |
| `ruler.extraEnvVarsCM`                        | Name of existing ConfigMap containing extra env vars for ruler nodes                            | `""`            |
| `ruler.extraEnvVarsSecret`                    | Name of existing Secret containing extra env vars for ruler nodes                               | `""`            |
| `ruler.command`                               | Override default container command (useful when using custom images)                            | `[]`            |
| `ruler.args`                                  | Override default container args (useful when using custom images)                               | `[]`            |
| `ruler.extraArgs`                             | Add additional args to the default container args (useful to override configuration)            | `[]`            |
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
| `ruler.terminationGracePeriodSeconds`         | Seconds pod needs to terminate gracefully                                                       | `""`            |
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
| `ruler.persistence.storageClass` | PVC Storage Class for Ruler data volume                              | `""`                |
| `ruler.persistence.accessModes`  | PVC Access modes                                                     | `["ReadWriteOnce"]` |
| `ruler.persistence.size`         | PVC Storage Request for Ruler data volume                            | `8Gi`               |
| `ruler.persistence.annotations`  | Additional PVC annotations                                           | `{}`                |
| `ruler.persistence.selector`     | Selector to match an existing Persistent Volume for Ruler's data PVC | `{}`                |

### Ruler Traffic Exposure Parameters

| Name                                     | Description                                                                                                    | Value       |
| ---------------------------------------- | -------------------------------------------------------------------------------------------------------------- | ----------- |
| `ruler.service.type`                     | Ruler service type                                                                                             | `ClusterIP` |
| `ruler.service.ports.http`               | Ruler HTTP service port                                                                                        | `8080`      |
| `ruler.service.ports.grpc`               | Ruler GRPC service port                                                                                        | `9095`      |
| `ruler.service.nodePorts.http`           | Node port for HTTP                                                                                             | `""`        |
| `ruler.service.nodePorts.grpc`           | Node port for GRPC                                                                                             | `""`        |
| `ruler.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                    | `{}`        |
| `ruler.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin                                               | `None`      |
| `ruler.service.clusterIP`                | Ruler service Cluster IP                                                                                       | `""`        |
| `ruler.service.loadBalancerIP`           | Ruler service Load Balancer IP                                                                                 | `""`        |
| `ruler.service.loadBalancerSourceRanges` | Ruler service Load Balancer sources                                                                            | `[]`        |
| `ruler.service.externalTrafficPolicy`    | Ruler service external traffic policy                                                                          | `Cluster`   |
| `ruler.service.annotations`              | Additional custom annotations for Ruler service                                                                | `{}`        |
| `ruler.service.extraPorts`               | Extra ports to expose in the Ruler service                                                                     | `[]`        |
| `ruler.pdb.create`                       | Enable/disable a Pod Disruption Budget creation                                                                | `false`     |
| `ruler.pdb.minAvailable`                 | Minimum number/percentage of pods that should remain scheduled                                                 | `1`         |
| `ruler.pdb.maxUnavailable`               | Maximum number/percentage of pods that may be made unavailable                                                 | `""`        |
| `ruler.blockStorage.backend`             | Backend storage to use. NOTE: if minio.enable == true, this configuration will be ignored.                     | `s3`        |
| `ruler.blockStorage.config`              | Configures connection to the backend store. NOTE: if minio.enable == true, this configuration will be ignored. | `{}`        |

### Init Container Parameters

| Name                                                   | Description                                                                                     | Value                   |
| ------------------------------------------------------ | ----------------------------------------------------------------------------------------------- | ----------------------- |
| `volumePermissions.enabled`                            | Enable init container that changes the owner/group of the PV mount point to `runAsUser:fsGroup` | `false`                 |
| `volumePermissions.image.registry`                     | Bitnami Shell image registry                                                                    | `docker.io`             |
| `volumePermissions.image.repository`                   | Bitnami Shell image repository                                                                  | `bitnami/bitnami-shell` |
| `volumePermissions.image.tag`                          | Bitnami Shell image tag (immutable tags are recommended)                                        | `11-debian-11-r118`     |
| `volumePermissions.image.pullPolicy`                   | Bitnami Shell image pull policy                                                                 | `IfNotPresent`          |
| `volumePermissions.image.pullSecrets`                  | Bitnami Shell image pull secrets                                                                | `[]`                    |
| `volumePermissions.resources.limits`                   | The resources limits for the init container                                                     | `{}`                    |
| `volumePermissions.resources.requests`                 | The requested resources for the init container                                                  | `{}`                    |
| `volumePermissions.containerSecurityContext.runAsUser` | Set init container's Security Context runAsUser                                                 | `0`                     |

### Other Parameters

| Name                                          | Description                                                                                                                       | Value                                                                                                                                                   |
| --------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `rbac.create`                                 | Specifies whether RBAC resources should be created                                                                                | `false`                                                                                                                                                 |
| `rbac.rules`                                  | Custom RBAC rules to set                                                                                                          | `[]`                                                                                                                                                    |
| `serviceAccount.create`                       | Specifies whether a ServiceAccount should be created                                                                              | `true`                                                                                                                                                  |
| `serviceAccount.name`                         | The name of the ServiceAccount to use.                                                                                            | `""`                                                                                                                                                    |
| `serviceAccount.annotations`                  | Additional Service Account annotations (evaluated as a template)                                                                  | `{}`                                                                                                                                                    |
| `serviceAccount.automountServiceAccountToken` | Automount service account token for the server service account                                                                    | `true`                                                                                                                                                  |
| `metrics.enabled`                             | Enable the export of Prometheus metrics                                                                                           | `false`                                                                                                                                                 |
| `metrics.serviceMonitor.enabled`              | if `true`, creates a Prometheus Operator ServiceMonitor (also requires `metrics.enabled` to be `true`)                            | `false`                                                                                                                                                 |
| `metrics.serviceMonitor.namespace`            | Namespace in which Prometheus is running                                                                                          | `""`                                                                                                                                                    |
| `metrics.serviceMonitor.annotations`          | Additional custom annotations for the ServiceMonitor                                                                              | `{}`                                                                                                                                                    |
| `metrics.serviceMonitor.labels`               | Extra labels for the ServiceMonitor                                                                                               | `{}`                                                                                                                                                    |
| `metrics.serviceMonitor.jobLabel`             | The name of the label on the target service to use as the job name in Prometheus                                                  | `""`                                                                                                                                                    |
| `metrics.serviceMonitor.honorLabels`          | honorLabels chooses the metric's labels on collisions with target labels                                                          | `false`                                                                                                                                                 |
| `metrics.serviceMonitor.interval`             | Interval at which metrics should be scraped.                                                                                      | `""`                                                                                                                                                    |
| `metrics.serviceMonitor.scrapeTimeout`        | Timeout after which the scrape is ended                                                                                           | `""`                                                                                                                                                    |
| `metrics.serviceMonitor.metricRelabelings`    | Specify additional relabeling of metrics                                                                                          | `[]`                                                                                                                                                    |
| `metrics.serviceMonitor.relabelings`          | Specify general relabeling                                                                                                        | `[]`                                                                                                                                                    |
| `metrics.serviceMonitor.selector`             | Prometheus instance selector labels                                                                                               | `{}`                                                                                                                                                    |
| `minio`                                       | For full list of MinIO&reg; values configurations please refere [here](https://github.com/bitnami/charts/tree/main/bitnami/minio) |                                                                                                                                                         |
| `minio.enabled`                               | Enable/disable MinIO&reg; chart installation                                                                                      | `true`                                                                                                                                                  |
| `minio.auth.rootUser`                         | MinIO&reg; root username                                                                                                          | `admin`                                                                                                                                                 |
| `minio.auth.rootPassword`                     | Password for MinIO&reg; root user                                                                                                 | `""`                                                                                                                                                    |
| `minio.auth.existingSecret`                   | Name of an existing secret containing the MinIO&reg; credentials                                                                  | `""`                                                                                                                                                    |
| `minio.defaultBuckets`                        | Comma, semi-colon or space separated list of MinIO&reg; buckets to create                                                         | `mimir, ruler, alertmanager`                                                                                                                            |
| `minio.provisioning.enabled`                  | Enable/disable MinIO&reg; provisioning job                                                                                        | `true`                                                                                                                                                  |
| `minio.provisioning.extraCommands`            | Extra commands to run on MinIO&reg; provisioning job                                                                              | `["mc anonymous set download provisioning/mimir","mc anonymous set download provisioning/ruler","mc anonymous set download provisioning/alertmanager"]` |
| `minio.tls.enabled`                           | Enable/disable MinIO&reg; TLS support                                                                                             | `false`                                                                                                                                                 |
| `minio.service.type`                          | MinIO&reg; service type                                                                                                           | `ClusterIP`                                                                                                                                             |
| `minio.service.loadBalancerIP`                | MinIO&reg; service LoadBalancer IP                                                                                                | `""`                                                                                                                                                    |
| `minio.service.ports.api`                     | MinIO&reg; service port                                                                                                           | `80`                                                                                                                                                    |

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

### External Memcached (Index) Parameters

| Name                          | Description                                   | Value   |
| ----------------------------- | --------------------------------------------- | ------- |
| `externalMemcachedIndex.host` | Host of a running external memcached instance | `""`    |
| `externalMemcachedIndex.port` | Port of a running external memcached instance | `11211` |

### Memcached Sub-chart Parameters (Index)

| Name                                     | Description                                                                                               | Value                 |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------- |
| `memcachedindex.enabled`                 | Deploy memcached sub-chart                                                                                | `true`                |
| `memcachedindex.image.registry`          | Memcached image registry                                                                                  | `docker.io`           |
| `memcachedindex.image.repository`        | Memcached image repository                                                                                | `bitnami/memcached`   |
| `memcachedindex.image.tag`               | Memcached image tag (immutable tags are recommended)                                                      | `1.6.20-debian-11-r2` |
| `memcachedindex.image.digest`            | Memcached image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                  |
| `memcachedindex.architecture`            | Memcached architecture                                                                                    | `high-availability`   |
| `memcachedindex.nameOverride`            | override the subchart name                                                                                | `""`                  |
| `memcachedindex.service.ports.memcached` | Memcached service port                                                                                    | `11211`               |

### External Memcached (Metadata) Parameters

| Name                             | Description                                   | Value   |
| -------------------------------- | --------------------------------------------- | ------- |
| `externalMemcachedMetadata.host` | Host of a running external memcached instance | `""`    |
| `externalMemcachedMetadata.port` | Port of a running external memcached instance | `11211` |

### Memcached Sub-chart Parameters (Metadata)

| Name                                        | Description                                                                                               | Value                 |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------------- | --------------------- |
| `memcachedmetadata.enabled`                 | Deploy memcached sub-chart                                                                                | `true`                |
| `memcachedmetadata.image.registry`          | Memcached image registry                                                                                  | `docker.io`           |
| `memcachedmetadata.image.repository`        | Memcached image repository                                                                                | `bitnami/memcached`   |
| `memcachedmetadata.image.tag`               | Memcached image tag (immutable tags are recommended)                                                      | `1.6.20-debian-11-r2` |
| `memcachedmetadata.image.digest`            | Memcached image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                  |
| `memcachedmetadata.architecture`            | Memcached architecture                                                                                    | `high-availability`   |
| `memcachedmetadata.nameOverride`            | override the subchart name                                                                                | `""`                  |
| `memcachedmetadata.service.ports.memcached` | Memcached service port                                                                                    | `11211`               |

See <https://github.com/bitnami-labs/readme-generator-for-helm> to create the table

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set mimir.image.debug=true \
  oci://registry-1.docker.io/bitnamicharts/grafana-mimir
```

The above command enables the debug mode in the image.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/grafana-mimir
```

> **Tip**: You can use the default [values.yaml](values.yaml) as starting point.

Once the chart is installed the remote write endpoints for Prometheus or Grafana Agent and the read address to be used as datasource in Grafana will be printed. Example:

```console
    Remote write endpoints for Prometheus or Grafana Agent:
      http://grafana-mimir-gateway.default.svc.cluster.local/api/v1/push
    Read address, Grafana data source (Prometheus) URL:
      http://grafana-mimir-gateway.default.svc.cluster.local/prometheus
```

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Mimir configuration

The mimir configuration file `mimir.yaml` is shared across the different components: `distributor`, `compactor`, `ingester`, `querier`, `query-frontend` and `store-gateway`. This is set in the `mimir.configuration` value. That value is templated, so you can use other chart values or templates in your configuration. Check the official [Mimir Mimir documentation](https://grafana.com/docs/mimir/latest/operators-guide/configure/reference-configuration-parameters) for the list of possible configurations.

### Data

The [Bitnami grafana-mimir](https://github.com/bitnami/containers/tree/main/bitnami/grafana-mimir) image stores the data at the `/bitnami` path of the container. Persistent Volume Claims are used to keep the data across deployments.

### Additional environment variables

In case you want to add extra environment variables (useful for advanced operations like custom init scripts), you can use the `extraEnvVars` property inside each of the subsections: `distributor`, `compactor`, `ingester`, `querier`, `queryFrontend` and `storeGateway`. This is very useful if you need to [use enviroment variables in your config file](https://grafana.com/docs/mimir/v2.6.x/reference-configuration-parameters/#use-environment-variables-in-the-configuration) for example to set

```yaml
mimir:
  blockStorage:
    backend: s3
    config: |
      access_key_id: ${S3_ACCESS_KEY_ID}
      secret_access_key: ${S3_SECRET_ACCESS_KEY}
      bucket_name: mimir
      endpoint: s3.us-east-1.amazonaws.com
      insecure: false
storeGateway:
  extraEnvVars:
    - name: S3_ACCESS_KEY_ID
      valueFrom:
        secretKeyRef:
          name: s3-credentials-secret
          key: access-key-id
    - name: S3_SECRET_ACCESS_KEY
      valueFrom:
        secretKeyRef:
          name: s3-credentials-secret
          key: secret-access-key
```

Alternatively, you can use a ConfigMap or a Secret with the environment variables. To do so, use the `extraEnvVarsCM` or the `extraEnvVarsSecret` values.

### Pod affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, use one of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters inside each of the subsections: `distributor`, `compactor`, `ingester`, `querier`, `queryFrontend` and `storeGateway`.

### External cache support

You may want to have Grafana Mimir connect to an external Memcached rather than installing one inside your cluster. Typical reasons for this are to use a managed cache service, or to share a common cache server for all your applications. To achieve this, the chart allows you to specify credentials for an external database with the [`externalMemcached*` parameters](#parameters). You should also disable the Memcached installation with the `enabled` option. Here is an example:

```console
memcachedchunks.enabled=false
externalMemcachedChunks.host=myexternalhost
externalMemcachedChunks.port=11211
```

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

## Upgrading

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