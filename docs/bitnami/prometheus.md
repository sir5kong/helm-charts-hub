<!--- app-name: Prometheus -->

# Prometheus packaged by Bitnami

Prometheus is an open source monitoring and alerting system. It enables sysadmins to monitor their infrastructures by collecting metrics from configured targets at given intervals.

[Overview of Prometheus](https://prometheus.io/)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/prometheus
```

## Introduction

Bitnami charts for Helm are carefully engineered, actively maintained and are the quickest and easiest way to deploy containers on a Kubernetes cluster that are ready to handle production workloads.

This chart bootstraps a [Prometheus](https://prometheus.io) Deployment in a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

[Learn more about the default configuration of the chart](https://docs.bitnami.com/kubernetes/infrastructure/prometheus/get-started/).

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/prometheus
```

The command deploys Prometheus on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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
| `ingress.apiVersion`     | Force Ingress API version (automatically detected if not set)                           | `""`            |

### Alertmanager Parameters

| Name                                                           | Description                                                                                                                                             | Value                           |
| -------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| `alertmanager.enabled`                                         | Alertmanager enabled                                                                                                                                    | `true`                          |
| `alertmanager.image.registry`                                  | Alertmanager image registry                                                                                                                             | `docker.io`                     |
| `alertmanager.image.repository`                                | Alertmanager image repository                                                                                                                           | `bitnami/alertmanager`          |
| `alertmanager.image.tag`                                       | Alertmanager image tag (immutable tags are recommended)                                                                                                 | `0.25.0-debian-11-r54`          |
| `alertmanager.image.digest`                                    | Alertmanager image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                            |
| `alertmanager.image.pullPolicy`                                | Alertmanager image pull policy                                                                                                                          | `IfNotPresent`                  |
| `alertmanager.image.pullSecrets`                               | Alertmanager image pull secrets                                                                                                                         | `[]`                            |
| `alertmanager.configuration`                                   | Alertmanager configuration. This content will be stored in the the alertmanager.yaml file and the content can be a template.                            | `""`                            |
| `alertmanager.replicaCount`                                    | Number of Alertmanager replicas to deploy                                                                                                               | `1`                             |
| `alertmanager.containerPorts.http`                             | Alertmanager HTTP container port                                                                                                                        | `9093`                          |
| `alertmanager.containerPorts.cluster`                          | Alertmanager Cluster HA port                                                                                                                            | `9094`                          |
| `alertmanager.livenessProbe.enabled`                           | Enable livenessProbe on Alertmanager containers                                                                                                         | `true`                          |
| `alertmanager.livenessProbe.initialDelaySeconds`               | Initial delay seconds for livenessProbe                                                                                                                 | `5`                             |
| `alertmanager.livenessProbe.periodSeconds`                     | Period seconds for livenessProbe                                                                                                                        | `20`                            |
| `alertmanager.livenessProbe.timeoutSeconds`                    | Timeout seconds for livenessProbe                                                                                                                       | `3`                             |
| `alertmanager.livenessProbe.failureThreshold`                  | Failure threshold for livenessProbe                                                                                                                     | `3`                             |
| `alertmanager.livenessProbe.successThreshold`                  | Success threshold for livenessProbe                                                                                                                     | `1`                             |
| `alertmanager.readinessProbe.enabled`                          | Enable readinessProbe on Alertmanager containers                                                                                                        | `true`                          |
| `alertmanager.readinessProbe.initialDelaySeconds`              | Initial delay seconds for readinessProbe                                                                                                                | `5`                             |
| `alertmanager.readinessProbe.periodSeconds`                    | Period seconds for readinessProbe                                                                                                                       | `10`                            |
| `alertmanager.readinessProbe.timeoutSeconds`                   | Timeout seconds for readinessProbe                                                                                                                      | `2`                             |
| `alertmanager.readinessProbe.failureThreshold`                 | Failure threshold for readinessProbe                                                                                                                    | `5`                             |
| `alertmanager.readinessProbe.successThreshold`                 | Success threshold for readinessProbe                                                                                                                    | `1`                             |
| `alertmanager.startupProbe.enabled`                            | Enable startupProbe on Alertmanager containers                                                                                                          | `false`                         |
| `alertmanager.startupProbe.initialDelaySeconds`                | Initial delay seconds for startupProbe                                                                                                                  | `2`                             |
| `alertmanager.startupProbe.periodSeconds`                      | Period seconds for startupProbe                                                                                                                         | `5`                             |
| `alertmanager.startupProbe.timeoutSeconds`                     | Timeout seconds for startupProbe                                                                                                                        | `2`                             |
| `alertmanager.startupProbe.failureThreshold`                   | Failure threshold for startupProbe                                                                                                                      | `10`                            |
| `alertmanager.startupProbe.successThreshold`                   | Success threshold for startupProbe                                                                                                                      | `1`                             |
| `alertmanager.customLivenessProbe`                             | Custom livenessProbe that overrides the default one                                                                                                     | `{}`                            |
| `alertmanager.customReadinessProbe`                            | Custom readinessProbe that overrides the default one                                                                                                    | `{}`                            |
| `alertmanager.customStartupProbe`                              | Custom startupProbe that overrides the default one                                                                                                      | `{}`                            |
| `alertmanager.resources.limits`                                | The resources limits for the Alertmanager containers                                                                                                    | `{}`                            |
| `alertmanager.resources.requests`                              | The requested resources for the Alertmanager containers                                                                                                 | `{}`                            |
| `alertmanager.podSecurityContext.enabled`                      | Enabled Alertmanager pods' Security Context                                                                                                             | `true`                          |
| `alertmanager.podSecurityContext.fsGroup`                      | Set Alertmanager pod's Security Context fsGroup                                                                                                         | `1001`                          |
| `alertmanager.containerSecurityContext.enabled`                | Enabled Alertmanager containers' Security Context                                                                                                       | `true`                          |
| `alertmanager.containerSecurityContext.runAsUser`              | Set Alertmanager containers' Security Context runAsUser                                                                                                 | `1001`                          |
| `alertmanager.containerSecurityContext.runAsNonRoot`           | Set Alertmanager containers' Security Context runAsNonRoot                                                                                              | `true`                          |
| `alertmanager.containerSecurityContext.readOnlyRootFilesystem` | Set Alertmanager containers' Security Context runAsNonRoot                                                                                              | `false`                         |
| `alertmanager.existingConfigmap`                               | The name of an existing ConfigMap with your custom configuration for Alertmanager                                                                       | `""`                            |
| `alertmanager.existingConfigmapKey`                            | The name of the key with the Alertmanager config file                                                                                                   | `""`                            |
| `alertmanager.command`                                         | Override default container command (useful when using custom images)                                                                                    | `[]`                            |
| `alertmanager.args`                                            | Override default container args (useful when using custom images)                                                                                       | `[]`                            |
| `alertmanager.extraArgs`                                       | Additional arguments passed to the Prometheus server container                                                                                          | `[]`                            |
| `alertmanager.hostAliases`                                     | Alertmanager pods host aliases                                                                                                                          | `[]`                            |
| `alertmanager.podLabels`                                       | Extra labels for Alertmanager pods                                                                                                                      | `{}`                            |
| `alertmanager.podAnnotations`                                  | Annotations for Alertmanager pods                                                                                                                       | `{}`                            |
| `alertmanager.podAffinityPreset`                               | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                                     | `""`                            |
| `alertmanager.podAntiAffinityPreset`                           | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                                | `soft`                          |
| `alertmanager.pdb.create`                                      | Enable/disable a Pod Disruption Budget creation                                                                                                         | `false`                         |
| `alertmanager.pdb.minAvailable`                                | Minimum number/percentage of pods that should remain scheduled                                                                                          | `1`                             |
| `alertmanager.pdb.maxUnavailable`                              | Maximum number/percentage of pods that may be made unavailable                                                                                          | `""`                            |
| `alertmanager.nodeAffinityPreset.type`                         | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                               | `""`                            |
| `alertmanager.nodeAffinityPreset.key`                          | Node label key to match. Ignored if `affinity` is set                                                                                                   | `""`                            |
| `alertmanager.nodeAffinityPreset.values`                       | Node label values to match. Ignored if `affinity` is set                                                                                                | `[]`                            |
| `alertmanager.affinity`                                        | Affinity for Alertmanager pods assignment                                                                                                               | `{}`                            |
| `alertmanager.nodeSelector`                                    | Node labels for Alertmanager pods assignment                                                                                                            | `{}`                            |
| `alertmanager.tolerations`                                     | Tolerations for Alertmanager pods assignment                                                                                                            | `[]`                            |
| `alertmanager.updateStrategy.type`                             | Alertmanager statefulset strategy type                                                                                                                  | `RollingUpdate`                 |
| `alertmanager.podManagementPolicy`                             | Statefulset Pod management policy, it needs to be Parallel to be able to complete the cluster join                                                      | `OrderedReady`                  |
| `alertmanager.priorityClassName`                               | Alertmanager pods' priorityClassName                                                                                                                    | `""`                            |
| `alertmanager.topologySpreadConstraints`                       | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template                                | `[]`                            |
| `alertmanager.schedulerName`                                   | Name of the k8s scheduler (other than default) for Alertmanager pods                                                                                    | `""`                            |
| `alertmanager.terminationGracePeriodSeconds`                   | Seconds Redmine pod needs to terminate gracefully                                                                                                       | `""`                            |
| `alertmanager.lifecycleHooks`                                  | for the Alertmanager container(s) to automate configuration before or after startup                                                                     | `{}`                            |
| `alertmanager.extraEnvVars`                                    | Array with extra environment variables to add to Alertmanager nodes                                                                                     | `[]`                            |
| `alertmanager.extraEnvVarsCM`                                  | Name of existing ConfigMap containing extra env vars for Alertmanager nodes                                                                             | `""`                            |
| `alertmanager.extraEnvVarsSecret`                              | Name of existing Secret containing extra env vars for Alertmanager nodes                                                                                | `""`                            |
| `alertmanager.extraVolumes`                                    | Optionally specify extra list of additional volumes for the Alertmanager pod(s)                                                                         | `[]`                            |
| `alertmanager.extraVolumeMounts`                               | Optionally specify extra list of additional volumeMounts for the Alertmanager container(s)                                                              | `[]`                            |
| `alertmanager.sidecars`                                        | Add additional sidecar containers to the Alertmanager pod(s)                                                                                            | `[]`                            |
| `alertmanager.initContainers`                                  | Add additional init containers to the Alertmanager pod(s)                                                                                               | `[]`                            |
| `alertmanager.ingress.enabled`                                 | Enable ingress record generation for Alertmanager                                                                                                       | `false`                         |
| `alertmanager.ingress.pathType`                                | Ingress path type                                                                                                                                       | `ImplementationSpecific`        |
| `alertmanager.ingress.hostname`                                | Default host for the ingress record                                                                                                                     | `alertmanager.prometheus.local` |
| `alertmanager.ingress.ingressClassName`                        | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                                           | `""`                            |
| `alertmanager.ingress.path`                                    | Default path for the ingress record                                                                                                                     | `/`                             |
| `alertmanager.ingress.annotations`                             | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations.                        | `{}`                            |
| `alertmanager.ingress.tls`                                     | Enable TLS configuration for the host defined at `ingress.hostname` parameter                                                                           | `false`                         |
| `alertmanager.ingress.selfSigned`                              | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                                            | `false`                         |
| `alertmanager.ingress.extraHosts`                              | An array with additional hostname(s) to be covered with the ingress record                                                                              | `[]`                            |
| `alertmanager.ingress.extraPaths`                              | An array with additional arbitrary paths that may need to be added to the ingress under the main host                                                   | `[]`                            |
| `alertmanager.ingress.extraTls`                                | TLS configuration for additional hostname(s) to be covered with this ingress record                                                                     | `[]`                            |
| `alertmanager.ingress.secrets`                                 | Custom TLS certificates as secrets                                                                                                                      | `[]`                            |
| `alertmanager.ingress.extraRules`                              | Additional rules to be covered with this ingress record                                                                                                 | `[]`                            |
| `alertmanager.serviceAccount.create`                           | Specifies whether a ServiceAccount should be created                                                                                                    | `true`                          |
| `alertmanager.serviceAccount.name`                             | The name of the ServiceAccount to use.                                                                                                                  | `""`                            |
| `alertmanager.serviceAccount.annotations`                      | Additional Service Account annotations (evaluated as a template)                                                                                        | `{}`                            |
| `alertmanager.serviceAccount.automountServiceAccountToken`     | Automount service account token for the server service account                                                                                          | `true`                          |
| `alertmanager.service.type`                                    | Alertmanager service type                                                                                                                               | `LoadBalancer`                  |
| `alertmanager.service.ports.http`                              | Alertmanager service HTTP port                                                                                                                          | `80`                            |
| `alertmanager.service.ports.cluster`                           | Alertmanager cluster HA port                                                                                                                            | `9094`                          |
| `alertmanager.service.nodePorts.http`                          | Node port for HTTP                                                                                                                                      | `""`                            |
| `alertmanager.service.clusterIP`                               | Alertmanager service Cluster IP                                                                                                                         | `""`                            |
| `alertmanager.service.loadBalancerIP`                          | Alertmanager service Load Balancer IP                                                                                                                   | `""`                            |
| `alertmanager.service.loadBalancerSourceRanges`                | Alertmanager service Load Balancer sources                                                                                                              | `[]`                            |
| `alertmanager.service.externalTrafficPolicy`                   | Alertmanager service external traffic policy                                                                                                            | `Cluster`                       |
| `alertmanager.service.annotations`                             | Additional custom annotations for Alertmanager service                                                                                                  | `{}`                            |
| `alertmanager.service.extraPorts`                              | Extra ports to expose in Alertmanager service (normally used with the `sidecars` value)                                                                 | `[]`                            |
| `alertmanager.service.sessionAffinity`                         | Control where client requests go, to the same pod or round-robin                                                                                        | `None`                          |
| `alertmanager.service.sessionAffinityConfig`                   | Additional settings for the sessionAffinity                                                                                                             | `{}`                            |
| `alertmanager.persistence.enabled`                             | Enable Alertmanager data persistence using VolumeClaimTemplates                                                                                         | `false`                         |
| `alertmanager.persistence.mountPath`                           | Path to mount the volume at.                                                                                                                            | `/bitnami/alertmanager/data`    |
| `alertmanager.persistence.subPath`                             | The subdirectory of the volume to mount to, useful in dev environments and one PV for multiple services                                                 | `""`                            |
| `alertmanager.persistence.storageClass`                        | PVC Storage Class for Concourse worker data volume                                                                                                      | `""`                            |
| `alertmanager.persistence.accessModes`                         | PVC Access Mode for Concourse worker volume                                                                                                             | `["ReadWriteOnce"]`             |
| `alertmanager.persistence.size`                                | PVC Storage Request for Concourse worker volume                                                                                                         | `8Gi`                           |
| `alertmanager.persistence.annotations`                         | Annotations for the PVC                                                                                                                                 | `{}`                            |
| `alertmanager.persistence.selector`                            | Selector to match an existing Persistent Volume (this value is evaluated as a template)                                                                 | `{}`                            |

### Prometheus server Parameters

| Name                                                              | Description                                                                                                                                                                                 | Value                      |
| ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- |
| `server.image.registry`                                           | Prometheus image registry                                                                                                                                                                   | `docker.io`                |
| `server.image.repository`                                         | Prometheus image repository                                                                                                                                                                 | `bitnami/prometheus`       |
| `server.image.tag`                                                | Prometheus image tag (immutable tags are recommended)                                                                                                                                       | `2.44.0-debian-11-r7`      |
| `server.image.digest`                                             | Prometheus image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended)                                       | `""`                       |
| `server.image.pullPolicy`                                         | Prometheus image pull policy                                                                                                                                                                | `IfNotPresent`             |
| `server.image.pullSecrets`                                        | Prometheus image pull secrets                                                                                                                                                               | `[]`                       |
| `server.configuration`                                            | Promethus configuration. This content will be stored in the the prometheus.yaml file and the content can be a template.                                                                     | `""`                       |
| `server.alertingRules`                                            | Prometheus alerting rules. This content will be stored in the the rules.yaml file and the content can be a template.                                                                        | `{}`                       |
| `server.extraScrapeConfigs`                                       | Promethus configuration, useful to declare new scrape_configs. This content will be merged with the 'server.configuration' value and stored in the the prometheus.yaml file.                | `[]`                       |
| `server.replicaCount`                                             | Number of Prometheus replicas to deploy                                                                                                                                                     | `1`                        |
| `server.containerPorts.http`                                      | Prometheus HTTP container port                                                                                                                                                              | `9090`                     |
| `server.livenessProbe.enabled`                                    | Enable livenessProbe on Prometheus containers                                                                                                                                               | `true`                     |
| `server.livenessProbe.initialDelaySeconds`                        | Initial delay seconds for livenessProbe                                                                                                                                                     | `5`                        |
| `server.livenessProbe.periodSeconds`                              | Period seconds for livenessProbe                                                                                                                                                            | `20`                       |
| `server.livenessProbe.timeoutSeconds`                             | Timeout seconds for livenessProbe                                                                                                                                                           | `3`                        |
| `server.livenessProbe.failureThreshold`                           | Failure threshold for livenessProbe                                                                                                                                                         | `3`                        |
| `server.livenessProbe.successThreshold`                           | Success threshold for livenessProbe                                                                                                                                                         | `1`                        |
| `server.readinessProbe.enabled`                                   | Enable readinessProbe on Prometheus containers                                                                                                                                              | `true`                     |
| `server.readinessProbe.initialDelaySeconds`                       | Initial delay seconds for readinessProbe                                                                                                                                                    | `5`                        |
| `server.readinessProbe.periodSeconds`                             | Period seconds for readinessProbe                                                                                                                                                           | `10`                       |
| `server.readinessProbe.timeoutSeconds`                            | Timeout seconds for readinessProbe                                                                                                                                                          | `2`                        |
| `server.readinessProbe.failureThreshold`                          | Failure threshold for readinessProbe                                                                                                                                                        | `5`                        |
| `server.readinessProbe.successThreshold`                          | Success threshold for readinessProbe                                                                                                                                                        | `1`                        |
| `server.startupProbe.enabled`                                     | Enable startupProbe on Prometheus containers                                                                                                                                                | `false`                    |
| `server.startupProbe.initialDelaySeconds`                         | Initial delay seconds for startupProbe                                                                                                                                                      | `2`                        |
| `server.startupProbe.periodSeconds`                               | Period seconds for startupProbe                                                                                                                                                             | `5`                        |
| `server.startupProbe.timeoutSeconds`                              | Timeout seconds for startupProbe                                                                                                                                                            | `2`                        |
| `server.startupProbe.failureThreshold`                            | Failure threshold for startupProbe                                                                                                                                                          | `10`                       |
| `server.startupProbe.successThreshold`                            | Success threshold for startupProbe                                                                                                                                                          | `1`                        |
| `server.customLivenessProbe`                                      | Custom livenessProbe that overrides the default one                                                                                                                                         | `{}`                       |
| `server.customReadinessProbe`                                     | Custom readinessProbe that overrides the default one                                                                                                                                        | `{}`                       |
| `server.customStartupProbe`                                       | Custom startupProbe that overrides the default one                                                                                                                                          | `{}`                       |
| `server.resources.limits`                                         | The resources limits for the Prometheus containers                                                                                                                                          | `{}`                       |
| `server.resources.requests`                                       | The requested resources for the Prometheus containers                                                                                                                                       | `{}`                       |
| `server.podSecurityContext.enabled`                               | Enabled Prometheus pods' Security Context                                                                                                                                                   | `true`                     |
| `server.podSecurityContext.fsGroup`                               | Set Prometheus pod's Security Context fsGroup                                                                                                                                               | `1001`                     |
| `server.containerSecurityContext.enabled`                         | Enabled Prometheus containers' Security Context                                                                                                                                             | `true`                     |
| `server.containerSecurityContext.runAsUser`                       | Set Prometheus containers' Security Context runAsUser                                                                                                                                       | `1001`                     |
| `server.containerSecurityContext.runAsNonRoot`                    | Set Prometheus containers' Security Context runAsNonRoot                                                                                                                                    | `true`                     |
| `server.containerSecurityContext.readOnlyRootFilesystem`          | Set Prometheus containers' Security Context runAsNonRoot                                                                                                                                    | `false`                    |
| `server.existingConfigmap`                                        | The name of an existing ConfigMap with your custom configuration for Prometheus                                                                                                             | `""`                       |
| `server.existingConfigmapKey`                                     | The name of the key with the Prometheus config file                                                                                                                                         | `""`                       |
| `server.command`                                                  | Override default container command (useful when using custom images)                                                                                                                        | `[]`                       |
| `server.args`                                                     | Override default container args (useful when using custom images)                                                                                                                           | `[]`                       |
| `server.extraArgs`                                                | Additional arguments passed to the Prometheus server container                                                                                                                              | `[]`                       |
| `server.hostAliases`                                              | Prometheus pods host aliases                                                                                                                                                                | `[]`                       |
| `server.podLabels`                                                | Extra labels for Prometheus pods                                                                                                                                                            | `{}`                       |
| `server.podAnnotations`                                           | Annotations for Prometheus pods                                                                                                                                                             | `{}`                       |
| `server.podAffinityPreset`                                        | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                                                                         | `""`                       |
| `server.podAntiAffinityPreset`                                    | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                                                                    | `soft`                     |
| `server.pdb.create`                                               | Enable/disable a Pod Disruption Budget creation                                                                                                                                             | `false`                    |
| `server.pdb.minAvailable`                                         | Minimum number/percentage of pods that should remain scheduled                                                                                                                              | `1`                        |
| `server.pdb.maxUnavailable`                                       | Maximum number/percentage of pods that may be made unavailable                                                                                                                              | `""`                       |
| `server.nodeAffinityPreset.type`                                  | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                                                                                   | `""`                       |
| `server.nodeAffinityPreset.key`                                   | Node label key to match. Ignored if `affinity` is set                                                                                                                                       | `""`                       |
| `server.nodeAffinityPreset.values`                                | Node label values to match. Ignored if `affinity` is set                                                                                                                                    | `[]`                       |
| `server.affinity`                                                 | Affinity for Prometheus pods assignment                                                                                                                                                     | `{}`                       |
| `server.nodeSelector`                                             | Node labels for Prometheus pods assignment                                                                                                                                                  | `{}`                       |
| `server.tolerations`                                              | Tolerations for Prometheus pods assignment                                                                                                                                                  | `[]`                       |
| `server.updateStrategy.type`                                      | Prometheus deployment strategy type. If persistence is enabled, strategy type should be set to Recreate to avoid dead locks.                                                                | `RollingUpdate`            |
| `server.priorityClassName`                                        | Prometheus pods' priorityClassName                                                                                                                                                          | `""`                       |
| `server.topologySpreadConstraints`                                | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template                                                                    | `[]`                       |
| `server.schedulerName`                                            | Name of the k8s scheduler (other than default) for Prometheus pods                                                                                                                          | `""`                       |
| `server.terminationGracePeriodSeconds`                            | Seconds Redmine pod needs to terminate gracefully                                                                                                                                           | `""`                       |
| `server.lifecycleHooks`                                           | for the Prometheus container(s) to automate configuration before or after startup                                                                                                           | `{}`                       |
| `server.extraEnvVars`                                             | Array with extra environment variables to add to Prometheus nodes                                                                                                                           | `[]`                       |
| `server.extraEnvVarsCM`                                           | Name of existing ConfigMap containing extra env vars for Prometheus nodes                                                                                                                   | `""`                       |
| `server.extraEnvVarsSecret`                                       | Name of existing Secret containing extra env vars for Prometheus nodes                                                                                                                      | `""`                       |
| `server.extraVolumes`                                             | Optionally specify extra list of additional volumes for the Prometheus pod(s)                                                                                                               | `[]`                       |
| `server.extraVolumeMounts`                                        | Optionally specify extra list of additional volumeMounts for the Prometheus container(s)                                                                                                    | `[]`                       |
| `server.sidecars`                                                 | Add additional sidecar containers to the Prometheus pod(s)                                                                                                                                  | `[]`                       |
| `server.initContainers`                                           | Add additional init containers to the Prometheus pod(s)                                                                                                                                     | `[]`                       |
| `server.routePrefix`                                              | Prefix for the internal routes of web endpoints                                                                                                                                             | `/`                        |
| `server.remoteWrite`                                              | The remote_write spec configuration for Prometheus                                                                                                                                          | `[]`                       |
| `server.scrapeInterval`                                           | Interval between consecutive scrapes. Example: "1m"                                                                                                                                         | `""`                       |
| `server.scrapeTimeout`                                            | Interval between consecutive scrapes. Example: "10s"                                                                                                                                        | `""`                       |
| `server.evaluationInterval`                                       | Interval between consecutive evaluations. Example: "1m"                                                                                                                                     | `""`                       |
| `server.enableAdminAPI`                                           | Enable Prometheus adminitrative API                                                                                                                                                         | `false`                    |
| `server.enableRemoteWriteReceiver`                                | Enable Prometheus to be used as a receiver for the Prometheus remote write protocol.                                                                                                        | `false`                    |
| `server.enableFeatures`                                           | Enable access to Prometheus disabled features.                                                                                                                                              | `[]`                       |
| `server.logLevel`                                                 | Log level for Prometheus                                                                                                                                                                    | `info`                     |
| `server.logFormat`                                                | Log format for Prometheus                                                                                                                                                                   | `logfmt`                   |
| `server.retention`                                                | Metrics retention days                                                                                                                                                                      | `10d`                      |
| `server.retentionSize`                                            | Maximum size of metrics                                                                                                                                                                     | `0`                        |
| `server.alertingEndpoints`                                        | Alertmanagers to which alerts will be sent                                                                                                                                                  | `[]`                       |
| `server.externalLabels`                                           | External labels to add to any time series or alerts when communicating with external systems                                                                                                | `{}`                       |
| `server.thanos.create`                                            | Create a Thanos sidecar container                                                                                                                                                           | `false`                    |
| `server.thanos.image.registry`                                    | Thanos image registry                                                                                                                                                                       | `docker.io`                |
| `server.thanos.image.repository`                                  | Thanos image name                                                                                                                                                                           | `bitnami/thanos`           |
| `server.thanos.image.tag`                                         | Thanos image tag                                                                                                                                                                            | `0.31.0-scratch-r5`        |
| `server.thanos.image.digest`                                      | Thanos image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag                                                                                      | `""`                       |
| `server.thanos.image.pullPolicy`                                  | Thanos image pull policy                                                                                                                                                                    | `IfNotPresent`             |
| `server.thanos.image.pullSecrets`                                 | Specify docker-registry secret names as an array                                                                                                                                            | `[]`                       |
| `server.thanos.containerSecurityContext.enabled`                  | Enable container security context                                                                                                                                                           | `true`                     |
| `server.thanos.containerSecurityContext.readOnlyRootFilesystem`   | mount / (root) as a readonly filesystem                                                                                                                                                     | `false`                    |
| `server.thanos.containerSecurityContext.allowPrivilegeEscalation` | Switch privilegeEscalation possibility on or off                                                                                                                                            | `false`                    |
| `server.thanos.containerSecurityContext.runAsNonRoot`             | Force the container to run as a non root user                                                                                                                                               | `true`                     |
| `server.thanos.containerSecurityContext.capabilities.drop`        | Linux Kernel capabilities which should be dropped                                                                                                                                           | `[]`                       |
| `server.thanos.prometheusUrl`                                     | Override default prometheus url `http://localhost:9090`                                                                                                                                     | `""`                       |
| `server.thanos.extraArgs`                                         | Additional arguments passed to the thanos sidecar container                                                                                                                                 | `[]`                       |
| `server.thanos.objectStorageConfig.secretName`                    | Support mounting a Secret for the objectStorageConfig of the sideCar container.                                                                                                             | `""`                       |
| `server.thanos.objectStorageConfig.secretKey`                     | Secret key with the configuration file.                                                                                                                                                     | `thanos.yaml`              |
| `server.thanos.extraVolumeMounts`                                 | Additional volumeMounts from `server.volumes` for thanos sidecar container                                                                                                                  | `[]`                       |
| `server.thanos.resources.limits`                                  | The resources limits for the Thanos sidecar container                                                                                                                                       | `{}`                       |
| `server.thanos.resources.requests`                                | The resources requests for the Thanos sidecar container                                                                                                                                     | `{}`                       |
| `server.thanos.livenessProbe.enabled`                             | Turn on and off liveness probe                                                                                                                                                              | `true`                     |
| `server.thanos.livenessProbe.initialDelaySeconds`                 | Delay before liveness probe is initiated                                                                                                                                                    | `0`                        |
| `server.thanos.livenessProbe.periodSeconds`                       | How often to perform the probe                                                                                                                                                              | `5`                        |
| `server.thanos.livenessProbe.timeoutSeconds`                      | When the probe times out                                                                                                                                                                    | `3`                        |
| `server.thanos.livenessProbe.failureThreshold`                    | Minimum consecutive failures for the probe                                                                                                                                                  | `120`                      |
| `server.thanos.livenessProbe.successThreshold`                    | Minimum consecutive successes for the probe                                                                                                                                                 | `1`                        |
| `server.thanos.readinessProbe.enabled`                            | Turn on and off readiness probe                                                                                                                                                             | `true`                     |
| `server.thanos.readinessProbe.initialDelaySeconds`                | Delay before readiness probe is initiated                                                                                                                                                   | `0`                        |
| `server.thanos.readinessProbe.periodSeconds`                      | How often to perform the probe                                                                                                                                                              | `5`                        |
| `server.thanos.readinessProbe.timeoutSeconds`                     | When the probe times out                                                                                                                                                                    | `3`                        |
| `server.thanos.readinessProbe.failureThreshold`                   | Minimum consecutive failures for the probe                                                                                                                                                  | `120`                      |
| `server.thanos.readinessProbe.successThreshold`                   | Minimum consecutive successes for the probe                                                                                                                                                 | `1`                        |
| `server.thanos.customLivenessProbe`                               | Custom livenessProbe that overrides the default one                                                                                                                                         | `{}`                       |
| `server.thanos.customReadinessProbe`                              | Custom readinessProbe that overrides the default one                                                                                                                                        | `{}`                       |
| `server.thanos.service.type`                                      | Kubernetes service type                                                                                                                                                                     | `ClusterIP`                |
| `server.thanos.service.ports.grpc`                                | Thanos service port                                                                                                                                                                         | `10901`                    |
| `server.thanos.service.clusterIP`                                 | Specific cluster IP when service type is cluster IP. Use `None` to create headless service by default.                                                                                      | `None`                     |
| `server.thanos.service.nodePorts.grpc`                            | Specify the nodePort value for the LoadBalancer and NodePort service types.                                                                                                                 | `""`                       |
| `server.thanos.service.loadBalancerIP`                            | `loadBalancerIP` if service type is `LoadBalancer`                                                                                                                                          | `""`                       |
| `server.thanos.service.loadBalancerSourceRanges`                  | Address that are allowed when svc is `LoadBalancer`                                                                                                                                         | `[]`                       |
| `server.thanos.service.annotations`                               | Additional annotations for Prometheus service                                                                                                                                               | `{}`                       |
| `server.thanos.service.extraPorts`                                | Additional ports to expose from the Thanos sidecar container                                                                                                                                | `[]`                       |
| `server.thanos.service.externalTrafficPolicy`                     | Prometheus service external traffic policy                                                                                                                                                  | `Cluster`                  |
| `server.thanos.service.sessionAffinity`                           | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                                                                                                                        | `None`                     |
| `server.thanos.service.sessionAffinityConfig`                     | Additional settings for the sessionAffinity                                                                                                                                                 | `{}`                       |
| `server.thanos.ingress.enabled`                                   | Enable ingress controller resource                                                                                                                                                          | `false`                    |
| `server.thanos.ingress.pathType`                                  | Ingress path type                                                                                                                                                                           | `ImplementationSpecific`   |
| `server.thanos.ingress.hostname`                                  | Default host for the ingress record                                                                                                                                                         | `thanos.prometheus.local`  |
| `server.thanos.ingress.path`                                      | Default path for the ingress record                                                                                                                                                         | `/`                        |
| `server.thanos.ingress.annotations`                               | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations.                                                            | `{}`                       |
| `server.thanos.ingress.ingressClassName`                          | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                                                                               | `""`                       |
| `server.thanos.ingress.tls`                                       | Enable TLS configuration for the host defined at `ingress.hostname` parameter                                                                                                               | `false`                    |
| `server.thanos.ingress.selfSigned`                                | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                                                                                | `false`                    |
| `server.thanos.ingress.extraHosts`                                | An array with additional hostname(s) to be covered with the ingress record                                                                                                                  | `[]`                       |
| `server.thanos.ingress.extraPaths`                                | An array with additional arbitrary paths that may need to be added to the ingress under the main host                                                                                       | `[]`                       |
| `server.thanos.ingress.extraTls`                                  | TLS configuration for additional hostname(s) to be covered with this ingress record                                                                                                         | `[]`                       |
| `server.thanos.ingress.secrets`                                   | Custom TLS certificates as secrets                                                                                                                                                          | `[]`                       |
| `server.thanos.ingress.extraRules`                                | The list of additional rules to be added to this ingress record. Evaluated as a template                                                                                                    | `[]`                       |
| `server.ingress.enabled`                                          | Enable ingress record generation for Prometheus                                                                                                                                             | `false`                    |
| `server.ingress.pathType`                                         | Ingress path type                                                                                                                                                                           | `ImplementationSpecific`   |
| `server.ingress.hostname`                                         | Default host for the ingress record                                                                                                                                                         | `server.prometheus.local`  |
| `server.ingress.ingressClassName`                                 | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                                                                               | `""`                       |
| `server.ingress.path`                                             | Default path for the ingress record                                                                                                                                                         | `/`                        |
| `server.ingress.annotations`                                      | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations.                                                            | `{}`                       |
| `server.ingress.tls`                                              | Enable TLS configuration for the host defined at `ingress.hostname` parameter                                                                                                               | `false`                    |
| `server.ingress.selfSigned`                                       | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                                                                                | `false`                    |
| `server.ingress.extraHosts`                                       | An array with additional hostname(s) to be covered with the ingress record                                                                                                                  | `[]`                       |
| `server.ingress.extraPaths`                                       | An array with additional arbitrary paths that may need to be added to the ingress under the main host                                                                                       | `[]`                       |
| `server.ingress.extraTls`                                         | TLS configuration for additional hostname(s) to be covered with this ingress record                                                                                                         | `[]`                       |
| `server.ingress.secrets`                                          | Custom TLS certificates as secrets                                                                                                                                                          | `[]`                       |
| `server.ingress.extraRules`                                       | Additional rules to be covered with this ingress record                                                                                                                                     | `[]`                       |
| `server.serviceAccount.create`                                    | Specifies whether a ServiceAccount should be created                                                                                                                                        | `true`                     |
| `server.serviceAccount.name`                                      | The name of the ServiceAccount to use.                                                                                                                                                      | `""`                       |
| `server.serviceAccount.annotations`                               | Additional Service Account annotations (evaluated as a template)                                                                                                                            | `{}`                       |
| `server.serviceAccount.automountServiceAccountToken`              | Automount service account token for the server service account                                                                                                                              | `true`                     |
| `server.service.type`                                             | Prometheus service type                                                                                                                                                                     | `LoadBalancer`             |
| `server.service.ports.http`                                       | Prometheus service HTTP port                                                                                                                                                                | `80`                       |
| `server.service.nodePorts.http`                                   | Node port for HTTP                                                                                                                                                                          | `""`                       |
| `server.service.clusterIP`                                        | Prometheus service Cluster IP                                                                                                                                                               | `""`                       |
| `server.service.loadBalancerIP`                                   | Prometheus service Load Balancer IP                                                                                                                                                         | `""`                       |
| `server.service.loadBalancerSourceRanges`                         | Prometheus service Load Balancer sources                                                                                                                                                    | `[]`                       |
| `server.service.externalTrafficPolicy`                            | Prometheus service external traffic policy                                                                                                                                                  | `Cluster`                  |
| `server.service.annotations`                                      | Additional custom annotations for Prometheus service                                                                                                                                        | `{}`                       |
| `server.service.extraPorts`                                       | Extra ports to expose in Prometheus service (normally used with the `sidecars` value)                                                                                                       | `[]`                       |
| `server.service.sessionAffinity`                                  | Control where client requests go, to the same pod or round-robin. ClientIP by default.                                                                                                      | `ClientIP`                 |
| `server.service.sessionAffinityConfig`                            | Additional settings for the sessionAffinity                                                                                                                                                 | `{}`                       |
| `server.persistence.enabled`                                      | Enable persistence using Persistent Volume Claims. If you have multiple instances (server.repicacount > 1), please considere using an external storage service like Thanos or Grafana Mimir | `false`                    |
| `server.persistence.mountPath`                                    | Path to mount the volume at.                                                                                                                                                                | `/bitnami/prometheus/data` |
| `server.persistence.subPath`                                      | The subdirectory of the volume to mount to, useful in dev environments and one PV for multiple services                                                                                     | `""`                       |
| `server.persistence.storageClass`                                 | Storage class of backing PVC                                                                                                                                                                | `""`                       |
| `server.persistence.annotations`                                  | Persistent Volume Claim annotations                                                                                                                                                         | `{}`                       |
| `server.persistence.accessModes`                                  | Persistent Volume Access Modes                                                                                                                                                              | `["ReadWriteOnce"]`        |
| `server.persistence.size`                                         | Size of data volume                                                                                                                                                                         | `8Gi`                      |
| `server.persistence.existingClaim`                                | The name of an existing PVC to use for persistence                                                                                                                                          | `""`                       |
| `server.persistence.selector`                                     | Selector to match an existing Persistent Volume for WordPress data PVC                                                                                                                      | `{}`                       |
| `server.persistence.dataSource`                                   | Custom PVC data source                                                                                                                                                                      | `{}`                       |
| `server.rbac.create`                                              | Specifies whether RBAC resources should be created                                                                                                                                          | `true`                     |
| `server.rbac.rules`                                               | Custom RBAC rules to set                                                                                                                                                                    | `[]`                       |

