<!--- app-name: Apache Solr -->

# Apache Solr packaged by Bitnami

Apache Solr is an extremely powerful, open source enterprise search platform built on Apache Lucene. It is highly reliable and flexible, scalable, and designed to add value very quickly after launch.

[Overview of Apache Solr](http://lucene.apache.org/solr/)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/solr
```

## Introduction

This chart bootstraps a [Solr](https://github.com/bitnami/containers/tree/main/bitnami/solr) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/solr
```

These commands deploy Solr on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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

| Name                     | Description                                                                                  | Value           |
| ------------------------ | -------------------------------------------------------------------------------------------- | --------------- |
| `kubeVersion`            | Override Kubernetes version                                                                  | `""`            |
| `nameOverride`           | String to partially override common.names.fullname template (will maintain the release name) | `""`            |
| `fullnameOverride`       | String to fully override common.names.fullname template                                      | `""`            |
| `clusterDomain`          | Kubernetes cluster domain                                                                    | `cluster.local` |
| `commonLabels`           | Add labels to all the deployed resources                                                     | `{}`            |
| `commonAnnotations`      | Add annotations to all the deployed resources                                                | `{}`            |
| `extraDeploy`            | Extra objects to deploy (value evaluated as a template)                                      | `[]`            |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden)      | `false`         |
| `diagnosticMode.command` | Command to override all containers in the statefulset                                        | `["sleep"]`     |
| `diagnosticMode.args`    | Args to override all containers in the statefulset                                           | `["infinity"]`  |

### Solr parameters

| Name                             | Description                                                                                          | Value                   |
| -------------------------------- | ---------------------------------------------------------------------------------------------------- | ----------------------- |
| `image.registry`                 | Solr image registry                                                                                  | `docker.io`             |
| `image.repository`               | Solr image repository                                                                                | `bitnami/solr`          |
| `image.tag`                      | Solr image tag (immutable tags are recommended)                                                      | `9.2.1-debian-11-r7`    |
| `image.digest`                   | Solr image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                    |
| `image.pullPolicy`               | image pull policy                                                                                    | `IfNotPresent`          |
| `image.pullSecrets`              | Specify docker-registry secret names as an array                                                     | `[]`                    |
| `image.debug`                    | Specify if debug values should be set                                                                | `false`                 |
| `auth.enabled`                   | Enable Solr authentication                                                                           | `true`                  |
| `auth.adminUsername`             | Solr admin username                                                                                  | `admin`                 |
| `auth.adminPassword`             | Solr admin password. Autogenerated if not provided.                                                  | `""`                    |
| `auth.existingSecret`            | Existing secret with Solr password                                                                   | `""`                    |
| `auth.existingSecretPasswordKey` | Password key to be retrieved from existing secret                                                    | `solr-password`         |
| `coreNames`                      | Solr core names to be created                                                                        | `["my-core"]`           |
| `cloudEnabled`                   | Enable Solr cloud mode                                                                               | `true`                  |
| `cloudBootstrap`                 | Enable cloud bootstrap. It will be performed from the node 0.                                        | `true`                  |
| `collection`                     | Solr collection name                                                                                 | `my-collection`         |
| `collectionShards`               | Number of collection shards                                                                          | `1`                     |
| `collectionReplicas`             | Number of collection replicas                                                                        | `2`                     |
| `serverDirectory`                | Name of the created directory for the server                                                         | `server`                |
| `javaMem`                        | Java memory options to pass to the Solr container                                                    | `""`                    |
| `heap`                           | Java Heap options to pass to the Solr container                                                      | `""`                    |
| `command`                        | Override Solr entrypoint string                                                                      | `["/scripts/setup.sh"]` |
| `args`                           | Arguments for the provided command if needed                                                         | `[]`                    |
| `extraEnvVars`                   | Additional environment variables to set                                                              | `[]`                    |
| `extraEnvVarsCM`                 | ConfigMap with extra environment variables                                                           | `""`                    |
| `extraEnvVarsSecret`             | Secret with extra environment variables                                                              | `""`                    |

### Solr statefulset parameters

