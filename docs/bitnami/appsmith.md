<!--- app-name: Appsmith -->

# Appsmith packaged by Bitnami

Appsmith is an open source platform for building and maintaining internal tools, such as custom dashboards, admin panels or CRUD apps.

[Overview of Appsmith](https://www.appsmith.com/)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/appsmith
```

## Introduction

Bitnami charts for Helm are carefully engineered, actively maintained and are the quickest and easiest way to deploy containers on a Kubernetes cluster that are ready to handle production workloads.

This chart bootstraps an [Appsmith](https://www.appsmith.com/) Deployment in a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.com/) for deployment and management of Helm Charts in clusters.

[Learn more about the default configuration of the chart](https://docs.bitnami.com/kubernetes/apps/appsmith/get-started/).

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/appsmith
```

The command deploys Appsmith on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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

| Name                     | Description                                                                                                                                         | Value                 |
| ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| `kubeVersion`            | Override Kubernetes version                                                                                                                         | `""`                  |
| `nameOverride`           | String to partially override common.names.name                                                                                                      | `""`                  |
| `fullnameOverride`       | String to fully override common.names.fullname                                                                                                      | `""`                  |
| `namespaceOverride`      | String to fully override common.names.namespace                                                                                                     | `""`                  |
| `commonLabels`           | Labels to add to all deployed objects                                                                                                               | `{}`                  |
| `commonAnnotations`      | Annotations to add to all deployed objects                                                                                                          | `{}`                  |
| `clusterDomain`          | Kubernetes cluster domain name                                                                                                                      | `cluster.local`       |
| `extraDeploy`            | Array of extra objects to deploy with the release                                                                                                   | `[]`                  |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden)                                                             | `false`               |
| `diagnosticMode.command` | Command to override all containers in the deployment                                                                                                | `["sleep"]`           |
| `diagnosticMode.args`    | Args to override all containers in the deployment                                                                                                   | `["infinity"]`        |
| `image.registry`         | Appsmith image registry                                                                                                                             | `docker.io`           |
| `image.repository`       | Appsmith image repository                                                                                                                           | `bitnami/appsmith`    |
| `image.tag`              | Appsmith image tag (immutable tags are recommended)                                                                                                 | `1.9.21-debian-11-r2` |
| `image.digest`           | Appsmith image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                  |
| `image.pullPolicy`       | Appsmith image pull policy                                                                                                                          | `IfNotPresent`        |
| `image.pullSecrets`      | Appsmith image pull secrets                                                                                                                         | `[]`                  |
| `image.debug`            | Enable Appsmith image debug mode                                                                                                                    | `false`               |

### Appsmith Client Parameters