### Init Container Parameters

| Name                                                   | Description                                                                                     | Value                   |
| ------------------------------------------------------ | ----------------------------------------------------------------------------------------------- | ----------------------- |
| `volumePermissions.enabled`                            | Enable init container that changes the owner/group of the PV mount point to `runAsUser:fsGroup` | `false`                 |
| `volumePermissions.image.registry`                     | Bitnami Shell image registry                                                                    | `docker.io`             |
| `volumePermissions.image.repository`                   | Bitnami Shell image repository                                                                  | `bitnami/bitnami-shell` |
| `volumePermissions.image.tag`                          | Bitnami Shell image tag (immutable tags are recommended)                                        | `11-debian-11-r122`     |
| `volumePermissions.image.pullPolicy`                   | Bitnami Shell image pull policy                                                                 | `IfNotPresent`          |
| `volumePermissions.image.pullSecrets`                  | Bitnami Shell image pull secrets                                                                | `[]`                    |
| `volumePermissions.resources.limits`                   | The resources limits for the init container                                                     | `{}`                    |
| `volumePermissions.resources.requests`                 | The requested resources for the init container                                                  | `{}`                    |
| `volumePermissions.containerSecurityContext.runAsUser` | Set init container's Security Context runAsUser                                                 | `0`                     |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release --set alertmanager.enabled=true \
  oci://registry-1.docker.io/bitnamicharts/prometheus