| Name                                    | Description                                                                                                              | Value           |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ | --------------- |
| `replicaCount`                          | Number of solr replicas                                                                                                  | `3`             |
| `containerPorts.http`                   | Solr HTTP container port                                                                                                 | `8983`          |
| `livenessProbe.enabled`                 | Enable livenessProbe on Solr containers                                                                                  | `true`          |
| `livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                                  | `40`            |
| `livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                                         | `10`            |
| `livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                                        | `15`            |
| `livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                                      | `6`             |
| `livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                                      | `1`             |
| `readinessProbe.enabled`                | Enable readinessProbe on Solr containers                                                                                 | `true`          |
| `readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                                 | `60`            |
| `readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                                        | `10`            |
| `readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                                       | `15`            |
| `readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                                     | `6`             |
| `readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                                     | `1`             |
| `startupProbe.enabled`                  | Enable startupProbe on Solr containers                                                                                   | `false`         |
| `startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                                   | `40`            |
| `startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                                          | `10`            |
| `startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                                         | `15`            |
| `startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                                       | `15`            |
| `startupProbe.successThreshold`         | Success threshold for startupProbe                                                                                       | `1`             |
| `customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                                      | `{}`            |
| `customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                                     | `{}`            |
| `customStartupProbe`                    | Custom startupProbe that overrides the default one                                                                       | `{}`            |
| `lifecycleHooks`                        | lifecycleHooks for the Solr container to automate configuration before or after startup                                  | `{}`            |
| `resources.limits`                      | The resources limits for the container                                                                                   | `{}`            |
| `resources.requests`                    | The requested resources for the container                                                                                | `{}`            |
| `podSecurityContext.enabled`            | Enable Solr pods' Security Context                                                                                       | `true`          |
| `podSecurityContext.fsGroup`            | Set Solr pod's Security Context fsGroup                                                                                  | `1001`          |
| `containerSecurityContext.enabled`      | Enable Solr containers' Security Context                                                                                 | `true`          |
| `containerSecurityContext.runAsUser`    | Set Solr containers' Security Context runAsUser                                                                          | `1001`          |
| `containerSecurityContext.runAsNonRoot` | Set Solr containers' Security Context runAsNonRoot                                                                       | `true`          |
| `hostAliases`                           | Solr pods host aliases                                                                                                   | `[]`            |
| `podLabels`                             | Extra labels for Solr pods                                                                                               | `{}`            |
| `podAnnotations`                        | Annotations for Solr pods                                                                                                | `{}`            |
| `podAffinityPreset`                     | Solr pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                 | `""`            |
| `podAntiAffinityPreset`                 | Solr pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                            | `soft`          |
| `nodeAffinityPreset.type`               | Solr node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                           | `""`            |
| `nodeAffinityPreset.key`                | Solr node label key to match Ignored if `affinity` is set.                                                               | `""`            |
| `nodeAffinityPreset.values`             | Solr node label values to match. Ignored if `affinity` is set.                                                           | `[]`            |
| `affinity`                              | Affinity settings for Solr pod assignment. Evaluated as a template                                                       | `{}`            |
| `nodeSelector`                          | Node labels for Solr pods assignment. Evaluated as a template                                                            | `{}`            |
| `tolerations`                           | Tolerations for Solr pods assignment. Evaluated as a template                                                            | `[]`            |
| `topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template | `[]`            |
| `podManagementPolicy`                   | Management Policy for Solr StatefulSet                                                                                   | `Parallel`      |
| `priorityClassName`                     | Solr pods' priority.                                                                                                     | `""`            |
| `schedulerName`                         | Kubernetes pod scheduler registry                                                                                        | `""`            |
| `updateStrategy.type`                   | Solr statefulset strategy type                                                                                           | `RollingUpdate` |
| `updateStrategy.rollingUpdate`          | Solr statefulset rolling update configuration parameters                                                                 | `{}`            |
| `pdb.create`                            | Enable a Pod Disruption Budget creation                                                                                  | `false`         |
| `pdb.minAvailable`                      | Minimum number/percentage of pods that should remain scheduled                                                           | `1`             |
| `pdb.maxUnavailable`                    | Maximum number/percentage of pods that may be made unavailable                                                           | `""`            |
| `extraVolumes`                          | Optionally specify extra list of additional volumes for the Solr pod(s)                                                  | `[]`            |
| `extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Solr container(s)                                       | `[]`            |
| `initContainers`                        | Add init containers to the Solr pod(s)                                                                                   | `[]`            |
| `sidecars`                              | Add sidecars to the Solr pod(s)                                                                                          | `[]`            |