| Name                                                     | Description                                                                                                              | Value           |
| -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | --------------- |
| `client.replicaCount`                                    | Number of Appsmith client replicas to deploy                                                                             | `1`             |
| `client.containerPorts.http`                             | Appsmith client HTTP container port                                                                                      | `8080`          |
| `client.livenessProbe.enabled`                           | Enable livenessProbe on Appsmith client containers                                                                       | `true`          |
| `client.livenessProbe.initialDelaySeconds`               | Initial delay seconds for livenessProbe                                                                                  | `30`            |
| `client.livenessProbe.periodSeconds`                     | Period seconds for livenessProbe                                                                                         | `10`            |
| `client.livenessProbe.timeoutSeconds`                    | Timeout seconds for livenessProbe                                                                                        | `5`             |
| `client.livenessProbe.failureThreshold`                  | Failure threshold for livenessProbe                                                                                      | `6`             |
| `client.livenessProbe.successThreshold`                  | Success threshold for livenessProbe                                                                                      | `1`             |
| `client.readinessProbe.enabled`                          | Enable readinessProbe on Appsmith client containers                                                                      | `true`          |
| `client.readinessProbe.initialDelaySeconds`              | Initial delay seconds for readinessProbe                                                                                 | `30`            |
| `client.readinessProbe.periodSeconds`                    | Period seconds for readinessProbe                                                                                        | `10`            |
| `client.readinessProbe.timeoutSeconds`                   | Timeout seconds for readinessProbe                                                                                       | `5`             |
| `client.readinessProbe.failureThreshold`                 | Failure threshold for readinessProbe                                                                                     | `6`             |
| `client.readinessProbe.successThreshold`                 | Success threshold for readinessProbe                                                                                     | `1`             |
| `client.startupProbe.enabled`                            | Enable startupProbe on Appsmith client containers                                                                        | `false`         |
| `client.startupProbe.initialDelaySeconds`                | Initial delay seconds for startupProbe                                                                                   | `30`            |
| `client.startupProbe.periodSeconds`                      | Period seconds for startupProbe                                                                                          | `10`            |
| `client.startupProbe.timeoutSeconds`                     | Timeout seconds for startupProbe                                                                                         | `5`             |
| `client.startupProbe.failureThreshold`                   | Failure threshold for startupProbe                                                                                       | `6`             |
| `client.startupProbe.successThreshold`                   | Success threshold for startupProbe                                                                                       | `1`             |
| `client.customLivenessProbe`                             | Custom livenessProbe that overrides the default one                                                                      | `{}`            |
| `client.customReadinessProbe`                            | Custom readinessProbe that overrides the default one                                                                     | `{}`            |
| `client.customStartupProbe`                              | Custom startupProbe that overrides the default one                                                                       | `{}`            |
| `client.resources.limits`                                | The resources limits for the Appsmith client containers                                                                  | `{}`            |
| `client.resources.requests`                              | The requested resources for the Appsmith client containers                                                               | `{}`            |
| `client.podSecurityContext.enabled`                      | Enabled Appsmith client pods' Security Context                                                                           | `true`          |
| `client.podSecurityContext.fsGroup`                      | Set Appsmith client pod's Security Context fsGroup                                                                       | `1001`          |
| `client.containerSecurityContext.enabled`                | Enabled Appsmith client containers' Security Context                                                                     | `true`          |
| `client.containerSecurityContext.runAsUser`              | Set Appsmith client containers' Security Context runAsUser                                                               | `1001`          |
| `client.containerSecurityContext.runAsNonRoot`           | Set Appsmith client containers' Security Context runAsNonRoot                                                            | `true`          |
| `client.containerSecurityContext.readOnlyRootFilesystem` | Set Appsmith client containers' Security Context runAsNonRoot                                                            | `false`         |
| `client.command`                                         | Override default container command (useful when using custom images)                                                     | `[]`            |
| `client.args`                                            | Override default container args (useful when using custom images)                                                        | `[]`            |
| `client.hostAliases`                                     | Appsmith client pods host aliases                                                                                        | `[]`            |
| `client.podLabels`                                       | Extra labels for Appsmith client pods                                                                                    | `{}`            |
| `client.podAnnotations`                                  | Annotations for Appsmith client pods                                                                                     | `{}`            |
| `client.podAffinityPreset`                               | Pod affinity preset. Ignored if `client.affinity` is set. Allowed values: `soft` or `hard`                               | `""`            |
| `client.podAntiAffinityPreset`                           | Pod anti-affinity preset. Ignored if `client.affinity` is set. Allowed values: `soft` or `hard`                          | `soft`          |
| `client.nodeAffinityPreset.type`                         | Node affinity preset type. Ignored if `client.affinity` is set. Allowed values: `soft` or `hard`                         | `""`            |
| `client.nodeAffinityPreset.key`                          | Node label key to match. Ignored if `client.affinity` is set                                                             | `""`            |
| `client.nodeAffinityPreset.values`                       | Node label values to match. Ignored if `client.affinity` is set                                                          | `[]`            |
| `client.affinity`                                        | Affinity for Appsmith client pods assignment                                                                             | `{}`            |
| `client.nodeSelector`                                    | Node labels for Appsmith client pods assignment                                                                          | `{}`            |
| `client.tolerations`                                     | Tolerations for Appsmith client pods assignment                                                                          | `[]`            |
| `client.updateStrategy.type`                             | Appsmith client statefulset strategy type                                                                                | `RollingUpdate` |
| `client.priorityClassName`                               | Appsmith client pods' priorityClassName                                                                                  | `""`            |
| `client.topologySpreadConstraints`                       | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template | `[]`            |
| `client.schedulerName`                                   | Name of the k8s scheduler (other than default) for Appsmith client pods                                                  | `""`            |
| `client.terminationGracePeriodSeconds`                   | Seconds Redmine pod needs to terminate gracefully                                                                        | `""`            |
| `client.lifecycleHooks`                                  | for the Appsmith client container(s) to automate configuration before or after startup                                   | `{}`            |
| `client.extraEnvVars`                                    | Array with extra environment variables to add to Appsmith client nodes                                                   | `[]`            |
| `client.extraEnvVarsCM`                                  | Name of existing ConfigMap containing extra env vars for Appsmith client nodes                                           | `""`            |
| `client.extraEnvVarsSecret`                              | Name of existing Secret containing extra env vars for Appsmith client nodes                                              | `""`            |
| `client.extraVolumes`                                    | Optionally specify extra list of additional volumes for the Appsmith client pod(s)                                       | `[]`            |
| `client.extraVolumeMounts`                               | Optionally specify extra list of additional volumeMounts for the Appsmith client container(s)                            | `[]`            |
| `client.sidecars`                                        | Add additional sidecar containers to the Appsmith client pod(s)                                                          | `[]`            |
| `client.initContainers`                                  | Add additional init containers to the Appsmith client pod(s)                                                             | `[]`            |

### Appsmith Client Traffic Exposure Parameters