```

The above command install Prometheus chart with Alertmanager.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/prometheus
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Deploy extra resources

There are cases where you may want to deploy extra objects, such a ConfigMap containing your app's configuration or some extra deployment with a micro service used by your app. For covering this case, the chart allows adding the full specification of other objects using the `extraDeploy` parameter.

### Setting Pod's affinity

This chart allows you to set your custom affinity using the `XXX.affinity` parameter(s). Find more information about Pod's affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, you can use of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `XXX.podAffinityPreset`, `XXX.podAntiAffinityPreset`, or `XXX.nodeAffinityPreset` parameters.

### Integrate Prometheus and Alertmanager with Thanos

You can integrate Prometheus & Alertmanager with Thanos using this chart and the [Bitnami Thanos chart](https://github.com/bitnami/charts/tree/main/bitnami/thanos) following the steps below:

> Note: in this example we will use MinIO&reg; (subchart) as the Objstore. Every component will be deployed in the "monitoring" namespace.

- Create a **values.yaml** like the one below for Thanos:

```yaml
objstoreConfig: |-
  type: s3
  config:
    bucket: thanos
    endpoint: {{ include "thanos.minio.fullname" . }}.{{ .Release.Namespace }}.svc.cluster.local:9000
    access_key: minio
    secret_key: minio123
    insecure: true
