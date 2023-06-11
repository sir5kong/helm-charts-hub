<!--- app-name: HashiCorp Vault -->

# HashiCorp Vault packaged by Bitnami

Vault is a tool for securely managing and accessing secrets using a unified interface. Features secure storage, dynamic secrets, data encryption and revocation.

[Overview of HashiCorp Vault](https://www.vaultproject.io/)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/vault
```

## Introduction

This chart bootstraps a [HashiCorp Vault](https://github.com/bitnami/containers/tree/main/bitnami/vault) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.com/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release my-repo/vault
```

The command deploys vault on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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

### Vault Server Parameters

| Name                                                       | Description                                                                                                                                             | Value                 |
| ---------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| `server.enabled`                                           | Enable Vault Server                                                                                                                                     | `true`                |
| `server.image.registry`                                    | Vault Server image registry                                                                                                                             | `docker.io`           |
| `server.image.repository`                                  | Vault Server image repository                                                                                                                           | `bitnami/vault`       |
| `server.image.tag`                                         | Vault Server image tag (immutable tags are recommended)                                                                                                 | `1.13.2-debian-11-r0` |
| `server.image.digest`                                      | Vault Server image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                  |
| `server.image.pullPolicy`                                  | Vault Server image pull policy                                                                                                                          | `IfNotPresent`        |
| `server.image.pullSecrets`                                 | Vault Server image pull secrets                                                                                                                         | `[]`                  |
| `server.image.debug`                                       | Enable Vault Server image debug mode                                                                                                                    | `false`               |
| `server.replicaCount`                                      | Number of Vault Server replicas to deploy                                                                                                               | `1`                   |
| `server.podManagementPolicy`                               | Pod management policy                                                                                                                                   | `Parallel`            |
| `server.containerPorts.http`                               | Vault Server http container port                                                                                                                        | `8200`                |
| `server.containerPorts.internal`                           | Vault Server internal (HTTPS) container port                                                                                                            | `8201`                |
| `server.livenessProbe.enabled`                             | Enable livenessProbe on Vault Server containers                                                                                                         | `false`               |
| `server.livenessProbe.initialDelaySeconds`                 | Initial delay seconds for livenessProbe                                                                                                                 | `5`                   |
| `server.livenessProbe.periodSeconds`                       | Period seconds for livenessProbe                                                                                                                        | `10`                  |
| `server.livenessProbe.timeoutSeconds`                      | Timeout seconds for livenessProbe                                                                                                                       | `5`                   |
| `server.livenessProbe.failureThreshold`                    | Failure threshold for livenessProbe                                                                                                                     | `5`                   |
| `server.livenessProbe.successThreshold`                    | Success threshold for livenessProbe                                                                                                                     | `1`                   |
| `server.readinessProbe.enabled`                            | Enable readinessProbe on Vault Server containers                                                                                                        | `true`                |
| `server.readinessProbe.initialDelaySeconds`                | Initial delay seconds for readinessProbe                                                                                                                | `5`                   |
| `server.readinessProbe.periodSeconds`                      | Period seconds for readinessProbe                                                                                                                       | `10`                  |
| `server.readinessProbe.timeoutSeconds`                     | Timeout seconds for readinessProbe                                                                                                                      | `5`                   |
| `server.readinessProbe.failureThreshold`                   | Failure threshold for readinessProbe                                                                                                                    | `5`                   |
| `server.readinessProbe.successThreshold`                   | Success threshold for readinessProbe                                                                                                                    | `1`                   |
| `server.startupProbe.enabled`                              | Enable startupProbe on Vault Server containers                                                                                                          | `false`               |
| `server.startupProbe.initialDelaySeconds`                  | Initial delay seconds for startupProbe                                                                                                                  | `5`                   |
| `server.startupProbe.periodSeconds`                        | Period seconds for startupProbe                                                                                                                         | `10`                  |
| `server.startupProbe.timeoutSeconds`                       | Timeout seconds for startupProbe                                                                                                                        | `5`                   |
| `server.startupProbe.failureThreshold`                     | Failure threshold for startupProbe                                                                                                                      | `5`                   |
| `server.startupProbe.successThreshold`                     | Success threshold for startupProbe                                                                                                                      | `1`                   |
| `server.customLivenessProbe`                               | Custom livenessProbe that overrides the default one                                                                                                     | `{}`                  |
| `server.customReadinessProbe`                              | Custom readinessProbe that overrides the default one                                                                                                    | `{}`                  |
| `server.customStartupProbe`                                | Custom startupProbe that overrides the default one                                                                                                      | `{}`                  |
| `server.resources.limits`                                  | The resources limits for the Vault Server containers                                                                                                    | `{}`                  |
| `server.resources.requests`                                | The requested resources for the Vault Server containers                                                                                                 | `{}`                  |
| `server.podSecurityContext.enabled`                        | Enabled Vault Server pods' Security Context                                                                                                             | `true`                |
| `server.podSecurityContext.fsGroup`                        | Set Vault Server pod's Security Context fsGroup                                                                                                         | `1001`                |
| `server.podSecurityContext.seccompProfile.type`            | Set Vault Server container's Security Context seccomp profile                                                                                           | `RuntimeDefault`      |
| `server.containerSecurityContext.enabled`                  | Enabled Vault Server containers' Security Context                                                                                                       | `true`                |
| `server.containerSecurityContext.runAsUser`                | Set Vault Server containers' Security Context runAsUser                                                                                                 | `1001`                |
| `server.containerSecurityContext.runAsNonRoot`             | Set Vault Server containers' Security Context runAsNonRoot                                                                                              | `true`                |
| `server.containerSecurityContext.readOnlyRootFilesystem`   | Set Vault Server containers' Security Context runAsNonRoot                                                                                              | `true`                |
| `server.containerSecurityContext.allowPrivilegeEscalation` | Set Vault Server container's privilege escalation                                                                                                       | `false`               |
| `server.containerSecurityContext.capabilities.drop`        | Set Vault Server container's Security Context runAsNonRoot                                                                                              | `["ALL"]`             |
| `server.command`                                           | Override default container command (useful when using custom images)                                                                                    | `[]`                  |
| `server.args`                                              | Override default container args (useful when using custom images)                                                                                       | `[]`                  |
| `server.hostAliases`                                       | Vault Server pods host aliases                                                                                                                          | `[]`                  |
| `server.config`                                            | Vault server configuration (evaluated as a template)                                                                                                    | `""`                  |
| `server.existingConfigMap`                                 | name of a ConfigMap with existing configuration for the server                                                                                          | `""`                  |
| `server.podLabels`                                         | Extra labels for Vault Server pods                                                                                                                      | `{}`                  |
| `server.podAnnotations`                                    | Annotations for Vault Server pods                                                                                                                       | `{}`                  |
| `server.podAffinityPreset`                                 | Pod affinity preset. Ignored if `server.affinity` is set. Allowed values: `soft` or `hard`                                                              | `""`                  |
| `server.podAntiAffinityPreset`                             | Pod anti-affinity preset. Ignored if `server.affinity` is set. Allowed values: `soft` or `hard`                                                         | `soft`                |
| `server.pdb.create`                                        | Enable/disable a Pod Disruption Budget creation                                                                                                         | `false`               |
| `server.pdb.minAvailable`                                  | Minimum number/percentage of pods that should remain scheduled                                                                                          | `1`                   |
| `server.pdb.maxUnavailable`                                | Maximum number/percentage of pods that may be made unavailable                                                                                          | `""`                  |
| `server.nodeAffinityPreset.type`                           | Node affinity preset type. Ignored if `server.affinity` is set. Allowed values: `soft` or `hard`                                                        | `""`                  |
| `server.nodeAffinityPreset.key`                            | Node label key to match. Ignored if `server.affinity` is set                                                                                            | `""`                  |
| `server.nodeAffinityPreset.values`                         | Node label values to match. Ignored if `server.affinity` is set                                                                                         | `[]`                  |
| `server.affinity`                                          | Affinity for Vault Server pods assignment                                                                                                               | `{}`                  |
| `server.nodeSelector`                                      | Node labels for Vault Server pods assignment                                                                                                            | `{}`                  |
| `server.tolerations`                                       | Tolerations for Vault Server pods assignment                                                                                                            | `[]`                  |
| `server.updateStrategy.type`                               | Vault Server statefulset strategy type                                                                                                                  | `RollingUpdate`       |
| `server.priorityClassName`                                 | Vault Server pods' priorityClassName                                                                                                                    | `""`                  |
| `server.topologySpreadConstraints`                         | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template                                | `[]`                  |
| `server.schedulerName`                                     | Name of the k8s scheduler (other than default) for Vault Server pods                                                                                    | `""`                  |
| `server.terminationGracePeriodSeconds`                     | Seconds Redmine pod needs to terminate gracefully                                                                                                       | `""`                  |
| `server.lifecycleHooks`                                    | for the Vault Server container(s) to automate configuration before or after startup                                                                     | `{}`                  |
| `server.extraEnvVars`                                      | Array with extra environment variables to add to Vault Server nodes                                                                                     | `[]`                  |
| `server.extraEnvVarsCM`                                    | Name of existing ConfigMap containing extra env vars for Vault Server nodes                                                                             | `""`                  |
| `server.extraEnvVarsSecret`                                | Name of existing Secret containing extra env vars for Vault Server nodes                                                                                | `""`                  |
| `server.extraVolumes`                                      | Optionally specify extra list of additional volumes for the Vault Server pod(s)                                                                         | `[]`                  |
| `server.extraVolumeMounts`                                 | Optionally specify extra list of additional volumeMounts for the Vault Server container(s)                                                              | `[]`                  |
| `server.sidecars`                                          | Add additional sidecar containers to the Vault Server pod(s)                                                                                            | `[]`                  |
| `server.initContainers`                                    | Add additional init containers to the Vault Server pod(s)                                                                                               | `[]`                  |

### Vault Server Traffic Exposure Parameters

| Name                                              | Description                                                                                                                      | Value                    |
| ------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `server.service.general.type`                     | Vault Server service type                                                                                                        | `ClusterIP`              |
| `server.service.general.ports.http`               | Vault Server service HTTP port                                                                                                   | `8200`                   |
| `server.service.general.ports.internal`           | Vault Server internal port                                                                                                       | `8201`                   |
| `server.service.general.nodePorts.http`           | Node port for HTTP                                                                                                               | `""`                     |
| `server.service.general.nodePorts.internal`       | Node port for HTTP                                                                                                               | `""`                     |
| `server.service.general.clusterIP`                | Vault Server service Cluster IP                                                                                                  | `""`                     |
| `server.service.general.loadBalancerIP`           | Vault Server service Load Balancer IP                                                                                            | `""`                     |
| `server.service.general.loadBalancerSourceRanges` | Vault Server service Load Balancer sources                                                                                       | `[]`                     |
| `server.service.general.externalTrafficPolicy`    | Vault Server service external traffic policy                                                                                     | `Cluster`                |
| `server.service.general.annotations`              | Additional custom annotations for Vault Server service                                                                           | `{}`                     |
| `server.service.general.extraPorts`               | Extra ports to expose in Vault Server service (normally used with the `sidecars` value)                                          | `[]`                     |
| `server.service.general.sessionAffinity`          | Control where web requests go, to the same pod or round-robin                                                                    | `None`                   |
| `server.service.general.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                     |
| `server.service.active.type`                      | Vault Server service type                                                                                                        | `ClusterIP`              |
| `server.service.active.ports.http`                | Vault Server service HTTP port                                                                                                   | `8200`                   |
| `server.service.active.ports.internal`            | Vault Server internal port                                                                                                       | `8201`                   |
| `server.service.active.nodePorts.http`            | Node port for HTTP                                                                                                               | `""`                     |
| `server.service.active.nodePorts.internal`        | Node port for HTTP                                                                                                               | `""`                     |
| `server.service.active.clusterIP`                 | Vault Server service Cluster IP                                                                                                  | `""`                     |
| `server.service.active.loadBalancerIP`            | Vault Server service Load Balancer IP                                                                                            | `""`                     |
| `server.service.active.loadBalancerSourceRanges`  | Vault Server service Load Balancer sources                                                                                       | `[]`                     |
| `server.service.active.externalTrafficPolicy`     | Vault Server service external traffic policy                                                                                     | `Cluster`                |
| `server.service.active.annotations`               | Additional custom annotations for Vault Server service                                                                           | `{}`                     |
| `server.service.active.extraPorts`                | Extra ports to expose in Vault Server service (normally used with the `sidecars` value)                                          | `[]`                     |
| `server.service.active.sessionAffinity`           | Control where web requests go, to the same pod or round-robin                                                                    | `None`                   |
| `server.service.active.sessionAffinityConfig`     | Additional settings for the sessionAffinity                                                                                      | `{}`                     |
| `server.ingress.enabled`                          | Enable ingress record generation for Vault                                                                                       | `false`                  |
| `server.ingress.pathType`                         | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `server.ingress.apiVersion`                       | Force Ingress API version (automatically detected if not set)                                                                    | `""`                     |
| `server.ingress.hostname`                         | Default host for the ingress record                                                                                              | `vault.local`            |
| `server.ingress.ingressClassName`                 | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                     |
| `server.ingress.path`                             | Default path for the ingress record                                                                                              | `/`                      |
| `server.ingress.annotations`                      | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `server.ingress.tls`                              | Enable TLS configuration for the host defined at `client.ingress.hostname` parameter                                             | `false`                  |
| `server.ingress.selfSigned`                       | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                  |
| `server.ingress.extraHosts`                       | An array with additional hostname(s) to be covered with the ingress record                                                       | `[]`                     |
| `server.ingress.extraPaths`                       | An array with additional arbitrary paths that may need to be added to the ingress under the main host                            | `[]`                     |
| `server.ingress.extraTls`                         | TLS configuration for additional hostname(s) to be covered with this ingress record                                              | `[]`                     |
| `server.ingress.secrets`                          | Custom TLS certificates as secrets                                                                                               | `[]`                     |
| `server.ingress.extraRules`                       | Additional rules to be covered with this ingress record                                                                          | `[]`                     |

### Vault Server RBAC Parameters

| Name                                                 | Description                                                      | Value  |
| ---------------------------------------------------- | ---------------------------------------------------------------- | ------ |
| `server.rbac.create`                                 | Specifies whether RBAC resources should be created               | `true` |
| `server.serviceAccount.create`                       | Specifies whether a ServiceAccount should be created             | `true` |
| `server.serviceAccount.name`                         | The name of the ServiceAccount to use.                           | `""`   |
| `server.serviceAccount.annotations`                  | Additional Service Account annotations (evaluated as a template) | `{}`   |
| `server.serviceAccount.automountServiceAccountToken` | Automount service account token for the server service account   | `true` |

### Source Conttroller Persistence Parameters

| Name                               | Description                                                                             | Value                 |
| ---------------------------------- | --------------------------------------------------------------------------------------- | --------------------- |
| `server.persistence.enabled`       | Enable persistence using Persistent Volume Claims                                       | `true`                |
| `server.persistence.mountPath`     | Persistent Volume mount root path                                                       | `/bitnami/vault/data` |
| `server.persistence.storageClass`  | Persistent Volume storage class                                                         | `""`                  |
| `server.persistence.accessModes`   | Persistent Volume access modes                                                          | `[]`                  |
| `server.persistence.size`          | Persistent Volume size                                                                  | `10Gi`                |
| `server.persistence.dataSource`    | Custom PVC data source                                                                  | `{}`                  |
| `server.persistence.annotations`   | Annotations for the PVC                                                                 | `{}`                  |
| `server.persistence.selector`      | Selector to match an existing Persistent Volume (this value is evaluated as a template) | `{}`                  |
| `server.persistence.existingClaim` | The name of an existing PVC to use for persistence                                      | `""`                  |

### Vault Server Metrics Parameters

| Name                                              | Description                                                                                            | Value   |
| ------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ------- |
| `server.metrics.enabled`                          | Enable the export of Prometheus metrics                                                                | `false` |
| `server.metrics.annotations`                      | Annotations for the server service in order to scrape metrics                                          | `{}`    |
| `server.metrics.serviceMonitor.enabled`           | if `true`, creates a Prometheus Operator ServiceMonitor (also requires `metrics.enabled` to be `true`) | `false` |
| `server.metrics.serviceMonitor.namespace`         | Namespace in which Prometheus is running                                                               | `""`    |
| `server.metrics.serviceMonitor.annotations`       | Additional custom annotations for the ServiceMonitor                                                   | `{}`    |
| `server.metrics.serviceMonitor.labels`            | Extra labels for the ServiceMonitor                                                                    | `{}`    |
| `server.metrics.serviceMonitor.jobLabel`          | The name of the label on the target service to use as the job name in Prometheus                       | `""`    |
| `server.metrics.serviceMonitor.honorLabels`       | honorLabels chooses the metric's labels on collisions with target labels                               | `false` |
| `server.metrics.serviceMonitor.interval`          | Interval at which metrics should be scraped.                                                           | `""`    |
| `server.metrics.serviceMonitor.scrapeTimeout`     | Timeout after which the scrape is ended                                                                | `""`    |
| `server.metrics.serviceMonitor.metricRelabelings` | Specify additional relabeling of metrics                                                               | `[]`    |
| `server.metrics.serviceMonitor.relabelings`       | Specify general relabeling                                                                             | `[]`    |
| `server.metrics.serviceMonitor.selector`          | Prometheus instance selector labels                                                                    | `{}`    |

### Vault CSI Provider Parameters

| Name                                                                     | Description                                                                                                                                                   | Value                                         |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------- |
| `csiProvider.enabled`                                                    | Enable Vault CSI Provider                                                                                                                                     | `false`                                       |
| `csiProvider.image.registry`                                             | Vault CSI Provider image registry                                                                                                                             | `docker.io`                                   |
| `csiProvider.image.repository`                                           | Vault CSI Provider image repository                                                                                                                           | `bitnami/vault-csi-provider`                  |
| `csiProvider.image.tag`                                                  | Vault CSI Provider image tag (immutable tags are recommended)                                                                                                 | `1.4.0-debian-11-r7`                          |
| `csiProvider.image.digest`                                               | Vault CSI Provider image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                                          |
| `csiProvider.image.pullPolicy`                                           | Vault CSI Provider image pull policy                                                                                                                          | `IfNotPresent`                                |
| `csiProvider.image.pullSecrets`                                          | Vault CSI Provider image pull secrets                                                                                                                         | `[]`                                          |
| `csiProvider.image.debug`                                                | Enable Vault CSI Provider image debug mode                                                                                                                    | `false`                                       |
| `csiProvider.config`                                                     | Vault CSI Provider configuration (evaluated as a template)                                                                                                    | `""`                                          |
| `csiProvider.existingConfigMap`                                          | name of a ConfigMap with existing configuration for the CSI Provider                                                                                          | `""`                                          |
| `csiProvider.secretStoreHostPath`                                        | Path to the host CSI Provider folder                                                                                                                          | `/etc/kubernetes/secrets-store-csi-providers` |
| `csiProvider.hostAliases`                                                | Vault CSI Provider pods host aliases                                                                                                                          | `[]`                                          |
| `csiProvider.podLabels`                                                  | Extra labels for Vault CSI Provider pods                                                                                                                      | `{}`                                          |
| `csiProvider.podAnnotations`                                             | Annotations for Vault CSI Provider pods                                                                                                                       | `{}`                                          |
| `csiProvider.podAffinityPreset`                                          | Pod affinity preset. Ignored if `csiProvider.affinity` is set. Allowed values: `soft` or `hard`                                                               | `""`                                          |
| `csiProvider.podAntiAffinityPreset`                                      | Pod anti-affinity preset. Ignored if `csiProvider.affinity` is set. Allowed values: `soft` or `hard`                                                          | `soft`                                        |
| `csiProvider.nodeAffinityPreset.type`                                    | Node affinity preset type. Ignored if `csiProvider.affinity` is set. Allowed values: `soft` or `hard`                                                         | `""`                                          |
| `csiProvider.nodeAffinityPreset.key`                                     | Node label key to match. Ignored if `csiProvider.affinity` is set                                                                                             | `""`                                          |
| `csiProvider.nodeAffinityPreset.values`                                  | Node label values to match. Ignored if `csiProvider.affinity` is set                                                                                          | `[]`                                          |
| `csiProvider.affinity`                                                   | Affinity for Vault CSI Provider pods assignment                                                                                                               | `{}`                                          |
| `csiProvider.nodeSelector`                                               | Node labels for Vault CSI Provider pods assignment                                                                                                            | `{}`                                          |
| `csiProvider.tolerations`                                                | Tolerations for Vault CSI Provider pods assignment                                                                                                            | `[]`                                          |
| `csiProvider.updateStrategy.type`                                        | Vault CSI Provider statefulset strategy type                                                                                                                  | `RollingUpdate`                               |
| `csiProvider.priorityClassName`                                          | Vault CSI Provider pods' priorityClassName                                                                                                                    | `""`                                          |
| `csiProvider.topologySpreadConstraints`                                  | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template                                      | `[]`                                          |
| `csiProvider.schedulerName`                                              | Name of the k8s scheduler (other than default) for Vault CSI Provider pods                                                                                    | `""`                                          |
| `csiProvider.terminationGracePeriodSeconds`                              | Seconds Redmine pod needs to terminate gracefully                                                                                                             | `""`                                          |
| `csiProvider.extraVolumes`                                               | Optionally specify extra list of additional volumes for the Vault CSI Provider pod(s)                                                                         | `[]`                                          |
| `csiProvider.sidecars`                                                   | Add additional sidecar containers to the Vault CSI Provider pod(s)                                                                                            | `[]`                                          |
| `csiProvider.initContainers`                                             | Add additional init containers to the Vault CSI Provider pod(s)                                                                                               | `[]`                                          |
| `csiProvider.podSecurityContext.enabled`                                 | Enabled CSI Provider pods' Security Context                                                                                                                   | `true`                                        |
| `csiProvider.podSecurityContext.fsGroup`                                 | Set CSI Provider pod's Security Context fsGroup                                                                                                               | `1001`                                        |
| `csiProvider.podSecurityContext.seccompProfile.type`                     | Set CSI Provider pod's Security Context seccomp profile                                                                                                       | `RuntimeDefault`                              |
| `csiProvider.provider.containerPorts.health`                             | CSI Provider health container port                                                                                                                            | `8080`                                        |
| `csiProvider.provider.livenessProbe.enabled`                             | Enable livenessProbe on CSI Provider container                                                                                                                | `true`                                        |
| `csiProvider.provider.livenessProbe.initialDelaySeconds`                 | Initial delay seconds for livenessProbe                                                                                                                       | `5`                                           |
| `csiProvider.provider.livenessProbe.periodSeconds`                       | Period seconds for livenessProbe                                                                                                                              | `10`                                          |
| `csiProvider.provider.livenessProbe.timeoutSeconds`                      | Timeout seconds for livenessProbe                                                                                                                             | `5`                                           |
| `csiProvider.provider.livenessProbe.failureThreshold`                    | Failure threshold for livenessProbe                                                                                                                           | `5`                                           |
| `csiProvider.provider.livenessProbe.successThreshold`                    | Success threshold for livenessProbe                                                                                                                           | `1`                                           |
| `csiProvider.provider.readinessProbe.enabled`                            | Enable readinessProbe on CSI Provider container                                                                                                               | `true`                                        |
| `csiProvider.provider.readinessProbe.initialDelaySeconds`                | Initial delay seconds for readinessProbe                                                                                                                      | `5`                                           |
| `csiProvider.provider.readinessProbe.periodSeconds`                      | Period seconds for readinessProbe                                                                                                                             | `10`                                          |
| `csiProvider.provider.readinessProbe.timeoutSeconds`                     | Timeout seconds for readinessProbe                                                                                                                            | `5`                                           |
| `csiProvider.provider.readinessProbe.failureThreshold`                   | Failure threshold for readinessProbe                                                                                                                          | `5`                                           |
| `csiProvider.provider.readinessProbe.successThreshold`                   | Success threshold for readinessProbe                                                                                                                          | `1`                                           |
| `csiProvider.provider.startupProbe.enabled`                              | Enable startupProbe on CSI Provider container                                                                                                                 | `false`                                       |
| `csiProvider.provider.startupProbe.initialDelaySeconds`                  | Initial delay seconds for startupProbe                                                                                                                        | `5`                                           |
| `csiProvider.provider.startupProbe.periodSeconds`                        | Period seconds for startupProbe                                                                                                                               | `10`                                          |
| `csiProvider.provider.startupProbe.timeoutSeconds`                       | Timeout seconds for startupProbe                                                                                                                              | `5`                                           |
| `csiProvider.provider.startupProbe.failureThreshold`                     | Failure threshold for startupProbe                                                                                                                            | `5`                                           |
| `csiProvider.provider.startupProbe.successThreshold`                     | Success threshold for startupProbe                                                                                                                            | `1`                                           |
| `csiProvider.provider.customLivenessProbe`                               | Custom livenessProbe that overrides the default one                                                                                                           | `{}`                                          |
| `csiProvider.provider.customReadinessProbe`                              | Custom readinessProbe that overrides the default one                                                                                                          | `{}`                                          |
| `csiProvider.provider.customStartupProbe`                                | Custom startupProbe that overrides the default one                                                                                                            | `{}`                                          |
| `csiProvider.provider.resources.limits`                                  | The resources limits for the CSI Provider container                                                                                                           | `{}`                                          |
| `csiProvider.provider.resources.requests`                                | The requested resources for the CSI Provider container                                                                                                        | `{}`                                          |
| `csiProvider.provider.containerSecurityContext.enabled`                  | Enabled CSI Provider container' Security Context                                                                                                              | `true`                                        |
| `csiProvider.provider.containerSecurityContext.runAsUser`                | Set CSI Provider container' Security Context runAsUser                                                                                                        | `1001`                                        |
| `csiProvider.provider.containerSecurityContext.runAsNonRoot`             | Set CSI Provider container' Security Context runAsNonRoot                                                                                                     | `true`                                        |
| `csiProvider.provider.containerSecurityContext.readOnlyRootFilesystem`   | Set CSI Provider container' Security Context runAsNonRoot                                                                                                     | `true`                                        |
| `csiProvider.provider.containerSecurityContext.allowPrivilegeEscalation` | Set CSI Provider container's privilege escalation                                                                                                             | `false`                                       |
| `csiProvider.provider.containerSecurityContext.capabilities.drop`        | Set CSI Provider container's Security Context runAsNonRoot                                                                                                    | `["ALL"]`                                     |
| `csiProvider.provider.command`                                           | Override default container command (useful when using custom images)                                                                                          | `[]`                                          |
| `csiProvider.provider.args`                                              | Override default container args (useful when using custom images)                                                                                             | `[]`                                          |
| `csiProvider.provider.lifecycleHooks`                                    | for the CSI Provider container(s) to automate configuration before or after startup                                                                           | `{}`                                          |
| `csiProvider.provider.extraEnvVars`                                      | Array with extra environment variables to add to CSI Provider nodes                                                                                           | `[]`                                          |
| `csiProvider.provider.extraEnvVarsCM`                                    | Name of existing ConfigMap containing extra env vars for CSI Provider nodes                                                                                   | `""`                                          |
| `csiProvider.provider.extraEnvVarsSecret`                                | Name of existing Secret containing extra env vars for CSI Provider nodes                                                                                      | `""`                                          |
| `csiProvider.provider.extraVolumeMounts`                                 | Optionally specify extra list of additional volumeMounts for the Vault CSI Provider container                                                                 | `[]`                                          |
| `csiProvider.agent.containerPorts.tcp`                                   | CSI Provider Agent metrics container port                                                                                                                     | `8200`                                        |
| `csiProvider.agent.livenessProbe.enabled`                                | Enable livenessProbe on CSI Provider Agent container                                                                                                          | `true`                                        |
| `csiProvider.agent.livenessProbe.initialDelaySeconds`                    | Initial delay seconds for livenessProbe                                                                                                                       | `5`                                           |
| `csiProvider.agent.livenessProbe.periodSeconds`                          | Period seconds for livenessProbe                                                                                                                              | `10`                                          |
| `csiProvider.agent.livenessProbe.timeoutSeconds`                         | Timeout seconds for livenessProbe                                                                                                                             | `5`                                           |
| `csiProvider.agent.livenessProbe.failureThreshold`                       | Failure threshold for livenessProbe                                                                                                                           | `5`                                           |
| `csiProvider.agent.livenessProbe.successThreshold`                       | Success threshold for livenessProbe                                                                                                                           | `1`                                           |
| `csiProvider.agent.readinessProbe.enabled`                               | Enable readinessProbe on CSI Provider Agent container                                                                                                         | `true`                                        |
| `csiProvider.agent.readinessProbe.initialDelaySeconds`                   | Initial delay seconds for readinessProbe                                                                                                                      | `5`                                           |
| `csiProvider.agent.readinessProbe.periodSeconds`                         | Period seconds for readinessProbe                                                                                                                             | `10`                                          |
| `csiProvider.agent.readinessProbe.timeoutSeconds`                        | Timeout seconds for readinessProbe                                                                                                                            | `5`                                           |
| `csiProvider.agent.readinessProbe.failureThreshold`                      | Failure threshold for readinessProbe                                                                                                                          | `5`                                           |
| `csiProvider.agent.readinessProbe.successThreshold`                      | Success threshold for readinessProbe                                                                                                                          | `1`                                           |
| `csiProvider.agent.startupProbe.enabled`                                 | Enable startupProbe on CSI Provider Agent container                                                                                                           | `false`                                       |
| `csiProvider.agent.startupProbe.initialDelaySeconds`                     | Initial delay seconds for startupProbe                                                                                                                        | `5`                                           |
| `csiProvider.agent.startupProbe.periodSeconds`                           | Period seconds for startupProbe                                                                                                                               | `10`                                          |
| `csiProvider.agent.startupProbe.timeoutSeconds`                          | Timeout seconds for startupProbe                                                                                                                              | `5`                                           |
| `csiProvider.agent.startupProbe.failureThreshold`                        | Failure threshold for startupProbe                                                                                                                            | `5`                                           |
| `csiProvider.agent.startupProbe.successThreshold`                        | Success threshold for startupProbe                                                                                                                            | `1`                                           |
| `csiProvider.agent.customLivenessProbe`                                  | Custom livenessProbe that overrides the default one                                                                                                           | `{}`                                          |
| `csiProvider.agent.customReadinessProbe`                                 | Custom readinessProbe that overrides the default one                                                                                                          | `{}`                                          |
| `csiProvider.agent.customStartupProbe`                                   | Custom startupProbe that overrides the default one                                                                                                            | `{}`                                          |
| `csiProvider.agent.containerSecurityContext.enabled`                     | Enabled CSI Agent container' Security Context                                                                                                                 | `true`                                        |
| `csiProvider.agent.containerSecurityContext.runAsUser`                   | Set CSI Agent container' Security Context runAsUser                                                                                                           | `1001`                                        |
| `csiProvider.agent.containerSecurityContext.runAsNonRoot`                | Set CSI Agent container' Security Context runAsNonRoot                                                                                                        | `true`                                        |
| `csiProvider.agent.containerSecurityContext.readOnlyRootFilesystem`      | Set CSI Agent container' Security Context runAsNonRoot                                                                                                        | `true`                                        |
| `csiProvider.agent.containerSecurityContext.allowPrivilegeEscalation`    | Set CSI Agent container's privilege escalation                                                                                                                | `false`                                       |
| `csiProvider.agent.containerSecurityContext.capabilities.drop`           | Set CSI Agent container's Security Context runAsNonRoot                                                                                                       | `["ALL"]`                                     |
| `csiProvider.agent.resources.limits`                                     | The resources limits for the CSI Provider Agent container                                                                                                     | `{}`                                          |
| `csiProvider.agent.resources.requests`                                   | The requested resources for the CSI Provider Agent container                                                                                                  | `{}`                                          |
| `csiProvider.agent.command`                                              | Override default container command (useful when using custom images)                                                                                          | `[]`                                          |
| `csiProvider.agent.args`                                                 | Override default container args (useful when using custom images)                                                                                             | `[]`                                          |
| `csiProvider.agent.lifecycleHooks`                                       | for the CSI Provider Agent container(s) to automate configuration before or after startup                                                                     | `{}`                                          |
| `csiProvider.agent.extraEnvVars`                                         | Array with extra environment variables to add to CSI Provider Agent nodes                                                                                     | `[]`                                          |
| `csiProvider.agent.extraEnvVarsCM`                                       | Name of existing ConfigMap containing extra env vars for CSI Provider Agent nodes                                                                             | `""`                                          |
| `csiProvider.agent.extraEnvVarsSecret`                                   | Name of existing Secret containing extra env vars for CSI Provider Agent nodes                                                                                | `""`                                          |
| `csiProvider.agent.extraVolumeMounts`                                    | Optionally specify extra list of additional volumeMounts for the CSI Provider container(s)                                                                    | `[]`                                          |

### Vault CSI Provider RBAC Parameters

| Name                                                      | Description                                                      | Value  |
| --------------------------------------------------------- | ---------------------------------------------------------------- | ------ |
| `csiProvider.rbac.create`                                 | Specifies whether RBAC resources should be created               | `true` |
| `csiProvider.rbac.rules`                                  | Custom RBAC rules to set                                         | `[]`   |
| `csiProvider.serviceAccount.create`                       | Specifies whether a ServiceAccount should be created             | `true` |
| `csiProvider.serviceAccount.name`                         | The name of the ServiceAccount to use.                           | `""`   |
| `csiProvider.serviceAccount.annotations`                  | Additional Service Account annotations (evaluated as a template) | `{}`   |
| `csiProvider.serviceAccount.automountServiceAccountToken` | Automount service account token for the server service account   | `true` |

### Vault Kubernetes Injector Parameters

| Name                                                         | Description                                                                                                                                                          | Value                 |
| ------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| `injector.enabled`                                           | Enable Vault Kubernetes Injector                                                                                                                                     | `true`                |
| `injector.image.registry`                                    | Vault Kubernetes Injector image registry                                                                                                                             | `docker.io`           |
| `injector.image.repository`                                  | Vault Kubernetes Injector image repository                                                                                                                           | `bitnami/vault-k8s`   |
| `injector.image.tag`                                         | Vault Kubernetes Injector image tag (immutable tags are recommended)                                                                                                 | `1.2.1-debian-11-r11` |
| `injector.image.digest`                                      | Vault Kubernetes Injector image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                  |
| `injector.image.pullPolicy`                                  | Vault Kubernetes Injector image pull policy                                                                                                                          | `IfNotPresent`        |
| `injector.image.pullSecrets`                                 | Vault Kubernetes Injector image pull secrets                                                                                                                         | `[]`                  |
| `injector.image.debug`                                       | Enable Vault Kubernetes Injector image debug mode                                                                                                                    | `false`               |
| `injector.replicaCount`                                      | Number of Vault Kubernetes Injector replicas to deploy                                                                                                               | `1`                   |
| `injector.containerPorts.https`                              | Vault Kubernetes Injector metrics container port                                                                                                                     | `8080`                |
| `injector.livenessProbe.enabled`                             | Enable livenessProbe on Vault Kubernetes Injector containers                                                                                                         | `true`                |
| `injector.livenessProbe.initialDelaySeconds`                 | Initial delay seconds for livenessProbe                                                                                                                              | `5`                   |
| `injector.livenessProbe.periodSeconds`                       | Period seconds for livenessProbe                                                                                                                                     | `10`                  |
| `injector.livenessProbe.timeoutSeconds`                      | Timeout seconds for livenessProbe                                                                                                                                    | `5`                   |
| `injector.livenessProbe.failureThreshold`                    | Failure threshold for livenessProbe                                                                                                                                  | `5`                   |
| `injector.livenessProbe.successThreshold`                    | Success threshold for livenessProbe                                                                                                                                  | `1`                   |
| `injector.readinessProbe.enabled`                            | Enable readinessProbe on Vault Kubernetes Injector containers                                                                                                        | `true`                |
| `injector.readinessProbe.initialDelaySeconds`                | Initial delay seconds for readinessProbe                                                                                                                             | `5`                   |
| `injector.readinessProbe.periodSeconds`                      | Period seconds for readinessProbe                                                                                                                                    | `10`                  |
| `injector.readinessProbe.timeoutSeconds`                     | Timeout seconds for readinessProbe                                                                                                                                   | `5`                   |
| `injector.readinessProbe.failureThreshold`                   | Failure threshold for readinessProbe                                                                                                                                 | `5`                   |
| `injector.readinessProbe.successThreshold`                   | Success threshold for readinessProbe                                                                                                                                 | `1`                   |
| `injector.startupProbe.enabled`                              | Enable startupProbe on Vault Kubernetes Injector containers                                                                                                          | `false`               |
| `injector.startupProbe.initialDelaySeconds`                  | Initial delay seconds for startupProbe                                                                                                                               | `5`                   |
| `injector.startupProbe.periodSeconds`                        | Period seconds for startupProbe                                                                                                                                      | `10`                  |
| `injector.startupProbe.timeoutSeconds`                       | Timeout seconds for startupProbe                                                                                                                                     | `5`                   |
| `injector.startupProbe.failureThreshold`                     | Failure threshold for startupProbe                                                                                                                                   | `5`                   |
| `injector.startupProbe.successThreshold`                     | Success threshold for startupProbe                                                                                                                                   | `1`                   |
| `injector.customLivenessProbe`                               | Custom livenessProbe that overrides the default one                                                                                                                  | `{}`                  |
| `injector.customReadinessProbe`                              | Custom readinessProbe that overrides the default one                                                                                                                 | `{}`                  |
| `injector.customStartupProbe`                                | Custom startupProbe that overrides the default one                                                                                                                   | `{}`                  |
| `injector.resources.limits`                                  | The resources limits for the Vault Kubernetes Injector containers                                                                                                    | `{}`                  |
| `injector.resources.requests`                                | The requested resources for the Vault Kubernetes Injector containers                                                                                                 | `{}`                  |
| `injector.podSecurityContext.enabled`                        | Enabled Vault Kubernetes Injector pods' Security Context                                                                                                             | `true`                |
| `injector.podSecurityContext.fsGroup`                        | Set Vault Kubernetes Injector pod's Security Context fsGroup                                                                                                         | `1001`                |
| `injector.podSecurityContext.seccompProfile.type`            | Set Vault Kubernetes Injector container's Security Context seccomp profile                                                                                           | `RuntimeDefault`      |
| `injector.containerSecurityContext.enabled`                  | Enabled Vault Kubernetes Injector containers' Security Context                                                                                                       | `true`                |
| `injector.containerSecurityContext.runAsUser`                | Set Vault Kubernetes Injector containers' Security Context runAsUser                                                                                                 | `1001`                |
| `injector.containerSecurityContext.runAsNonRoot`             | Set Vault Kubernetes Injector containers' Security Context runAsNonRoot                                                                                              | `true`                |
| `injector.containerSecurityContext.readOnlyRootFilesystem`   | Set Vault Kubernetes Injector containers' Security Context runAsNonRoot                                                                                              | `true`                |
| `injector.containerSecurityContext.allowPrivilegeEscalation` | Set Vault Kubernetes Injector container's privilege escalation                                                                                                       | `false`               |
| `injector.containerSecurityContext.capabilities.drop`        | Set Vault Kubernetes Injector container's Security Context runAsNonRoot                                                                                              | `["ALL"]`             |
| `injector.command`                                           | Override default container command (useful when using custom images)                                                                                                 | `[]`                  |
| `injector.args`                                              | Override default container args (useful when using custom images)                                                                                                    | `[]`                  |
| `injector.hostAliases`                                       | Vault Kubernetes Injector pods host aliases                                                                                                                          | `[]`                  |
| `injector.podLabels`                                         | Extra labels for Vault Kubernetes Injector pods                                                                                                                      | `{}`                  |
| `injector.podAnnotations`                                    | Annotations for Vault Kubernetes Injector pods                                                                                                                       | `{}`                  |
| `injector.podAffinityPreset`                                 | Pod affinity preset. Ignored if `injector.affinity` is set. Allowed values: `soft` or `hard`                                                                         | `""`                  |
| `injector.podAntiAffinityPreset`                             | Pod anti-affinity preset. Ignored if `injector.affinity` is set. Allowed values: `soft` or `hard`                                                                    | `soft`                |
| `injector.pdb.create`                                        | Enable/disable a Pod Disruption Budget creation                                                                                                                      | `false`               |
| `injector.pdb.minAvailable`                                  | Minimum number/percentage of pods that should remain scheduled                                                                                                       | `1`                   |
| `injector.pdb.maxUnavailable`                                | Maximum number/percentage of pods that may be made unavailable                                                                                                       | `""`                  |
| `injector.autoscaling.enabled`                               | Enable autoscaling for injector                                                                                                                                      | `false`               |
| `injector.autoscaling.minReplicas`                           | Minimum number of injector replicas                                                                                                                                  | `""`                  |
| `injector.autoscaling.maxReplicas`                           | Maximum number of injector replicas                                                                                                                                  | `""`                  |
| `injector.autoscaling.targetCPU`                             | Target CPU utilization percentage                                                                                                                                    | `""`                  |
| `injector.autoscaling.targetMemory`                          | Target Memory utilization percentage                                                                                                                                 | `""`                  |
| `injector.nodeAffinityPreset.type`                           | Node affinity preset type. Ignored if `injector.affinity` is set. Allowed values: `soft` or `hard`                                                                   | `""`                  |
| `injector.nodeAffinityPreset.key`                            | Node label key to match. Ignored if `injector.affinity` is set                                                                                                       | `""`                  |
| `injector.nodeAffinityPreset.values`                         | Node label values to match. Ignored if `injector.affinity` is set                                                                                                    | `[]`                  |
| `injector.affinity`                                          | Affinity for Vault Kubernetes Injector pods assignment                                                                                                               | `{}`                  |
| `injector.nodeSelector`                                      | Node labels for Vault Kubernetes Injector pods assignment                                                                                                            | `{}`                  |
| `injector.tolerations`                                       | Tolerations for Vault Kubernetes Injector pods assignment                                                                                                            | `[]`                  |
| `injector.updateStrategy.type`                               | Vault Kubernetes Injector statefulset strategy type                                                                                                                  | `RollingUpdate`       |
| `injector.priorityClassName`                                 | Vault Kubernetes Injector pods' priorityClassName                                                                                                                    | `""`                  |
| `injector.topologySpreadConstraints`                         | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template                                             | `[]`                  |
| `injector.schedulerName`                                     | Name of the k8s scheduler (other than default) for Vault Kubernetes Injector pods                                                                                    | `""`                  |
| `injector.terminationGracePeriodSeconds`                     | Seconds Redmine pod needs to terminate gracefully                                                                                                                    | `""`                  |
| `injector.lifecycleHooks`                                    | for the Vault Kubernetes Injector container(s) to automate configuration before or after startup                                                                     | `{}`                  |
| `injector.extraEnvVars`                                      | Array with extra environment variables to add to Vault Kubernetes Injector nodes                                                                                     | `[]`                  |
| `injector.extraEnvVarsCM`                                    | Name of existing ConfigMap containing extra env vars for Vault Kubernetes Injector nodes                                                                             | `""`                  |
| `injector.extraEnvVarsSecret`                                | Name of existing Secret containing extra env vars for Vault Kubernetes Injector nodes                                                                                | `""`                  |
| `injector.extraVolumes`                                      | Optionally specify extra list of additional volumes for the Vault Kubernetes Injector pod(s)                                                                         | `[]`                  |
| `injector.extraVolumeMounts`                                 | Optionally specify extra list of additional volumeMounts for the Vault Kubernetes Injector container(s)                                                              | `[]`                  |
| `injector.sidecars`                                          | Add additional sidecar containers to the Vault Kubernetes Injector pod(s)                                                                                            | `[]`                  |
| `injector.initContainers`                                    | Add additional init containers to the Vault Kubernetes Injector pod(s)                                                                                               | `[]`                  |

### Vault Kubernetes Injector Traffic Exposure Parameters

| Name                                        | Description                                                                                          | Value       |
| ------------------------------------------- | ---------------------------------------------------------------------------------------------------- | ----------- |
| `injector.service.type`                     | Vault Kubernetes Injector service type                                                               | `ClusterIP` |
| `injector.service.ports.https`              | Vault Kubernetes Injector service HTTPS port                                                         | `443`       |
| `injector.service.nodePorts.https`          | Node port for HTTPS                                                                                  | `""`        |
| `injector.service.clusterIP`                | Vault Kubernetes Injector service Cluster IP                                                         | `""`        |
| `injector.service.loadBalancerIP`           | Vault Kubernetes Injector service Load Balancer IP                                                   | `""`        |
| `injector.service.loadBalancerSourceRanges` | Vault Kubernetes Injector service Load Balancer sources                                              | `[]`        |
| `injector.service.externalTrafficPolicy`    | Vault Kubernetes Injector service external traffic policy                                            | `Cluster`   |
| `injector.service.annotations`              | Additional custom annotations for Vault Kubernetes Injector service                                  | `{}`        |
| `injector.service.extraPorts`               | Extra ports to expose in Vault Kubernetes Injector service (normally used with the `sidecars` value) | `[]`        |
| `injector.service.sessionAffinity`          | Control where web requests go, to the same pod or round-robin                                        | `None`      |
| `injector.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                          | `{}`        |

### Vault Kubernetes Injector RBAC Parameters

| Name                                                   | Description                                                                                                   | Value                   |
| ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `injector.rbac.create`                                 | Specifies whether RBAC resources should be created                                                            | `true`                  |
| `injector.rbac.rules`                                  | Custom RBAC rules to set                                                                                      | `[]`                    |
| `injector.serviceAccount.create`                       | Specifies whether a ServiceAccount should be created                                                          | `true`                  |
| `injector.serviceAccount.name`                         | The name of the ServiceAccount to use.                                                                        | `""`                    |
| `injector.serviceAccount.annotations`                  | Additional Service Account annotations (evaluated as a template)                                              | `{}`                    |
| `injector.serviceAccount.automountServiceAccountToken` | Automount service account token for the server service account                                                | `true`                  |
| `volumePermissions.enabled`                            | Enable init container that changes the owner/group of the PV mount point to `runAsUser:fsGroup`               | `false`                 |
| `volumePermissions.image.registry`                     | Bitnami Shell image registry                                                                                  | `docker.io`             |
| `volumePermissions.image.repository`                   | Bitnami Shell image repository                                                                                | `bitnami/bitnami-shell` |
| `volumePermissions.image.tag`                          | Bitnami Shell image tag (immutable tags are recommended)                                                      | `11-debian-11-r118`     |
| `volumePermissions.image.digest`                       | Bitnami Shell image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                    |
| `volumePermissions.image.pullPolicy`                   | Bitnami Shell image pull policy                                                                               | `IfNotPresent`          |
| `volumePermissions.image.pullSecrets`                  | Bitnami Shell image pull secrets                                                                              | `[]`                    |
| `volumePermissions.resources.limits`                   | The resources limits for the init container                                                                   | `{}`                    |
| `volumePermissions.resources.requests`                 | The requested resources for the init container                                                                | `{}`                    |
| `volumePermissions.containerSecurityContext.enabled`   | Enable init container's Security Context                                                                      | `true`                  |
| `volumePermissions.containerSecurityContext.runAsUser` | Set init container's Security Context runAsUser                                                               | `0`                     |

The above parameters map to the env variables defined in [bitnami/vault](https://github.com/bitnami/containers/tree/main/bitnami/vault). For more information please refer to the [bitnami/vault](https://github.com/bitnami/containers/tree/main/bitnami/vault) image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set csiProvider.enabled=true \
    my-repo/vault
```

The above command enables the Vault CSI Provider deployment.

> NOTE: Once this chart is deployed, it is not possible to change the application's access credentials, such as usernames or passwords, using Helm. To change these application credentials after deployment, delete any persistent volumes (PVs) used by the chart and re-deploy it, or use the application's built-in administrative tools if available.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml my-repo/vault
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Ingress

This chart provides support for Ingress resources. If you have an ingress controller installed on your cluster, such as [nginx-ingress-controller](https://github.com/bitnami/charts/tree/main/bitnami/nginx-ingress-controller) or [contour](https://github.com/bitnami/charts/tree/main/bitnami/contour) you can utilize the ingress controller to serve your application.

To enable Ingress integration, set `client.ingress.enabled` to `true`. The `client.ingress.hostname` property can be used to set the host name. The `client.ingress.tls` parameter can be used to add the TLS configuration for this host. It is also possible to have more than one host, with a separate TLS configuration for each host. [Learn more about configuring and using Ingress](https://docs.bitnami.com/kubernetes/apps/vault/configuration/configure-ingress/).

### TLS secrets

The chart also facilitates the creation of TLS secrets for use with the Ingress controller, with different options for certificate management. [Learn more about TLS secrets](https://docs.bitnami.com/kubernetes/apps/vault/administration/enable-tls-ingress/).

## Persistence

The [Bitnami vault](https://github.com/bitnami/containers/tree/main/bitnami/vault) image stores the vault data and configurations at the `/bitnami` path of the container. Persistent Volume Claims are used to keep the data across deployments. This is known to work in GCE, AWS, and minikube.

### Additional environment variables

In case you want to add extra environment variables (useful for advanced operations like custom init scripts), you can use the `extraEnvVars` property inside the `server`, `csiProvider` and `injector` sections.

```yaml
server:
  extraEnvVars:
    - name: LOG_LEVEL
      value: error
```

Alternatively, you can use a ConfigMap or a Secret with the environment variables. To do so, use the `extraEnvVarsCM` or the `extraEnvVarsSecret` values inside the `server`, `csiProvider` and `injector` sections.

### Sidecars

If additional containers are needed in the same pod as vault (such as additional metrics or logging exporters), they can be defined using the `sidecars` parameter inside the `server`, `csiProvider` and `injector` sections. If these sidecars export extra ports, extra port definitions can be added using the `service.extraPorts` parameter. [Learn more about configuring and using sidecar containers](https://docs.bitnami.com/kubernetes/apps/vault/administration/configure-use-sidecars/).

### Pod affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, use one of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters inside the `server`, `csiProvider` and `injector` sections.

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