### Traffic Exposure parameters

| Name                               | Description                                                                                                                      | Value                    |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `service.type`                     | Kubernetes Service type                                                                                                          | `ClusterIP`              |
| `service.ports.http`               | Solr HTTP service port                                                                                                           | `8983`                   |
| `service.nodePorts.http`           | Node port for the HTTP service                                                                                                   | `""`                     |
| `service.sessionAffinity`          | Control where client requests go, to the same pod or round-robin                                                                 | `None`                   |
| `service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                     |
| `service.clusterIP`                | Solr service Cluster IP                                                                                                          | `""`                     |
| `service.loadBalancerIP`           | Solr service Load Balancer IP                                                                                                    | `""`                     |
| `service.loadBalancerSourceRanges` | Solr service Load Balancer sources                                                                                               | `[]`                     |
| `service.externalTrafficPolicy`    | Solr service external traffic policy                                                                                             | `Cluster`                |
| `service.annotations`              | Additional custom annotations for Solr service                                                                                   | `{}`                     |
| `service.extraPorts`               | Extra ports to expose in the Solr service (normally used with the `sidecar` value)                                               | `[]`                     |
| `service.headless.annotations`     | Annotations for the headless service.                                                                                            | `{}`                     |
| `ingress.enabled`                  | Enable ingress record generation for Apache Geode                                                                                | `false`                  |
| `ingress.ingressClassName`         | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                     |
| `ingress.pathType`                 | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `ingress.apiVersion`               | Force Ingress API version (automatically detected if not set)                                                                    | `""`                     |
| `ingress.hostname`                 | Default host for the ingress record                                                                                              | `solr.local`             |
| `ingress.path`                     | Default path for the ingress record                                                                                              | `/`                      |
| `ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `ingress.tls`                      | Enable TLS configuration for the host defined at `ingress.hostname` parameter                                                    | `false`                  |
| `ingress.selfSigned`               | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                  |
| `ingress.extraHosts`               | An array with additional hostname(s) to be covered with the ingress record                                                       | `[]`                     |
| `ingress.extraPaths`               | Any additional arbitrary paths that may need to be added to the ingress under the main host.                                     | `[]`                     |
| `ingress.extraTls`                 | The tls configuration for additional hostnames to be covered with this ingress record.                                           | `[]`                     |
| `ingress.secrets`                  | If you're providing your own certificates, please use this to add the certificates as secrets                                    | `[]`                     |
| `ingress.extraRules`               | Additional rules to be covered with this ingress record                                                                          | `[]`                     |

### Persistence parameters

| Name                        | Description                                                            | Value               |
| --------------------------- | ---------------------------------------------------------------------- | ------------------- |
| `persistence.enabled`       | Use a PVC to persist data.                                             | `true`              |
| `persistence.existingClaim` | A manually managed Persistent Volume and Claim                         | `""`                |
| `persistence.storageClass`  | Storage class of backing PVC                                           | `""`                |
| `persistence.accessModes`   | Persistent Volume Access Modes                                         | `["ReadWriteOnce"]` |
| `persistence.size`          | Size of data volume                                                    | `8Gi`               |
| `persistence.annotations`   | Persistence annotations for Solr                                       | `{}`                |
| `persistence.mountPath`     | Persistence mount path for Solr                                        | `/bitnami/solr`     |
| `persistence.subPath`       | Path within the volume from which the container's                      | `""`                |
| `persistence.subPathExpr`   | Expanded path within the volume from which                             | `""`                |
| `persistence.selector`      | Selector to match an existing Persistent Volume for WordPress data PVC | `{}`                |

### Volume Permissions parameters