query:
  dnsDiscovery:
    sidecarsService: prometheus-thanos
    sidecarsNamespace: monitoring
bucketweb:
  enabled: true
compactor:
  enabled: true
storegateway:
  enabled: true
ruler:
  enabled: true
  alertmanagers:
    - http://prometheus-alertmanager.monitoring.svc.cluster.local:9093
  config: |-
    groups:
      - name: "metamonitoring"
        rules:
          - alert: "PrometheusDown"
            expr: absent(up{prometheus="monitoring/prometheus"})
metrics:
  enabled: true
  serviceMonitor:
    enabled: true
minio:
  enabled: true
  auth:
    rootPassword: minio123
    rootUser: minio
  monitoringBuckets: thanos
  accessKey:
    password: minio
  secretKey:
    password: minio123
```

- Install Prometheus and Thanos charts:

For Helm 3:

```console
kubectl create namespace monitoring
helm install prometheus \
    --set prometheus.thanos.create=true \
    --namespace monitoring \
    oci://registry-1.docker.io/bitnamicharts/prometheus
helm install thanos \
    --values values.yaml \
    --namespace monitoring \
    oci://registry-1.docker.io/bitnamicharts/thanos
```

That's all! Now you have Thanos fully integrated with Prometheus and Alertmanager.

### Integrate Prometheus with Grafana Mimir

You can integrate Prometheus with Grafana Mimir using this chart and the [Bitnami Grafana Mimir chart](https://github.com/bitnami/charts/tree/main/bitnami/grafana-mimir) adding a `remoteWrite` entry:

- Create a **values.yaml** like the one below for Prometheus:

```yaml
server:
  remoteWrite:
    - url: http://grafana-mimir-gateway.svc.cluster.local/api/v1/push
      headers:
        X-Scope-OrgID: demo