| Name                                      | Description                                                                                                                      | Value                    |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `client.service.type`                     | Appsmith client service type                                                                                                     | `LoadBalancer`           |
| `client.service.ports.http`               | Appsmith client service HTTP port                                                                                                | `80`                     |
| `client.service.nodePorts.http`           | Node port for HTTP                                                                                                               | `""`                     |
| `client.service.clusterIP`                | Appsmith client service Cluster IP                                                                                               | `""`                     |
| `client.service.loadBalancerIP`           | Appsmith client service Load Balancer IP                                                                                         | `""`                     |
| `client.service.loadBalancerSourceRanges` | Appsmith client service Load Balancer sources                                                                                    | `[]`                     |
| `client.service.externalTrafficPolicy`    | Appsmith client service external traffic policy                                                                                  | `Cluster`                |
| `client.service.annotations`              | Additional custom annotations for Appsmith client service                                                                        | `{}`                     |
| `client.service.extraPorts`               | Extra ports to expose in Appsmith client service (normally used with the `sidecars` value)                                       | `[]`                     |
| `client.service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin                                                                 | `None`                   |
| `client.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                     |
| `client.ingress.enabled`                  | Enable ingress record generation for Appsmith                                                                                    | `false`                  |
| `client.ingress.pathType`                 | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `client.ingress.apiVersion`               | Force Ingress API version (automatically detected if not set)                                                                    | `""`                     |
| `client.ingress.hostname`                 | Default host for the ingress record                                                                                              | `appsmith.local`         |
| `client.ingress.ingressClassName`         | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                     |
| `client.ingress.path`                     | Default path for the ingress record                                                                                              | `/`                      |
| `client.ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `client.ingress.tls`                      | Enable TLS configuration for the host defined at `client.ingress.hostname` parameter                                             | `false`                  |
| `client.ingress.selfSigned`               | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                  |
| `client.ingress.extraHosts`               | An array with additional hostname(s) to be covered with the ingress record                                                       | `[]`                     |
| `client.ingress.extraPaths`               | An array with additional arbitrary paths that may need to be added to the ingress under the main host                            | `[]`                     |
| `client.ingress.extraTls`                 | TLS configuration for additional hostname(s) to be covered with this ingress record                                              | `[]`                     |
| `client.ingress.secrets`                  | Custom TLS certificates as secrets                                                                                               | `[]`                     |
| `client.ingress.extraRules`               | Additional rules to be covered with this ingress record                                                                          | `[]`                     |

### Appsmith Backend Parameters

| Name                                                      | Description                                                                                                              | Value                 |
| --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | --------------------- |
| `backend.replicaCount`                                    | Number of Appsmith backend replicas to deploy                                                                            | `1`                   |
| `backend.adminUser`                                       | Appsmith admin user                                                                                                      | `user`                |
| `backend.adminEmail`                                      | Appsmith admin email                                                                                                     | `user@example.com`    |
| `backend.adminPassword`                                   | Appsmith admin password                                                                                                  | `""`                  |
| `backend.encryptionSalt`                                  | Appsmith database encryption salt                                                                                        | `""`                  |
| `backend.encryptionPassword`                              | Appsmith database encryption password                                                                                    | `""`                  |
| `backend.existingSecret`                                  | Name of a secret containing the admin password, encryption salt and encryption password                                  | `""`                  |
| `backend.existingSecretPasswordKey`                       | Key inside the existing secret containing the admin password                                                             | `admin-password`      |
| `backend.existingSecretEncryptionSaltKey`                 | Key inside the existing secret containing the encryption salt                                                            | `encryption-salt`     |
| `backend.existingSecretEncryptionPasswordKey`             | Key inside the existing secret containing the encryption password                                                        | `encryption-password` |
| `backend.containerPorts.http`                             | Appsmith backend HTTP container port                                                                                     | `8080`                |
| `backend.livenessProbe.enabled`                           | Enable livenessProbe on Appsmith backend containers                                                                      | `true`                |
| `backend.livenessProbe.initialDelaySeconds`               | Initial delay seconds for livenessProbe                                                                                  | `30`                  |
| `backend.livenessProbe.periodSeconds`                     | Period seconds for livenessProbe                                                                                         | `10`                  |
| `backend.livenessProbe.timeoutSeconds`                    | Timeout seconds for livenessProbe                                                                                        | `5`                   |
| `backend.livenessProbe.failureThreshold`                  | Failure threshold for livenessProbe                                                                                      | `6`                   |
| `backend.livenessProbe.successThreshold`                  | Success threshold for livenessProbe                                                                                      | `1`                   |
| `backend.readinessProbe.enabled`                          | Enable readinessProbe on Appsmith backend containers                                                                     | `true`                |
| `backend.readinessProbe.initialDelaySeconds`              | Initial delay seconds for readinessProbe                                                                                 | `30`                  |
| `backend.readinessProbe.periodSeconds`                    | Period seconds for readinessProbe                                                                                        | `10`                  |
| `backend.readinessProbe.timeoutSeconds`                   | Timeout seconds for readinessProbe                                                                                       | `5`                   |
| `backend.readinessProbe.failureThreshold`                 | Failure threshold for readinessProbe                                                                                     | `6`                   |
| `backend.readinessProbe.successThreshold`                 | Success threshold for readinessProbe                                                                                     | `1`                   |
| `backend.startupProbe.enabled`                            | Enable startupProbe on Appsmith backend containers                                                                       | `false`               |
| `backend.startupProbe.initialDelaySeconds`                | Initial delay seconds for startupProbe                                                                                   | `30`                  |
| `backend.startupProbe.periodSeconds`                      | Period seconds for startupProbe                                                                                          | `10`                  |
| `backend.startupProbe.timeoutSeconds`                     | Timeout seconds for startupProbe                                                                                         | `5`                   |
| `backend.startupProbe.failureThreshold`                   | Failure threshold for startupProbe                                                                                       | `6`                   |
| `backend.startupProbe.successThreshold`                   | Success threshold for startupProbe                                                                                       | `1`                   |
| `backend.customLivenessProbe`                             | Custom livenessProbe that overrides the default one                                                                      | `{}`                  |
| `backend.customReadinessProbe`                            | Custom readinessProbe that overrides the default one                                                                     | `{}`                  |
| `backend.customStartupProbe`                              | Custom startupProbe that overrides the default one                                                                       | `{}`                  |
| `backend.resources.limits`                                | The resources limits for the Appsmith backend containers                                                                 | `{}`                  |
| `backend.resources.requests`                              | The requested resources for the Appsmith backend containers                                                              | `{}`                  |
| `backend.podSecurityContext.enabled`                      | Enabled Appsmith backend pods' Security Context                                                                          | `true`                |
| `backend.podSecurityContext.fsGroup`                      | Set Appsmith backend pod's Security Context fsGroup                                                                      | `1001`                |
| `backend.containerSecurityContext.enabled`                | Enabled Appsmith backend containers' Security Context                                                                    | `true`                |
| `backend.containerSecurityContext.runAsUser`              | Set Appsmith backend containers' Security Context runAsUser                                                              | `1001`                |
| `backend.containerSecurityContext.runAsNonRoot`           | Set Appsmith backend containers' Security Context runAsNonRoot                                                           | `true`                |
| `backend.containerSecurityContext.readOnlyRootFilesystem` | Set Appsmith backend containers' Security Context runAsNonRoot                                                           | `false`               |
| `backend.command`                                         | Override default container command (useful when using custom images)                                                     | `[]`                  |
| `backend.args`                                            | Override default container args (useful when using custom images)                                                        | `[]`                  |
| `backend.hostAliases`                                     | Appsmith backend pods host aliases                                                                                       | `[]`                  |
| `backend.podLabels`                                       | Extra labels for Appsmith backend pods                                                                                   | `{}`                  |
| `backend.podAnnotations`                                  | Annotations for Appsmith backend pods                                                                                    | `{}`                  |
| `backend.podAffinityPreset`                               | Pod affinity preset. Ignored if `backend.affinity` is set. Allowed values: `soft` or `hard`                              | `""`                  |
| `backend.podAntiAffinityPreset`                           | Pod anti-affinity preset. Ignored if `backend.affinity` is set. Allowed values: `soft` or `hard`                         | `soft`                |
| `backend.nodeAffinityPreset.type`                         | Node affinity preset type. Ignored if `backend.affinity` is set. Allowed values: `soft` or `hard`                        | `""`                  |
| `backend.nodeAffinityPreset.key`                          | Node label key to match. Ignored if `backend.affinity` is set                                                            | `""`                  |
| `backend.nodeAffinityPreset.values`                       | Node label values to match. Ignored if `backend.affinity` is set                                                         | `[]`                  |
| `backend.affinity`                                        | Affinity for Appsmith backend pods assignment                                                                            | `{}`                  |
| `backend.nodeSelector`                                    | Node labels for Appsmith backend pods assignment                                                                         | `{}`                  |
| `backend.tolerations`                                     | Tolerations for Appsmith backend pods assignment                                                                         | `[]`                  |
| `backend.updateStrategy.type`                             | Appsmith backend statefulset strategy type                                                                               | `RollingUpdate`       |
| `backend.priorityClassName`                               | Appsmith backend pods' priorityClassName                                                                                 | `""`                  |
| `backend.topologySpreadConstraints`                       | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template | `[]`                  |
| `backend.schedulerName`                                   | Name of the k8s scheduler (other than default) for Appsmith backend pods                                                 | `""`                  |
| `backend.terminationGracePeriodSeconds`                   | Seconds Redmine pod needs to terminate gracefully                                                                        | `""`                  |
| `backend.lifecycleHooks`                                  | for the Appsmith backend container(s) to automate configuration before or after startup                                  | `{}`                  |
| `backend.extraEnvVars`                                    | Array with extra environment variables to add to Appsmith backend nodes                                                  | `[]`                  |
| `backend.extraEnvVarsCM`                                  | Name of existing ConfigMap containing extra env vars for Appsmith backend nodes                                          | `""`                  |
| `backend.extraEnvVarsSecret`                              | Name of existing Secret containing extra env vars for Appsmith backend nodes                                             | `""`                  |
| `backend.extraVolumes`                                    | Optionally specify extra list of additional volumes for the Appsmith backend pod(s)                                      | `[]`                  |
| `backend.extraVolumeMounts`                               | Optionally specify extra list of additional volumeMounts for the Appsmith backend container(s)                           | `[]`                  |
| `backend.sidecars`                                        | Add additional sidecar containers to the Appsmith backend pod(s)                                                         | `[]`                  |
| `backend.initContainers`                                  | Add additional init containers to the Appsmith backend pod(s)                                                            | `[]`                  |

### Appsmith Backend Traffic Exposure Parameters

| Name                                       | Description                                                                                 | Value       |
| ------------------------------------------ | ------------------------------------------------------------------------------------------- | ----------- |
| `backend.service.type`                     | Appsmith backend service type                                                               | `ClusterIP` |
| `backend.service.ports.http`               | Appsmith backend service HTTP port                                                          | `80`        |
| `backend.service.nodePorts.http`           | Node port for HTTP                                                                          | `""`        |
| `backend.service.clusterIP`                | Appsmith backend service Cluster IP                                                         | `""`        |
| `backend.service.loadBalancerIP`           | Appsmith backend service Load Balancer IP                                                   | `""`        |
| `backend.service.loadBalancerSourceRanges` | Appsmith backend service Load Balancer sources                                              | `[]`        |
| `backend.service.externalTrafficPolicy`    | Appsmith backend service external traffic policy                                            | `Cluster`   |
| `backend.service.annotations`              | Additional custom annotations for Appsmith backend service                                  | `{}`        |
| `backend.service.extraPorts`               | Extra ports to expose in Appsmith backend service (normally used with the `sidecars` value) | `[]`        |
| `backend.service.sessionAffinity`          | Control where backend requests go, to the same pod or round-robin                           | `None`      |
| `backend.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                 | `{}`        |