| Name                                                   | Description                                                                                                                       | Value                   |
| ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------- | ----------------------- |
| `volumePermissions.enabled`                            | Enable init container that changes the owner and group of the persistent volume                                                   | `false`                 |
| `volumePermissions.image.registry`                     | Init container volume-permissions image registry                                                                                  | `docker.io`             |
| `volumePermissions.image.repository`                   | Init container volume-permissions image repository                                                                                | `bitnami/bitnami-shell` |
| `volumePermissions.image.tag`                          | Init container volume-permissions image tag (immutable tags are recommended)                                                      | `11-debian-11-r118`     |
| `volumePermissions.image.digest`                       | Init container volume-permissions image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                    |
| `volumePermissions.image.pullPolicy`                   | Init container volume-permissions image pull policy                                                                               | `IfNotPresent`          |
| `volumePermissions.image.pullSecrets`                  | Init container volume-permissions image pull secrets                                                                              | `[]`                    |
| `volumePermissions.resources.limits`                   | Init container volume-permissions resource limits                                                                                 | `{}`                    |
| `volumePermissions.resources.requests`                 | Init container volume-permissions resource requests                                                                               | `{}`                    |
| `volumePermissions.containerSecurityContext.runAsUser` | User ID for the init container                                                                                                    | `0`                     |

### Other Parameters

| Name                                          | Description                                                            | Value   |
| --------------------------------------------- | ---------------------------------------------------------------------- | ------- |
| `serviceAccount.create`                       | Enable creation of ServiceAccount for Solr pod                         | `false` |
| `serviceAccount.name`                         | The name of the ServiceAccount to use.                                 | `""`    |
| `serviceAccount.automountServiceAccountToken` | Allows auto mount of ServiceAccountToken on the serviceAccount created | `true`  |
| `serviceAccount.annotations`                  | Additional custom annotations for the ServiceAccount                   | `{}`    |

### Solr TLS parameters

| Name                         | Description                                                                      | Value   |
| ---------------------------- | -------------------------------------------------------------------------------- | ------- |
| `tls.enabled`                | Enable the TLS/SSL configuration                                                 | `false` |
| `tls.autoGenerated`          | Create self-signed TLS certificates. Currently only supports PEM certificates    | `false` |
| `tls.certificatesSecretName` | Name of the secret that contains the certificates                                | `""`    |
| `tls.passwordsSecretName`    | Set the name of the secret that contains the passwords for the certificate files | `""`    |
| `tls.keystorePassword`       | Password to access the keystore when it's password-protected                     | `""`    |
| `tls.truststorePassword`     | Password to access the truststore when it's password-protected                   | `""`    |
| `tls.resources.limits`       | The resources limits for the TLS init container                                  | `{}`    |
| `tls.resources.requests`     | The requested resources for the TLS init container                               | `{}`    |

### Metrics parameters