```

- Install Prometheus and Grafana Mimir charts:

For Helm 3:

```console
kubectl create namespace monitoring
helm install prometheus \
    --values values.yaml \
    --namespace monitoring \
    oci://registry-1.docker.io/bitnamicharts/prometheus
helm install grafana-mimir \
    oci://registry-1.docker.io/bitnamicharts/grafana-mimir
```

That's all! Now you have Prometheus integrated with Grafana Mimir.

### Integrate Prometheus with Grafana

You can integrate Prometheus with Grafana Dashboard using this chart and the [Bitnami Grafana chart](https://github.com/bitnami/charts/tree/main/bitnami/grafana) just adding the prometheus datasources:

- Create a **values.yaml** like the one below for Grafana:

```yaml
datasources:
  secretDefinition:
    apiVersion: 1
    datasources:
      - name: Prometheus
        type: prometheus
        access: proxy
        orgId: 1
        url: http://prometheus.monitoring.svc.cluster.local
        version: 1
        editable: true
        isDefault: true
      - name: Alertmanager
        uid: alertmanager
        type: alertmanager
        access: proxy
        orgId: 1
        url: http://prometheus-alertmanager.monitoring.svc.cluster.local:9093
        version: 1
        editable: true
```

- Install Prometheus and Grafana charts:

For Helm 3:

```console
kubectl create namespace monitoring
helm install prometheus \
    --namespace monitoring \
    oci://registry-1.docker.io/bitnamicharts/prometheus