### Backend Persistence Parameters

| Name                                | Description                                                                                             | Value               |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------------- |
| `backend.persistence.enabled`       | Enable persistence using Persistent Volume Claims                                                       | `true`              |
| `backend.persistence.mountPath`     | Path to mount the volume at.                                                                            | `/bitnami/appsmith` |
| `backend.persistence.subPath`       | The subdirectory of the volume to mount to, useful in dev environments and one PV for multiple services | `""`                |
| `backend.persistence.storageClass`  | Storage class of backing PVC                                                                            | `""`                |
| `backend.persistence.annotations`   | Persistent Volume Claim annotations                                                                     | `{}`                |
| `backend.persistence.accessModes`   | Persistent Volume Access Modes                                                                          | `["ReadWriteOnce"]` |
| `backend.persistence.size`          | Size of data volume                                                                                     | `8Gi`               |
| `backend.persistence.existingClaim` | The name of an existing PVC to use for persistence                                                      | `""`                |
| `backend.persistence.selector`      | Selector to match an existing Persistent Volume for WordPress data PVC                                  | `{}`                |
| `backend.persistence.dataSource`    | Custom PVC data source                                                                                  | `{}`                |

### Appsmith RTS Parameters

| Name                                                  | Description                                                                                                              | Value           |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | --------------- |
| `rts.replicaCount`                                    | Number of Appsmith rts replicas to deploy                                                                                | `1`             |
| `rts.containerPorts.http`                             | Appsmith rts HTTP container port                                                                                         | `8080`          |
| `rts.livenessProbe.enabled`                           | Enable livenessProbe on Appsmith rts containers                                                                          | `true`          |
| `rts.livenessProbe.initialDelaySeconds`               | Initial delay seconds for livenessProbe                                                                                  | `30`            |
| `rts.livenessProbe.periodSeconds`                     | Period seconds for livenessProbe                                                                                         | `10`            |
| `rts.livenessProbe.timeoutSeconds`                    | Timeout seconds for livenessProbe                                                                                        | `5`             |
| `rts.livenessProbe.failureThreshold`                  | Failure threshold for livenessProbe                                                                                      | `6`             |
| `rts.livenessProbe.successThreshold`                  | Success threshold for livenessProbe                                                                                      | `1`             |
| `rts.readinessProbe.enabled`                          | Enable readinessProbe on Appsmith rts containers                                                                         | `true`          |
| `rts.readinessProbe.initialDelaySeconds`              | Initial delay seconds for readinessProbe                                                                                 | `30`            |
| `rts.readinessProbe.periodSeconds`                    | Period seconds for readinessProbe                                                                                        | `10`            |
| `rts.readinessProbe.timeoutSeconds`                   | Timeout seconds for readinessProbe                                                                                       | `5`             |
| `rts.readinessProbe.failureThreshold`                 | Failure threshold for readinessProbe                                                                                     | `6`             |
| `rts.readinessProbe.successThreshold`                 | Success threshold for readinessProbe                                                                                     | `1`             |
| `rts.startupProbe.enabled`                            | Enable startupProbe on Appsmith rts containers                                                                           | `false`         |
| `rts.startupProbe.initialDelaySeconds`                | Initial delay seconds for startupProbe                                                                                   | `30`            |
| `rts.startupProbe.periodSeconds`                      | Period seconds for startupProbe                                                                                          | `10`            |
| `rts.startupProbe.timeoutSeconds`                     | Timeout seconds for startupProbe                                                                                         | `5`             |
| `rts.startupProbe.failureThreshold`                   | Failure threshold for startupProbe                                                                                       | `6`             |
| `rts.startupProbe.successThreshold`                   | Success threshold for startupProbe                                                                                       | `1`             |
| `rts.customLivenessProbe`                             | Custom livenessProbe that overrides the default one                                                                      | `{}`            |
| `rts.customReadinessProbe`                            | Custom readinessProbe that overrides the default one                                                                     | `{}`            |
| `rts.customStartupProbe`                              | Custom startupProbe that overrides the default one                                                                       | `{}`            |
| `rts.resources.limits`                                | The resources limits for the Appsmith rts containers                                                                     | `{}`            |
| `rts.resources.requests`                              | The requested resources for the Appsmith rts containers                                                                  | `{}`            |
| `rts.podSecurityContext.enabled`                      | Enabled Appsmith rts pods' Security Context                                                                              | `true`          |
| `rts.podSecurityContext.fsGroup`                      | Set Appsmith rts pod's Security Context fsGroup                                                                          | `1001`          |
| `rts.containerSecurityContext.enabled`                | Enabled Appsmith rts containers' Security Context                                                                        | `true`          |
| `rts.containerSecurityContext.runAsUser`              | Set Appsmith rts containers' Security Context runAsUser                                                                  | `1001`          |
| `rts.containerSecurityContext.runAsNonRoot`           | Set Appsmith rts containers' Security Context runAsNonRoot                                                               | `true`          |
| `rts.containerSecurityContext.readOnlyRootFilesystem` | Set Appsmith rts containers' Security Context runAsNonRoot                                                               | `false`         |
| `rts.command`                                         | Override default container command (useful when using custom images)                                                     | `[]`            |
| `rts.args`                                            | Override default container args (useful when using custom images)                                                        | `[]`            |
| `rts.hostAliases`                                     | Appsmith rts pods host aliases                                                                                           | `[]`            |
| `rts.podLabels`                                       | Extra labels for Appsmith rts pods                                                                                       | `{}`            |
| `rts.podAnnotations`                                  | Annotations for Appsmith rts pods                                                                                        | `{}`            |
| `rts.podAffinityPreset`                               | Pod affinity preset. Ignored if `rts.affinity` is set. Allowed values: `soft` or `hard`                                  | `""`            |
| `rts.podAntiAffinityPreset`                           | Pod anti-affinity preset. Ignored if `rts.affinity` is set. Allowed values: `soft` or `hard`                             | `soft`          |
| `rts.nodeAffinityPreset.type`                         | Node affinity preset type. Ignored if `rts.affinity` is set. Allowed values: `soft` or `hard`                            | `""`            |
| `rts.nodeAffinityPreset.key`                          | Node label key to match. Ignored if `rts.affinity` is set                                                                | `""`            |
| `rts.nodeAffinityPreset.values`                       | Node label values to match. Ignored if `rts.affinity` is set                                                             | `[]`            |
| `rts.affinity`                                        | Affinity for Appsmith rts pods assignment                                                                                | `{}`            |
| `rts.nodeSelector`                                    | Node labels for Appsmith rts pods assignment                                                                             | `{}`            |
| `rts.tolerations`                                     | Tolerations for Appsmith rts pods assignment                                                                             | `[]`            |
| `rts.updateStrategy.type`                             | Appsmith rts statefulset strategy type                                                                                   | `RollingUpdate` |
| `rts.priorityClassName`                               | Appsmith rts pods' priorityClassName                                                                                     | `""`            |
| `rts.topologySpreadConstraints`                       | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template | `[]`            |
| `rts.schedulerName`                                   | Name of the k8s scheduler (other than default) for Appsmith rts pods                                                     | `""`            |
| `rts.terminationGracePeriodSeconds`                   | Seconds Redmine pod needs to terminate gracefully                                                                        | `""`            |
| `rts.lifecycleHooks`                                  | for the Appsmith rts container(s) to automate configuration before or after startup                                      | `{}`            |
| `rts.extraEnvVars`                                    | Array with extra environment variables to add to Appsmith rts nodes                                                      | `[]`            |
| `rts.extraEnvVarsCM`                                  | Name of existing ConfigMap containing extra env vars for Appsmith rts nodes                                              | `""`            |
| `rts.extraEnvVarsSecret`                              | Name of existing Secret containing extra env vars for Appsmith rts nodes                                                 | `""`            |
| `rts.extraVolumes`                                    | Optionally specify extra list of additional volumes for the Appsmith rts pod(s)                                          | `[]`            |
| `rts.extraVolumeMounts`                               | Optionally specify extra list of additional volumeMounts for the Appsmith rts container(s)                               | `[]`            |
| `rts.sidecars`                                        | Add additional sidecar containers to the Appsmith rts pod(s)                                                             | `[]`            |
| `rts.initContainers`                                  | Add additional init containers to the Appsmith rts pod(s)                                                                | `[]`            |