| Name                                            | Description                                                                                                                    | Value                                                                 |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------- |
| `metrics.enabled`                               | Deploy a Solr Prometheus exporter deployment to expose metrics                                                                 | `false`                                                               |
| `metrics.configFile`                            | Config file with metrics to export by the Solr prometheus metrics. To change it mount a different file using `extraConfigMaps` | `/opt/bitnami/solr/prometheus-exporter/conf/solr-exporter-config.xml` |
| `metrics.threads`                               | Number of Solr exporter threads                                                                                                | `7`                                                                   |
| `metrics.command`                               | Override Solr entrypoint string.                                                                                               | `[]`                                                                  |
| `metrics.args`                                  | Arguments for the provided command if needed                                                                                   | `[]`                                                                  |
| `metrics.extraEnvVars`                          | Additional environment variables to set                                                                                        | `[]`                                                                  |
| `metrics.extraEnvVarsCM`                        | ConfigMap with extra environment variables                                                                                     | `""`                                                                  |
| `metrics.extraEnvVarsSecret`                    | Secret with extra environment variables                                                                                        | `""`                                                                  |
| `metrics.containerPorts.http`                   | Solr Prometheus exporter HTTP container port                                                                                   | `9231`                                                                |
| `metrics.livenessProbe.enabled`                 | Enable livenessProbe on Solr Prometheus exporter containers                                                                    | `true`                                                                |
| `metrics.livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                                        | `10`                                                                  |
| `metrics.livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                                               | `5`                                                                   |
| `metrics.livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                                              | `15`                                                                  |
| `metrics.livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                                            | `15`                                                                  |
| `metrics.livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                                            | `1`                                                                   |
| `metrics.readinessProbe.enabled`                | Enable readinessProbe on Solr Prometheus exporter containers                                                                   | `true`                                                                |
| `metrics.readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                                       | `10`                                                                  |
| `metrics.readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                                              | `5`                                                                   |
| `metrics.readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                                             | `15`                                                                  |
| `metrics.readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                                           | `15`                                                                  |
| `metrics.readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                                           | `15`                                                                  |
| `metrics.startupProbe.enabled`                  | Enable startupProbe on Solr Prometheus exporter containers                                                                     | `false`                                                               |
| `metrics.startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                                         | `30`                                                                  |
| `metrics.startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                                                | `10`                                                                  |
| `metrics.startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                                               | `1`                                                                   |
| `metrics.startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                                             | `15`                                                                  |
| `metrics.startupProbe.successThreshold`         | Success threshold for startupProbe                                                                                             | `1`                                                                   |
| `metrics.customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                                            | `{}`                                                                  |
| `metrics.customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                                           | `{}`                                                                  |
| `metrics.customStartupProbe`                    | Custom startupProbe that overrides the default one                                                                             | `{}`                                                                  |
| `metrics.resources.limits`                      | The resources limits for the container                                                                                         | `{}`                                                                  |
| `metrics.resources.requests`                    | The requested resources for the container                                                                                      | `{}`                                                                  |
| `metrics.containerSecurityContext.enabled`      | Enable Solr Prometheus exporter containers' Security Context                                                                   | `true`                                                                |
| `metrics.containerSecurityContext.runAsUser`    | User ID for the containers.                                                                                                    | `1001`                                                                |
| `metrics.containerSecurityContext.runAsNonRoot` | Enable Solr Prometheus exporter containers' Security Context runAsNonRoot                                                      | `true`                                                                |
| `metrics.podSecurityContext.enabled`            | Enable Solr Prometheus exporter pods' Security Context                                                                         | `true`                                                                |
| `metrics.podSecurityContext.fsGroup`            | Group ID for the pods.                                                                                                         | `1001`                                                                |
| `metrics.podLabels`                             | Additional labels for Solr Prometheus exporter pod(s)                                                                          | `{}`                                                                  |
| `metrics.podAnnotations`                        | Additional annotations for Solr Prometheus exporter pod(s)                                                                     | `{}`                                                                  |
| `metrics.podAffinityPreset`                     | Solr Prometheus exporter pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                   | `""`                                                                  |
| `metrics.podAntiAffinityPreset`                 | Solr Prometheus exporter pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`              | `soft`                                                                |
| `metrics.nodeAffinityPreset.type`               | Solr Prometheus exporter node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`             | `""`                                                                  |
| `metrics.nodeAffinityPreset.key`                | Solr Prometheus exporter node label key to match Ignored if `affinity` is set.                                                 | `""`                                                                  |
| `metrics.nodeAffinityPreset.values`             | Solr Prometheus exporter node label values to match. Ignored if `affinity` is set.                                             | `[]`                                                                  |
| `metrics.affinity`                              | Affinity settings for Solr Prometheus exporter pod assignment. Evaluated as a template                                         | `{}`                                                                  |
| `metrics.nodeSelector`                          | Node labels for Solr Prometheus exporter pods assignment. Evaluated as a template                                              | `{}`                                                                  |
| `metrics.tolerations`                           | Tolerations for Solr Prometheus exporter pods assignment. Evaluated as a template                                              | `[]`                                                                  |
| `metrics.topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template       | `[]`                                                                  |
| `metrics.priorityClassName`                     | Solr Prometheus exporter pods' priority.                                                                                       | `""`                                                                  |
| `metrics.schedulerName`                         | Kubernetes pod scheduler registry                                                                                              | `""`                                                                  |
| `metrics.hostAliases`                           | Solr Prometheus exporter pod host aliases                                                                                      | `[]`                                                                  |
| `metrics.updateStrategy.type`                   | Solr Prometheus exporter deployment strategy type                                                                              | `RollingUpdate`                                                       |
| `metrics.updateStrategy.rollingUpdate`          | Solr Prometheus exporter deployment rolling update configuration parameters                                                    | `{}`                                                                  |
| `metrics.extraVolumes`                          | Optionally specify extra list of additional volumes for the Solr Prometheus exporter pod(s)                                    | `[]`                                                                  |
| `metrics.extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Solr Prometheus exporter container(s)                         | `[]`                                                                  |
| `metrics.initContainers`                        | Add init containers to the Solr Prometheus exporter pod(s)                                                                     | `[]`                                                                  |
| `metrics.sidecars`                              | Add sidecars to the Solr Prometheus exporter pod(s)                                                                            | `[]`                                                                  |
| `metrics.service.type`                          | Kubernetes Service type                                                                                                        | `ClusterIP`                                                           |
| `metrics.service.ports.http`                    | Solr Prometheus exporter HTTP service port                                                                                     | `9231`                                                                |
| `metrics.service.sessionAffinity`               | Control where client requests go, to the same pod or round-robin                                                               | `None`                                                                |
| `metrics.service.clusterIP`                     | Solr Prometheus exporter service Cluster IP                                                                                    | `""`                                                                  |
| `metrics.service.annotations`                   | annotations for Solr Prometheus exporter service                                                                               | `{}`                                                                  |
| `metrics.service.labels`                        | Additional labels for Solr Prometheus exporter service                                                                         | `{}`                                                                  |
| `metrics.serviceMonitor.enabled`                | Create ServiceMonitor Resource for scraping metrics using Prometheus Operator                                                  | `false`                                                               |
| `metrics.serviceMonitor.namespace`              | Namespace for the ServiceMonitor Resource (defaults to the Release Namespace)                                                  | `""`                                                                  |
| `metrics.serviceMonitor.interval`               | Interval at which metrics should be scraped.                                                                                   | `""`                                                                  |
| `metrics.serviceMonitor.scrapeTimeout`          | Timeout after which the scrape is ended                                                                                        | `""`                                                                  |
| `metrics.serviceMonitor.additionalLabels`       | Additional labels that can be used so ServiceMonitor will be discovered by Prometheus                                          | `{}`                                                                  |
| `metrics.serviceMonitor.selector`               | Prometheus instance selector labels                                                                                            | `{}`                                                                  |
| `metrics.serviceMonitor.relabelings`            | RelabelConfigs to apply to samples before scraping                                                                             | `[]`                                                                  |
| `metrics.serviceMonitor.metricRelabelings`      | MetricRelabelConfigs to apply to samples before ingestion                                                                      | `[]`                                                                  |
| `metrics.serviceMonitor.honorLabels`            | Specify honorLabels parameter to add the scrape endpoint                                                                       | `false`                                                               |
| `metrics.serviceMonitor.jobLabel`               | The name of the label on the target service to use as the job name in prometheus.                                              | `""`                                                                  |
| `metrics.prometheusRule.enabled`                | Create a custom prometheusRule Resource for scraping metrics using PrometheusOperator                                          | `false`                                                               |
| `metrics.prometheusRule.namespace`              | The namespace in which the prometheusRule will be created                                                                      | `""`                                                                  |
| `metrics.prometheusRule.additionalLabels`       | Additional labels for the prometheusRule                                                                                       | `{}`                                                                  |
| `metrics.prometheusRule.rules`                  | Custom Prometheus rules                                                                                                        | `[]`                                                                  |