helm install grafana-mimir \
    --values values.yaml \
    --namespace monitoring \
    oci://registry-1.docker.io/bitnamicharts/grafana
```

### How to add new targets

By default this helm chart will monitor its own targets: prometheus and alertmanager. Additional ones can be added setting a list with the [scrape_configs](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#scrape_config) in the value `server.extraScrapeConfigs`. Here there is a simple example for wordpress (deployed in the default namespace):

```yaml
server:
  extraScrapeConfigs:
    - job_name: wordpress
      kubernetes_sd_configs:
        - role: endpoints
          namespaces:
            names:
            - default
      metrics_path: /metrics
      relabel_configs:
        - source_labels:
            - job
          target_label: __tmp_wordpress_job_name
        - action: keep
          source_labels:
            - __meta_kubernetes_service_label_app_kubernetes_io_instance
            - __meta_kubernetes_service_labelpresent_app_kubernetes_io_instance
          regex: (wordpress);true
        - action: keep
          source_labels:
            - __meta_kubernetes_service_label_app_kubernetes_io_name
            - __meta_kubernetes_service_labelpresent_app_kubernetes_io_name
          regex: (wordpress);true
        - action: keep
          source_labels:
            - __meta_kubernetes_endpoint_port_name
          regex: metrics
        - source_labels:
            - __meta_kubernetes_endpoint_address_target_kind
            - __meta_kubernetes_endpoint_address_target_name
          separator: ;
          regex: Node;(.*)
          replacement: ${1}
          target_label: node
        - source_labels:
            - __meta_kubernetes_endpoint_address_target_kind
            - __meta_kubernetes_endpoint_address_target_name
          separator: ;
          regex: Pod;(.*)
          replacement: ${1}
          target_label: pod
        - source_labels:
            - __meta_kubernetes_namespace
          target_label: namespace
        - source_labels:
            - __meta_kubernetes_service_name
          target_label: service
        - source_labels:
            - __meta_kubernetes_pod_name
          target_label: pod
        - source_labels:
            - __meta_kubernetes_pod_container_name
          target_label: container
        - action: drop
          source_labels:
            - __meta_kubernetes_pod_phase
          regex: (Failed|Succeeded)
        - source_labels:
            - __meta_kubernetes_service_name
          target_label: job
          replacement: ${1}
        - target_label: endpoint
          replacement: metrics
        - source_labels:
            - __address__
          target_label: __tmp_hash
          modulus: 1
          action: hashmod
        - source_labels:
            - __tmp_hash
          regex: 0
          action: keep
```

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