### Appsmith RTS Traffic Exposure Parameters

| Name                                   | Description                                                                             | Value       |
| -------------------------------------- | --------------------------------------------------------------------------------------- | ----------- |
| `rts.service.type`                     | Appsmith rts service type                                                               | `ClusterIP` |
| `rts.service.ports.http`               | Appsmith rts service HTTP port                                                          | `80`        |
| `rts.service.nodePorts.http`           | Node port for HTTP                                                                      | `""`        |
| `rts.service.clusterIP`                | Appsmith rts service Cluster IP                                                         | `""`        |
| `rts.service.loadBalancerIP`           | Appsmith rts service Load Balancer IP                                                   | `""`        |
| `rts.service.loadBalancerSourceRanges` | Appsmith rts service Load Balancer sources                                              | `[]`        |
| `rts.service.externalTrafficPolicy`    | Appsmith rts service external traffic policy                                            | `Cluster`   |
| `rts.service.annotations`              | Additional custom annotations for Appsmith rts service                                  | `{}`        |
| `rts.service.extraPorts`               | Extra ports to expose in Appsmith rts service (normally used with the `sidecars` value) | `[]`        |
| `rts.service.sessionAffinity`          | Control where rts requests go, to the same pod or round-robin                           | `None`      |
| `rts.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                             | `{}`        |

### Init Container Parameters

| Name                                                   | Description                                                                                     | Value                   |
| ------------------------------------------------------ | ----------------------------------------------------------------------------------------------- | ----------------------- |
| `volumePermissions.enabled`                            | Enable init container that changes the owner/group of the PV mount point to `runAsUser:fsGroup` | `false`                 |
| `volumePermissions.image.registry`                     | Bitnami Shell image registry                                                                    | `docker.io`             |
| `volumePermissions.image.repository`                   | Bitnami Shell image repository                                                                  | `bitnami/bitnami-shell` |
| `volumePermissions.image.tag`                          | Bitnami Shell image tag (immutable tags are recommended)                                        | `11-debian-11-r119`     |
| `volumePermissions.image.pullPolicy`                   | Bitnami Shell image pull policy                                                                 | `IfNotPresent`          |
| `volumePermissions.image.pullSecrets`                  | Bitnami Shell image pull secrets                                                                | `[]`                    |
| `volumePermissions.resources.limits`                   | The resources limits for the init container                                                     | `{}`                    |
| `volumePermissions.resources.requests`                 | The requested resources for the init container                                                  | `{}`                    |
| `volumePermissions.containerSecurityContext.runAsUser` | Set init container's Security Context runAsUser                                                 | `0`                     |

### Other Parameters

| Name                                          | Description                                                      | Value  |
| --------------------------------------------- | ---------------------------------------------------------------- | ------ |
| `serviceAccount.create`                       | Specifies whether a ServiceAccount should be created             | `true` |
| `serviceAccount.name`                         | The name of the ServiceAccount to use.                           | `""`   |
| `serviceAccount.annotations`                  | Additional Service Account annotations (evaluated as a template) | `{}`   |
| `serviceAccount.automountServiceAccountToken` | Automount service account token for the server service account   | `true` |

### External MongoDB parameters

| Name                                         | Description                                                             | Value      |
| -------------------------------------------- | ----------------------------------------------------------------------- | ---------- |
| `externalDatabase.hosts`                     | Database hosts                                                          | `[]`       |
| `externalDatabase.port`                      | Database port number                                                    | `27017`    |
| `externalDatabase.username`                  | Non-root username for Appsmith                                          | `root`     |
| `externalDatabase.password`                  | Password for the non-root username for Appsmith                         | `""`       |
| `externalDatabase.database`                  | Appsmith database name                                                  | `appsmith` |
| `externalDatabase.existingSecret`            | Name of an existing secret resource containing the database credentials | `""`       |
| `externalDatabase.existingSecretPasswordKey` | Name of an existing secret key containing the database credentials      | `""`       |

### External Redis parameters

| Name                                      | Description                                                          | Value  |
| ----------------------------------------- | -------------------------------------------------------------------- | ------ |
| `externalRedis.host`                      | Redis host                                                           | `""`   |
| `externalRedis.port`                      | Redis port number                                                    | `6379` |
| `externalRedis.password`                  | Password for the Redis                                               | `""`   |
| `externalRedis.existingSecret`            | Name of an existing secret resource containing the Redis credentials | `""`   |
| `externalRedis.existingSecretPasswordKey` | Name of an existing secret key containing the Redis credentials      | `""`   |

### Redis sub-chart parameters

| Name                               | Description                                    | Value        |
| ---------------------------------- | ---------------------------------------------- | ------------ |
| `redis.enabled`                    | Deploy Redis subchart                          | `true`       |
| `redis.architecture`               | Set Redis architecture                         | `standalone` |
| `redis.existingSecret`             | Name of a secret containing redis credentials  | `""`         |
| `redis.master.service.ports.redis` | Redis port                                     | `6379`       |
| `redis.auth.enabled`               | Enable Redis auth                              | `true`       |
| `redis.auth.password`              | Redis password                                 | `""`         |
| `redis.auth.existingSecret`        | Name of a secret containing the Redis password | `""`         |

### MongoDB sub-chart parameters

| Name                             | Description                                            | Value        |
| -------------------------------- | ------------------------------------------------------ | ------------ |
| `mongodb.enabled`                | Deploy MongoDB subchart                                | `true`       |
| `mongodb.architecture`           | MongoDB architecture (Appsmith requires a Replica Set) | `replicaset` |
| `mongodb.replicaCount`           | MongoDB number of replicas                             | `2`          |
| `mongodb.auth.usernames`         | MongoDB non-root username creation                     | `[]`         |
| `mongodb.auth.databases`         | MongoDB database creation                              | `[]`         |
| `mongodb.containerPorts.mongodb` | MongoDB container port (used by the headless service)  | `27017`      |
| `mongodb.arbiter.enabled`        | Enable Arbiter nodes in the ReplicaSet                 | `false`      |

The above parameters map to the env variables defined in [bitnami/appsmith](https://github.com/bitnami/containers/tree/main/bitnami/appsmith). For more information please refer to the [bitnami/appsmith](https://github.com/bitnami/containers/tree/main/bitnami/appsmith) image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set appsmithUsername=admin \
  --set appsmithPassword=password \
  --set mariadb.auth.rootPassword=secretpassword \
    oci://registry-1.docker.io/bitnamicharts/appsmith
```