### ZooKeeper parameters

| Name                                 | Description                                                               | Value                 |
| ------------------------------------ | ------------------------------------------------------------------------- | --------------------- |
| `zookeeper.enabled`                  | Enable ZooKeeper deployment. Needed for Solr cloud                        | `true`                |
| `zookeeper.fourlwCommandsWhitelist`  | A list of comma separated Four Letter Words commands that can be executed | `srvr,mntr,conf,ruok` |
| `zookeeper.containerPorts.client`    | ZooKeeper client container port                                           | `2181`                |
| `zookeeper.replicaCount`             | Number of ZooKeeper nodes                                                 | `3`                   |
| `zookeeper.persistence.enabled`      | Enable persistence on ZooKeeper using PVC(s)                              | `true`                |
| `zookeeper.persistence.storageClass` | Persistent Volume storage class                                           | `""`                  |
| `zookeeper.persistence.accessModes`  | Persistent Volume access modes                                            | `["ReadWriteOnce"]`   |
| `zookeeper.persistence.size`         | Persistent Volume size                                                    | `8Gi`                 |
| `externalZookeeper.servers`          | List of external zookeeper servers to use                                 | `[]`                  |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set cloudEnabled=true oci://registry-1.docker.io/bitnamicharts/solr
```

The above command enabled the Solr Cloud mode.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/solr
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling vs Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Use a different Apache Solr version

To modify the application version used in this chart, specify a different version of the image using the `image.tag` parameter and/or a different repository using the `image.repository` parameter. Refer to the [chart documentation for more information on these parameters and how to use them with images from a private registry](https://docs.bitnami.com/kubernetes/infrastructure/solr/configuration/change-image-version/).

### Add extra environment variables

In case you want to add extra environment variables (useful for advanced operations like custom init scripts), you can use the `extraEnvVars` property.

```yaml
extraEnvVars:
  - name: ZOOKEEPER_VERSION
    value: 6
```

Alternatively, you can use a ConfigMap or a Secret with the environment variables. To do so, use the `extraEnvVarsCM` or the `extraEnvVarsSecret` values.

### Use Sidecars and Init Containers

If additional containers are needed in the same pod (such as additional metrics or logging exporters), they can be defined using the `sidecars` config parameter. Similarly, extra init containers can be added using the `initContainers` parameter.

Refer to the chart documentation for more information on, and examples of, configuring and using [sidecars and init containers](https://docs.bitnami.com/kubernetes/infrastructure/solr/configuration/configure-sidecar-init-containers/).

### Set Pod affinity

This chart allows you to set your custom affinity using the `XXX.affinity` parameter(s). Find more information about Pod affinity in the [Kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, you can use the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `XXX.podAffinityPreset`, `XXX.podAntiAffinityPreset`, or `XXX.nodeAffinityPreset` parameters.

## Persistence

The [Bitnami Solr](https://github.com/bitnami/containers/tree/main/bitnami/solr) image can persist data. If enabled, the persisted path is `/bitnami/solr` by default.

The chart mounts a [Persistent Volume](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) at this location. The volume is created using dynamic volume provisioning.

### Add extra volumes

The Bitnami Solr chart supports mounting extra volumes (either PVCs, secrets or configmaps) by using the `extraVolumes` and `extraVolumeMounts` property. This can be combined with advanced operations like adding extra init containers and sidecars.

### Adjust permissions of persistent volume mountpoint

As the image run as non-root by default, it is necessary to adjust the ownership of the persistent volume so that the container can write data into it.

By default, the chart is configured to use Kubernetes Security Context to automatically change the ownership of the volume. However, this feature does not work in all Kubernetes distributions.
As an alternative, this chart supports using an initContainer to change the ownership of the volume before mounting it in the final destination.

You can enable this initContainer by setting `volumePermissions.enabled` to `true`.

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

## Upgrading

### To 7.0.0

This major updates the Zookeeper subchart to it newest major, 11.0.0. For more information on this subchart's major, please refer to [zookeeper upgrade notes](https://github.com/bitnami/charts/tree/master/bitnami/zookeeper#to-1100).

### To 6.0.0

This major updates the Zookeeper subchart to it newest major, 10.0.0. For more information on this subchart's major, please refer to [zookeeper upgrade notes](https://github.com/bitnami/charts/tree/main/bitnami/zookeeper#to-1000).

### To 4.0.0

This major updates the Zookeeper subchart to it newest major, 9.0.0. For more information on this subchart's major, please refer to [zookeeper upgrade notes](https://github.com/bitnami/charts/tree/main/bitnami/zookeeper#to-900).

### To 3.0.0

This major release renames several values in this chart and adds missing features, in order to be inline with the rest of assets in the Bitnami charts repository.

Affected values:

- `containerPort` has been regrouped under the `containerPorts` map.
- `service.port` has been regrouped under the `service.ports` map.
- `authentication.*` parameters are renamed to `auth.*`.

Additionally updates the ZooKeeper subchart to it newest major, `8.0.0`, which contains similar changes.

### To 2.0.0

In this version, the `image` block is defined once and is used in the different templates, while in the previous version, the `image` block was duplicated for the main container and the metrics one

```yaml
image:
  registry: docker.io
  repository: bitnami/solr
  tag: 8.9.0
```

VS

```yaml
image:
  registry: docker.io
  repository: bitnami/solr
  tag: 8.9.0
...
metrics:
  image:
    registry: docker.io
    repository: bitnami/solr
    tag: 8.9.0
```

See [PR#7114](https://github.com/bitnami/charts/pull/7114) for more info about the implemented changes

### To 1.0.0

This major updates the Zookeeper subchart to it newest major, 7.0.0, which renames all TLS-related settings. For more information on this subchart's major, please refer to [zookeeper upgrade notes](https://github.com/bitnami/charts/tree/main/bitnami/zookeeper#to-700).

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