The above command sets the appsmith administrator account username and password to `admin` and `password` respectively. Additionally, it sets the MariaDB `root` user password to `secretpassword`.

> NOTE: Once this chart is deployed, it is not possible to change the application's access credentials, such as usernames or passwords, using Helm. To change these application credentials after deployment, delete any persistent volumes (PVs) used by the chart and re-deploy it, or use the application's built-in administrative tools if available.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/appsmith
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### External database support

You may want to have appsmith connect to an external database rather than installing one inside your cluster. Typical reasons for this are to use a managed database service, or to share a common database server for all your applications. To achieve this, the chart allows you to specify credentials for an external database with the [`externalDatabase` parameter](#parameters). You should also disable the MongoDB installation with the `mongodb.enabled` option. Here is an example:

```console
mongodb.enabled=false
externalDatabase.host=myexternalhost
externalDatabase.user=myuser
externalDatabase.password=mypassword
externalDatabase.database=mydatabase
externalDatabase.port=3306
```

### External redis support

You may want to have appsmith connect to an external redis rather than installing one inside your cluster. Typical reasons for this are to use a managed redis service, or to share a common redis server for all your applications. To achieve this, the chart allows you to specify credentials for an external redis with the [`externalDatabase` parameter](#parameters). You should also disable the Redis installation with the `redis.enabled` option. Here is an example:

```console
redis.enabled=false
externalDatabase.host=myexternalhost
externalDatabase.user=myuser
externalDatabase.password=mypassword
externalDatabase.redis=myredis
externalDatabase.port=3306
```

### Ingress

This chart provides support for Ingress resources. If you have an ingress controller installed on your cluster, such as [nginx-ingress-controller](https://github.com/bitnami/charts/tree/main/bitnami/nginx-ingress-controller) or [contour](https://github.com/bitnami/charts/tree/main/bitnami/contour) you can utilize the ingress controller to serve your application.

To enable Ingress integration, set `client.ingress.enabled` to `true`. The `client.ingress.hostname` property can be used to set the host name. The `client.ingress.tls` parameter can be used to add the TLS configuration for this host. It is also possible to have more than one host, with a separate TLS configuration for each host. [Learn more about configuring and using Ingress](https://docs.bitnami.com/kubernetes/apps/appsmith/configuration/configure-ingress/).

### TLS secrets

The chart also facilitates the creation of TLS secrets for use with the Ingress controller, with different options for certificate management. [Learn more about TLS secrets](https://docs.bitnami.com/kubernetes/apps/appsmith/administration/enable-tls-ingress/).

## Persistence

The [Bitnami appsmith](https://github.com/bitnami/containers/tree/main/bitnami/appsmith) image stores the appsmith data and configurations at the `/bitnami` path of the container. Persistent Volume Claims are used to keep the data across deployments. This is known to work in GCE, AWS, and minikube.

### Additional environment variables

In case you want to add extra environment variables (useful for advanced operations like custom init scripts), you can use the `extraEnvVars` property inside the `client`, `backend` and `rts` sections.

```yaml
appsmith:
  backend:
    extraEnvVars:
      - name: LOG_LEVEL
        value: error
```

Alternatively, you can use a ConfigMap or a Secret with the environment variables. To do so, use the `extraEnvVarsCM` or the `extraEnvVarsSecret` values inside the `client`, `backend` and `rts` sections.

### Sidecars

If additional containers are needed in the same pod as appsmith (such as additional metrics or logging exporters), they can be defined using the `sidecars` parameter inside the `client`, `backend` and `rts` sections. If these sidecars export extra ports, extra port definitions can be added using the `service.extraPorts` parameter. [Learn more about configuring and using sidecar containers](https://docs.bitnami.com/kubernetes/apps/appsmith/administration/configure-use-sidecars/).

### Pod affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, use one of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters inside the `client`, `backend` and `rts` sections.

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