<!--- app-name: Supabase -->

# Supabase packaged by Bitnami

Supabase is an open source Firebase alternative. Provides all the necessary backend features to build your application in a scalable way. Uses PostgreSQL as datastore.

[Overview of Supabase](https://supabase.com/)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/supabase
```

## Introduction

Bitnami charts for Helm are carefully engineered, actively maintained and are the quickest and easiest way to deploy containers on a Kubernetes cluster that are ready to handle production workloads.

This chart bootstraps a [Supabase](https://www.supabase.com/) deployment in a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.
Bitnami charts can be used with [Kubeapps](https://kubeapps.com/) for deployment and management of Helm Charts in clusters.

[Learn more about the default configuration of the chart](https://docs.bitnami.com/kubernetes/infrastructure/supabase/get-started/).

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/supabase
```

The command deploys Supabase on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

### Global parameters

| Name                                  | Description                                                   | Value         |
| ------------------------------------- | ------------------------------------------------------------- | ------------- |
| `global.imageRegistry`                | Global Docker image registry                                  | `""`          |
| `global.imagePullSecrets`             | Global Docker registry secret names as an array               | `[]`          |
| `global.storageClass`                 | Global StorageClass for Persistent Volume(s)                  | `""`          |
| `global.jwt.existingSecret`           | The name of the existing secret containing the JWT secret     | `""`          |
| `global.jwt.existingSecretKey`        | The key in the existing secret containing the JWT secret      | `secret`      |
| `global.jwt.existingSecretAnonKey`    | The key in the existing secret containing the JWT anon key    | `anon-key`    |
| `global.jwt.existingSecretServiceKey` | The key in the existing secret containing the JWT service key | `service-key` |

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

### Supabase Common parameters

| Name                                                                 | Description                                                                                                                                        | Value                 |
| -------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| `jwt.secret`                                                         | The secret string used to sign JWT tokens                                                                                                          | `""`                  |
| `jwt.anonKey`                                                        | JWT string for annonymous users                                                                                                                    | `""`                  |
| `jwt.serviceKey`                                                     | JWT string for service users                                                                                                                       | `""`                  |
| `jwt.autoGenerate.forceRun`                                          | Force the run of the JWT generation job                                                                                                            | `false`               |
| `jwt.autoGenerate.image.registry`                                    | JWT CLI image registry                                                                                                                             | `docker.io`           |
| `jwt.autoGenerate.image.repository`                                  | JWT CLI image repository                                                                                                                           | `bitnami/jwt-cli`     |
| `jwt.autoGenerate.image.tag`                                         | JWT CLI image tag (immutable tags are recommended)                                                                                                 | `5.0.3-debian-11-r32` |
| `jwt.autoGenerate.image.digest`                                      | JWT CLI image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                  |
| `jwt.autoGenerate.image.pullPolicy`                                  | JWT CLI image pull policy                                                                                                                          | `IfNotPresent`        |
| `jwt.autoGenerate.image.pullSecrets`                                 | JWT CLI image pull secrets                                                                                                                         | `[]`                  |
| `jwt.autoGenerate.kubectlImage.registry`                             | Kubectl image registry                                                                                                                             | `docker.io`           |
| `jwt.autoGenerate.kubectlImage.repository`                           | Kubectl image repository                                                                                                                           | `bitnami/kubectl`     |
| `jwt.autoGenerate.kubectlImage.tag`                                  | Kubectl image tag (immutable tags are recommended)                                                                                                 | `1.26.5-debian-11-r1` |
| `jwt.autoGenerate.kubectlImage.digest`                               | Kubectl image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag                                            | `""`                  |
| `jwt.autoGenerate.kubectlImage.pullPolicy`                           | Kubectl image pull policy                                                                                                                          | `IfNotPresent`        |
| `jwt.autoGenerate.kubectlImage.pullSecrets`                          | Kubectl image pull secrets                                                                                                                         | `[]`                  |
| `jwt.autoGenerate.backoffLimit`                                      | set backoff limit of the job                                                                                                                       | `10`                  |
| `jwt.autoGenerate.extraVolumes`                                      | Optionally specify extra list of additional volumes for the jwt init job                                                                           | `[]`                  |
| `jwt.autoGenerate.containerSecurityContext.enabled`                  | Enabled jwt init job containers' Security Context                                                                                                  | `true`                |
| `jwt.autoGenerate.containerSecurityContext.runAsUser`                | Set jwt init job containers' Security Context runAsUser                                                                                            | `1001`                |
| `jwt.autoGenerate.containerSecurityContext.runAsNonRoot`             | Set jwt init job containers' Security Context runAsNonRoot                                                                                         | `true`                |
| `jwt.autoGenerate.containerSecurityContext.readOnlyRootFilesystem`   | Set jwt init job containers' Security Context runAsNonRoot                                                                                         | `false`               |
| `jwt.autoGenerate.containerSecurityContext.allowPrivilegeEscalation` | Set container's privilege escalation                                                                                                               | `false`               |
| `jwt.autoGenerate.containerSecurityContext.capabilities.drop`        | Set container's Security Context runAsNonRoot                                                                                                      | `["ALL"]`             |
| `jwt.autoGenerate.podSecurityContext.enabled`                        | Enabled jwt init job pods' Security Context                                                                                                        | `true`                |
| `jwt.autoGenerate.podSecurityContext.fsGroup`                        | Set jwt init job pod's Security Context fsGroup                                                                                                    | `1001`                |
| `jwt.autoGenerate.podSecurityContext.seccompProfile.type`            | Set container's Security Context seccomp profile                                                                                                   | `RuntimeDefault`      |
| `jwt.autoGenerate.extraEnvVars`                                      | Array containing extra env vars to configure the jwt init job                                                                                      | `[]`                  |
| `jwt.autoGenerate.extraEnvVarsCM`                                    | ConfigMap containing extra env vars to configure the jwt init job                                                                                  | `""`                  |
| `jwt.autoGenerate.extraEnvVarsSecret`                                | Secret containing extra env vars to configure the jwt init job (in case of sensitive data)                                                         | `""`                  |
| `jwt.autoGenerate.extraVolumeMounts`                                 | Array of extra volume mounts to be added to the jwt Container (evaluated as template). Normally used with `extraVolumes`.                          | `[]`                  |
| `jwt.autoGenerate.resources.limits`                                  | The resources limits for the container                                                                                                             | `{}`                  |
| `jwt.autoGenerate.resources.requests`                                | The requested resources for the container                                                                                                          | `{}`                  |
| `jwt.autoGenerate.hostAliases`                                       | Add deployment host aliases                                                                                                                        | `[]`                  |
| `jwt.autoGenerate.annotations`                                       | Add annotations to the job                                                                                                                         | `{}`                  |
| `jwt.autoGenerate.podLabels`                                         | Additional pod labels                                                                                                                              | `{}`                  |
| `jwt.autoGenerate.podAnnotations`                                    | Additional pod annotations                                                                                                                         | `{}`                  |
| `publicURL`                                                          | Supabase API public URL                                                                                                                            | `""`                  |
| `dbSSL`                                                              | Supabase API database connection mode for SSL. Applied to all components. Allowed values: verify-ca, verify-full, disable, allow, prefer, require  | `disable`             |

### Supabase Auth Parameters

| Name                                                   | Description                                                                                                                                       | Value                 |
| ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| `auth.enabled`                                         | Enable Supabase auth                                                                                                                              | `true`                |
| `auth.replicaCount`                                    | Number of Supabase auth replicas to deploy                                                                                                        | `1`                   |
| `auth.defaultConfig`                                   | Supabase auth default configuration                                                                                                               | `""`                  |
| `auth.extraConfig`                                     | Supabase auth extra configuration                                                                                                                 | `{}`                  |
| `auth.existingConfigmap`                               | The name of an existing ConfigMap with the default configuration                                                                                  | `""`                  |
| `auth.extraConfigExistingConfigmap`                    | The name of an existing ConfigMap with extra configuration                                                                                        | `""`                  |
| `auth.image.registry`                                  | Gotrue image registry                                                                                                                             | `docker.io`           |
| `auth.image.repository`                                | Gotrue image repository                                                                                                                           | `bitnami/gotrue`      |
| `auth.image.tag`                                       | Gotrue image tag (immutable tags are recommended)                                                                                                 | `1.0.1-debian-11-r34` |
| `auth.image.digest`                                    | Gotrue image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                  |
| `auth.image.pullPolicy`                                | Gotrue image pull policy                                                                                                                          | `IfNotPresent`        |
| `auth.image.pullSecrets`                               | Gotrue image pull secrets                                                                                                                         | `[]`                  |
| `auth.containerPorts.http`                             | Supabase auth HTTP container port                                                                                                                 | `9999`                |
| `auth.livenessProbe.enabled`                           | Enable livenessProbe on Supabase auth containers                                                                                                  | `true`                |
| `auth.livenessProbe.initialDelaySeconds`               | Initial delay seconds for livenessProbe                                                                                                           | `5`                   |
| `auth.livenessProbe.periodSeconds`                     | Period seconds for livenessProbe                                                                                                                  | `10`                  |
| `auth.livenessProbe.timeoutSeconds`                    | Timeout seconds for livenessProbe                                                                                                                 | `5`                   |
| `auth.livenessProbe.failureThreshold`                  | Failure threshold for livenessProbe                                                                                                               | `6`                   |
| `auth.livenessProbe.successThreshold`                  | Success threshold for livenessProbe                                                                                                               | `1`                   |
| `auth.readinessProbe.enabled`                          | Enable readinessProbe on Supabase auth containers                                                                                                 | `true`                |
| `auth.readinessProbe.initialDelaySeconds`              | Initial delay seconds for readinessProbe                                                                                                          | `5`                   |
| `auth.readinessProbe.periodSeconds`                    | Period seconds for readinessProbe                                                                                                                 | `10`                  |
| `auth.readinessProbe.timeoutSeconds`                   | Timeout seconds for readinessProbe                                                                                                                | `5`                   |
| `auth.readinessProbe.failureThreshold`                 | Failure threshold for readinessProbe                                                                                                              | `6`                   |
| `auth.readinessProbe.successThreshold`                 | Success threshold for readinessProbe                                                                                                              | `1`                   |
| `auth.startupProbe.enabled`                            | Enable startupProbe on Supabase auth containers                                                                                                   | `false`               |
| `auth.startupProbe.initialDelaySeconds`                | Initial delay seconds for startupProbe                                                                                                            | `5`                   |
| `auth.startupProbe.periodSeconds`                      | Period seconds for startupProbe                                                                                                                   | `10`                  |
| `auth.startupProbe.timeoutSeconds`                     | Timeout seconds for startupProbe                                                                                                                  | `5`                   |
| `auth.startupProbe.failureThreshold`                   | Failure threshold for startupProbe                                                                                                                | `6`                   |
| `auth.startupProbe.successThreshold`                   | Success threshold for startupProbe                                                                                                                | `1`                   |
| `auth.customLivenessProbe`                             | Custom livenessProbe that overrides the default one                                                                                               | `{}`                  |
| `auth.customReadinessProbe`                            | Custom readinessProbe that overrides the default one                                                                                              | `{}`                  |
| `auth.customStartupProbe`                              | Custom startupProbe that overrides the default one                                                                                                | `{}`                  |
| `auth.resources.limits`                                | The resources limits for the Supabase auth containers                                                                                             | `{}`                  |
| `auth.resources.requests`                              | The requested resources for the Supabase auth containers                                                                                          | `{}`                  |
| `auth.podSecurityContext.enabled`                      | Enabled Supabase auth pods' Security Context                                                                                                      | `true`                |
| `auth.podSecurityContext.fsGroup`                      | Set Supabase auth pod's Security Context fsGroup                                                                                                  | `1001`                |
| `auth.containerSecurityContext.enabled`                | Enabled Supabase auth containers' Security Context                                                                                                | `true`                |
| `auth.containerSecurityContext.runAsUser`              | Set Supabase auth containers' Security Context runAsUser                                                                                          | `1001`                |
| `auth.containerSecurityContext.runAsNonRoot`           | Set Supabase auth containers' Security Context runAsNonRoot                                                                                       | `true`                |
| `auth.containerSecurityContext.readOnlyRootFilesystem` | Set Supabase auth containers' Security Context runAsNonRoot                                                                                       | `false`               |
| `auth.command`                                         | Override default container command (useful when using custom images)                                                                              | `[]`                  |
| `auth.args`                                            | Override default container args (useful when using custom images)                                                                                 | `[]`                  |
| `auth.hostAliases`                                     | Supabase auth pods host aliases                                                                                                                   | `[]`                  |
| `auth.podLabels`                                       | Extra labels for Supabase auth pods                                                                                                               | `{}`                  |
| `auth.podAnnotations`                                  | Annotations for Supabase auth pods                                                                                                                | `{}`                  |
| `auth.podAffinityPreset`                               | Pod affinity preset. Ignored if `auth.affinity` is set. Allowed values: `soft` or `hard`                                                          | `""`                  |
| `auth.podAntiAffinityPreset`                           | Pod anti-affinity preset. Ignored if `auth.affinity` is set. Allowed values: `soft` or `hard`                                                     | `soft`                |
| `auth.nodeAffinityPreset.type`                         | Node affinity preset type. Ignored if `auth.affinity` is set. Allowed values: `soft` or `hard`                                                    | `""`                  |
| `auth.nodeAffinityPreset.key`                          | Node label key to match. Ignored if `auth.affinity` is set                                                                                        | `""`                  |
| `auth.nodeAffinityPreset.values`                       | Node label values to match. Ignored if `auth.affinity` is set                                                                                     | `[]`                  |
| `auth.affinity`                                        | Affinity for Supabase auth pods assignment                                                                                                        | `{}`                  |
| `auth.nodeSelector`                                    | Node labels for Supabase auth pods assignment                                                                                                     | `{}`                  |
| `auth.tolerations`                                     | Tolerations for Supabase auth pods assignment                                                                                                     | `[]`                  |
| `auth.updateStrategy.type`                             | Supabase auth statefulset strategy type                                                                                                           | `RollingUpdate`       |
| `auth.priorityClassName`                               | Supabase auth pods' priorityClassName                                                                                                             | `""`                  |
| `auth.topologySpreadConstraints`                       | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template                          | `[]`                  |
| `auth.schedulerName`                                   | Name of the k8s scheduler (other than default) for Supabase auth pods                                                                             | `""`                  |
| `auth.terminationGracePeriodSeconds`                   | Seconds Redmine pod needs to terminate gracefully                                                                                                 | `""`                  |
| `auth.lifecycleHooks`                                  | for the Supabase auth container(s) to automate configuration before or after startup                                                              | `{}`                  |
| `auth.extraEnvVars`                                    | Array with extra environment variables to add to Supabase auth nodes                                                                              | `[]`                  |
| `auth.extraEnvVarsCM`                                  | Name of existing ConfigMap containing extra env vars for Supabase auth nodes                                                                      | `""`                  |
| `auth.extraEnvVarsSecret`                              | Name of existing Secret containing extra env vars for Supabase auth nodes                                                                         | `""`                  |
| `auth.extraVolumes`                                    | Optionally specify extra list of additional volumes for the Supabase auth pod(s)                                                                  | `[]`                  |
| `auth.extraVolumeMounts`                               | Optionally specify extra list of additional volumeMounts for the Supabase auth container(s)                                                       | `[]`                  |
| `auth.sidecars`                                        | Add additional sidecar containers to the Supabase auth pod(s)                                                                                     | `[]`                  |
| `auth.initContainers`                                  | Add additional init containers to the Supabase auth pod(s)                                                                                        | `[]`                  |

### Supabase Auth Traffic Exposure Parameters

| Name                                    | Description                                                                              | Value       |
| --------------------------------------- | ---------------------------------------------------------------------------------------- | ----------- |
| `auth.service.type`                     | Supabase auth service type                                                               | `ClusterIP` |
| `auth.service.ports.http`               | Supabase auth service HTTP port                                                          | `80`        |
| `auth.service.nodePorts.http`           | Node port for HTTP                                                                       | `""`        |
| `auth.service.clusterIP`                | Supabase auth service Cluster IP                                                         | `""`        |
| `auth.service.loadBalancerIP`           | Supabase auth service Load Balancer IP                                                   | `""`        |
| `auth.service.loadBalancerSourceRanges` | Supabase auth service Load Balancer sources                                              | `[]`        |
| `auth.service.externalTrafficPolicy`    | Supabase auth service external traffic policy                                            | `Cluster`   |
| `auth.service.annotations`              | Additional custom annotations for Supabase auth service                                  | `{}`        |
| `auth.service.extraPorts`               | Extra ports to expose in Supabase auth service (normally used with the `sidecars` value) | `[]`        |
| `auth.service.sessionAffinity`          | Control where auth requests go, to the same pod or round-robin                           | `None`      |
| `auth.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                              | `{}`        |

### Supabase Meta Parameters

| Name                                                   | Description                                                                                                                                                       | Value                            |
| ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------- |
| `meta.enabled`                                         | Enable Supabase Postgres Meta                                                                                                                                     | `true`                           |
| `meta.replicaCount`                                    | Number of Supabase Postgres Meta replicas to deploy                                                                                                               | `1`                              |
| `meta.defaultConfig`                                   | Default Supabase Postgres Meta configuration                                                                                                                      | `""`                             |
| `meta.extraConfig`                                     | Extra Supabase Postgres Meta configuration                                                                                                                        | `{}`                             |
| `meta.existingConfigmap`                               | The name of an existing ConfigMap with the default configuration                                                                                                  | `""`                             |
| `meta.extraConfigExistingConfigmap`                    | The name of an existing ConfigMap with extra configuration                                                                                                        | `""`                             |
| `meta.image.registry`                                  | Supabase Postgres Meta image registry                                                                                                                             | `docker.io`                      |
| `meta.image.repository`                                | Supabase Postgres Meta image repository                                                                                                                           | `bitnami/supabase-postgres-meta` |
| `meta.image.tag`                                       | Supabase Postgres Meta image tag (immutable tags are recommended)                                                                                                 | `0.65.0-debian-11-r0`            |
| `meta.image.digest`                                    | Supabase Postgres Meta image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                             |
| `meta.image.pullPolicy`                                | Supabase Postgres Meta image pull policy                                                                                                                          | `IfNotPresent`                   |
| `meta.image.pullSecrets`                               | Supabase Postgres Meta image pull secrets                                                                                                                         | `[]`                             |
| `meta.containerPorts.http`                             | Supabase Postgres Meta HTTP container port                                                                                                                        | `8080`                           |
| `meta.livenessProbe.enabled`                           | Enable livenessProbe on Supabase Postgres Meta containers                                                                                                         | `true`                           |
| `meta.livenessProbe.initialDelaySeconds`               | Initial delay seconds for livenessProbe                                                                                                                           | `5`                              |
| `meta.livenessProbe.periodSeconds`                     | Period seconds for livenessProbe                                                                                                                                  | `10`                             |
| `meta.livenessProbe.timeoutSeconds`                    | Timeout seconds for livenessProbe                                                                                                                                 | `5`                              |
| `meta.livenessProbe.failureThreshold`                  | Failure threshold for livenessProbe                                                                                                                               | `6`                              |
| `meta.livenessProbe.successThreshold`                  | Success threshold for livenessProbe                                                                                                                               | `1`                              |
| `meta.readinessProbe.enabled`                          | Enable readinessProbe on Supabase Postgres Meta containers                                                                                                        | `true`                           |
| `meta.readinessProbe.initialDelaySeconds`              | Initial delay seconds for readinessProbe                                                                                                                          | `5`                              |
| `meta.readinessProbe.periodSeconds`                    | Period seconds for readinessProbe                                                                                                                                 | `10`                             |
| `meta.readinessProbe.timeoutSeconds`                   | Timeout seconds for readinessProbe                                                                                                                                | `5`                              |
| `meta.readinessProbe.failureThreshold`                 | Failure threshold for readinessProbe                                                                                                                              | `6`                              |
| `meta.readinessProbe.successThreshold`                 | Success threshold for readinessProbe                                                                                                                              | `1`                              |
| `meta.startupProbe.enabled`                            | Enable startupProbe on Supabase Postgres Meta containers                                                                                                          | `false`                          |
| `meta.startupProbe.initialDelaySeconds`                | Initial delay seconds for startupProbe                                                                                                                            | `5`                              |
| `meta.startupProbe.periodSeconds`                      | Period seconds for startupProbe                                                                                                                                   | `10`                             |
| `meta.startupProbe.timeoutSeconds`                     | Timeout seconds for startupProbe                                                                                                                                  | `5`                              |
| `meta.startupProbe.failureThreshold`                   | Failure threshold for startupProbe                                                                                                                                | `6`                              |
| `meta.startupProbe.successThreshold`                   | Success threshold for startupProbe                                                                                                                                | `1`                              |
| `meta.customLivenessProbe`                             | Custom livenessProbe that overrides the default one                                                                                                               | `{}`                             |
| `meta.customReadinessProbe`                            | Custom readinessProbe that overrides the default one                                                                                                              | `{}`                             |
| `meta.customStartupProbe`                              | Custom startupProbe that overrides the default one                                                                                                                | `{}`                             |
| `meta.resources.limits`                                | The resources limits for the Supabase Postgres Meta containers                                                                                                    | `{}`                             |
| `meta.resources.requests`                              | The requested resources for the Supabase Postgres Meta containers                                                                                                 | `{}`                             |
| `meta.podSecurityContext.enabled`                      | Enabled Supabase Postgres Meta pods' Security Context                                                                                                             | `true`                           |
| `meta.podSecurityContext.fsGroup`                      | Set Supabase Postgres Meta pod's Security Context fsGroup                                                                                                         | `1001`                           |
| `meta.containerSecurityContext.enabled`                | Enabled Supabase Postgres Meta containers' Security Context                                                                                                       | `true`                           |
| `meta.containerSecurityContext.runAsUser`              | Set Supabase Postgres Meta containers' Security Context runAsUser                                                                                                 | `1001`                           |
| `meta.containerSecurityContext.runAsNonRoot`           | Set Supabase Postgres Meta containers' Security Context runAsNonRoot                                                                                              | `true`                           |
| `meta.containerSecurityContext.readOnlyRootFilesystem` | Set Supabase Postgres Meta containers' Security Context runAsNonRoot                                                                                              | `false`                          |
| `meta.command`                                         | Override default container command (useful when using custom images)                                                                                              | `[]`                             |
| `meta.args`                                            | Override default container args (useful when using custom images)                                                                                                 | `[]`                             |
| `meta.hostAliases`                                     | Supabase Postgres Meta pods host aliases                                                                                                                          | `[]`                             |
| `meta.podLabels`                                       | Extra labels for Supabase Postgres Meta pods                                                                                                                      | `{}`                             |
| `meta.podAnnotations`                                  | Annotations for Supabase Postgres Meta pods                                                                                                                       | `{}`                             |
| `meta.podAffinityPreset`                               | Pod affinity preset. Ignored if `meta.affinity` is set. Allowed values: `soft` or `hard`                                                                          | `""`                             |
| `meta.podAntiAffinityPreset`                           | Pod anti-affinity preset. Ignored if `meta.affinity` is set. Allowed values: `soft` or `hard`                                                                     | `soft`                           |
| `meta.nodeAffinityPreset.type`                         | Node affinity preset type. Ignored if `meta.affinity` is set. Allowed values: `soft` or `hard`                                                                    | `""`                             |
| `meta.nodeAffinityPreset.key`                          | Node label key to match. Ignored if `meta.affinity` is set                                                                                                        | `""`                             |
| `meta.nodeAffinityPreset.values`                       | Node label values to match. Ignored if `meta.affinity` is set                                                                                                     | `[]`                             |
| `meta.affinity`                                        | Affinity for Supabase Postgres Meta pods assignment                                                                                                               | `{}`                             |
| `meta.nodeSelector`                                    | Node labels for Supabase Postgres Meta pods assignment                                                                                                            | `{}`                             |
| `meta.tolerations`                                     | Tolerations for Supabase Postgres Meta pods assignment                                                                                                            | `[]`                             |
| `meta.updateStrategy.type`                             | Supabase Postgres Meta statefulset strategy type                                                                                                                  | `RollingUpdate`                  |
| `meta.priorityClassName`                               | Supabase Postgres Meta pods' priorityClassName                                                                                                                    | `""`                             |
| `meta.topologySpreadConstraints`                       | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template                                          | `[]`                             |
| `meta.schedulerName`                                   | Name of the k8s scheduler (other than default) for Supabase Postgres Meta pods                                                                                    | `""`                             |
| `meta.terminationGracePeriodSeconds`                   | Seconds Redmine pod needs to terminate gracefully                                                                                                                 | `""`                             |
| `meta.lifecycleHooks`                                  | for the Supabase Postgres Meta container(s) to automate configuration before or after startup                                                                     | `{}`                             |
| `meta.extraEnvVars`                                    | Array with extra environment variables to add to Supabase Postgres Meta nodes                                                                                     | `[]`                             |
| `meta.extraEnvVarsCM`                                  | Name of existing ConfigMap containing extra env vars for Supabase Postgres Meta nodes                                                                             | `""`                             |
| `meta.extraEnvVarsSecret`                              | Name of existing Secret containing extra env vars for Supabase Postgres Meta nodes                                                                                | `""`                             |
| `meta.extraVolumes`                                    | Optionally specify extra list of additional volumes for the Supabase Postgres Meta pod(s)                                                                         | `[]`                             |
| `meta.extraVolumeMounts`                               | Optionally specify extra list of additional volumeMounts for the Supabase Postgres Meta container(s)                                                              | `[]`                             |
| `meta.sidecars`                                        | Add additional sidecar containers to the Supabase Postgres Meta pod(s)                                                                                            | `[]`                             |
| `meta.initContainers`                                  | Add additional init containers to the Supabase Postgres Meta pod(s)                                                                                               | `[]`                             |

### Supabase Meta Traffic Exposure Parameters

| Name                                    | Description                                                                                       | Value       |
| --------------------------------------- | ------------------------------------------------------------------------------------------------- | ----------- |
| `meta.service.type`                     | Supabase Postgres Meta service type                                                               | `ClusterIP` |
| `meta.service.ports.http`               | Supabase Postgres Meta service HTTP port                                                          | `80`        |
| `meta.service.nodePorts.http`           | Node port for HTTP                                                                                | `""`        |
| `meta.service.clusterIP`                | Supabase Postgres Meta service Cluster IP                                                         | `""`        |
| `meta.service.loadBalancerIP`           | Supabase Postgres Meta service Load Balancer IP                                                   | `""`        |
| `meta.service.loadBalancerSourceRanges` | Supabase Postgres Meta service Load Balancer sources                                              | `[]`        |
| `meta.service.externalTrafficPolicy`    | Supabase Postgres Meta service external traffic policy                                            | `Cluster`   |
| `meta.service.annotations`              | Additional custom annotations for Supabase Postgres Meta service                                  | `{}`        |
| `meta.service.extraPorts`               | Extra ports to expose in Supabase Postgres Meta service (normally used with the `sidecars` value) | `[]`        |
| `meta.service.sessionAffinity`          | Control where meta requests go, to the same pod or round-robin                                    | `None`      |
| `meta.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                       | `{}`        |

### Supabase Realtime Parameters

| Name                                                       | Description                                                                                                                                         | Value                       |
| ---------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------- |
| `realtime.enabled`                                         | Enable Supabase realtime                                                                                                                            | `true`                      |
| `realtime.replicaCount`                                    | Number of Supabase realtime replicas to deploy                                                                                                      | `1`                         |
| `realtime.keyBase`                                         | key base for Supabase realtime                                                                                                                      | `""`                        |
| `realtime.existingSecret`                                  | Name of an existing secret containing the key base for Supabase realtime                                                                            | `""`                        |
| `realtime.existingSecretKey`                               | Key in the existing secret containing the key base for Supabase realtime                                                                            | `key-base`                  |
| `realtime.defaultConfig`                                   | Default configuration for Supabase realtime                                                                                                         | `""`                        |
| `realtime.extraConfig`                                     | Extra configuration for Supabase realtime                                                                                                           | `{}`                        |
| `realtime.existingConfigmap`                               | The name of an existing ConfigMap with the default configuration                                                                                    | `""`                        |
| `realtime.extraConfigExistingConfigmap`                    | The name of an existing ConfigMap with extra configuration                                                                                          | `""`                        |
| `realtime.image.registry`                                  | Realtime image registry                                                                                                                             | `docker.io`                 |
| `realtime.image.repository`                                | Realtime image repository                                                                                                                           | `bitnami/supabase-realtime` |
| `realtime.image.tag`                                       | Realtime image tag (immutable tags are recommended)                                                                                                 | `2.13.1-debian-11-r0`       |
| `realtime.image.digest`                                    | Realtime image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                        |
| `realtime.image.pullPolicy`                                | Realtime image pull policy                                                                                                                          | `IfNotPresent`              |
| `realtime.image.pullSecrets`                               | Realtime image pull secrets                                                                                                                         | `[]`                        |
| `realtime.containerPorts.http`                             | Supabase realtime HTTP container port                                                                                                               | `9999`                      |
| `realtime.livenessProbe.enabled`                           | Enable livenessProbe on Supabase realtime containers                                                                                                | `true`                      |
| `realtime.livenessProbe.initialDelaySeconds`               | Initial delay seconds for livenessProbe                                                                                                             | `5`                         |
| `realtime.livenessProbe.periodSeconds`                     | Period seconds for livenessProbe                                                                                                                    | `10`                        |
| `realtime.livenessProbe.timeoutSeconds`                    | Timeout seconds for livenessProbe                                                                                                                   | `5`                         |
| `realtime.livenessProbe.failureThreshold`                  | Failure threshold for livenessProbe                                                                                                                 | `6`                         |
| `realtime.livenessProbe.successThreshold`                  | Success threshold for livenessProbe                                                                                                                 | `1`                         |
| `realtime.readinessProbe.enabled`                          | Enable readinessProbe on Supabase realtime containers                                                                                               | `true`                      |
| `realtime.readinessProbe.initialDelaySeconds`              | Initial delay seconds for readinessProbe                                                                                                            | `5`                         |
| `realtime.readinessProbe.periodSeconds`                    | Period seconds for readinessProbe                                                                                                                   | `10`                        |
| `realtime.readinessProbe.timeoutSeconds`                   | Timeout seconds for readinessProbe                                                                                                                  | `5`                         |
| `realtime.readinessProbe.failureThreshold`                 | Failure threshold for readinessProbe                                                                                                                | `6`                         |
| `realtime.readinessProbe.successThreshold`                 | Success threshold for readinessProbe                                                                                                                | `1`                         |
| `realtime.startupProbe.enabled`                            | Enable startupProbe on Supabase realtime containers                                                                                                 | `false`                     |
| `realtime.startupProbe.initialDelaySeconds`                | Initial delay seconds for startupProbe                                                                                                              | `5`                         |
| `realtime.startupProbe.periodSeconds`                      | Period seconds for startupProbe                                                                                                                     | `10`                        |
| `realtime.startupProbe.timeoutSeconds`                     | Timeout seconds for startupProbe                                                                                                                    | `5`                         |
| `realtime.startupProbe.failureThreshold`                   | Failure threshold for startupProbe                                                                                                                  | `6`                         |
| `realtime.startupProbe.successThreshold`                   | Success threshold for startupProbe                                                                                                                  | `1`                         |
| `realtime.customLivenessProbe`                             | Custom livenessProbe that overrides the default one                                                                                                 | `{}`                        |
| `realtime.customReadinessProbe`                            | Custom readinessProbe that overrides the default one                                                                                                | `{}`                        |
| `realtime.customStartupProbe`                              | Custom startupProbe that overrides the default one                                                                                                  | `{}`                        |
| `realtime.resources.limits`                                | The resources limits for the Supabase realtime containers                                                                                           | `{}`                        |
| `realtime.resources.requests`                              | The requested resources for the Supabase realtime containers                                                                                        | `{}`                        |
| `realtime.podSecurityContext.enabled`                      | Enabled Supabase realtime pods' Security Context                                                                                                    | `true`                      |
| `realtime.podSecurityContext.fsGroup`                      | Set Supabase realtime pod's Security Context fsGroup                                                                                                | `1001`                      |
| `realtime.containerSecurityContext.enabled`                | Enabled Supabase realtime containers' Security Context                                                                                              | `true`                      |
| `realtime.containerSecurityContext.runAsUser`              | Set Supabase realtime containers' Security Context runAsUser                                                                                        | `1001`                      |
| `realtime.containerSecurityContext.runAsNonRoot`           | Set Supabase realtime containers' Security Context runAsNonRoot                                                                                     | `true`                      |
| `realtime.containerSecurityContext.readOnlyRootFilesystem` | Set Supabase realtime containers' Security Context runAsNonRoot                                                                                     | `false`                     |
| `realtime.command`                                         | Override default container command (useful when using custom images)                                                                                | `[]`                        |
| `realtime.args`                                            | Override default container args (useful when using custom images)                                                                                   | `[]`                        |
| `realtime.hostAliases`                                     | Supabase realtime pods host aliases                                                                                                                 | `[]`                        |
| `realtime.podLabels`                                       | Extra labels for Supabase realtime pods                                                                                                             | `{}`                        |
| `realtime.podAnnotations`                                  | Annotations for Supabase realtime pods                                                                                                              | `{}`                        |
| `realtime.podAffinityPreset`                               | Pod affinity preset. Ignored if `realtime.affinity` is set. Allowed values: `soft` or `hard`                                                        | `""`                        |
| `realtime.podAntiAffinityPreset`                           | Pod anti-affinity preset. Ignored if `realtime.affinity` is set. Allowed values: `soft` or `hard`                                                   | `soft`                      |
| `realtime.nodeAffinityPreset.type`                         | Node affinity preset type. Ignored if `realtime.affinity` is set. Allowed values: `soft` or `hard`                                                  | `""`                        |
| `realtime.nodeAffinityPreset.key`                          | Node label key to match. Ignored if `realtime.affinity` is set                                                                                      | `""`                        |
| `realtime.nodeAffinityPreset.values`                       | Node label values to match. Ignored if `realtime.affinity` is set                                                                                   | `[]`                        |
| `realtime.affinity`                                        | Affinity for Supabase realtime pods assignment                                                                                                      | `{}`                        |
| `realtime.nodeSelector`                                    | Node labels for Supabase realtime pods assignment                                                                                                   | `{}`                        |
| `realtime.tolerations`                                     | Tolerations for Supabase realtime pods assignment                                                                                                   | `[]`                        |
| `realtime.updateStrategy.type`                             | Supabase realtime statefulset strategy type                                                                                                         | `RollingUpdate`             |
| `realtime.priorityClassName`                               | Supabase realtime pods' priorityClassName                                                                                                           | `""`                        |
| `realtime.topologySpreadConstraints`                       | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template                            | `[]`                        |
| `realtime.schedulerName`                                   | Name of the k8s scheduler (other than default) for Supabase realtime pods                                                                           | `""`                        |
| `realtime.terminationGracePeriodSeconds`                   | Seconds Redmine pod needs to terminate gracefully                                                                                                   | `""`                        |
| `realtime.lifecycleHooks`                                  | for the Supabase realtime container(s) to automate configuration before or after startup                                                            | `{}`                        |
| `realtime.extraEnvVars`                                    | Array with extra environment variables to add to Supabase realtime nodes                                                                            | `[]`                        |
| `realtime.extraEnvVarsCM`                                  | Name of existing ConfigMap containing extra env vars for Supabase realtime nodes                                                                    | `""`                        |
| `realtime.extraEnvVarsSecret`                              | Name of existing Secret containing extra env vars for Supabase realtime nodes                                                                       | `""`                        |
| `realtime.extraVolumes`                                    | Optionally specify extra list of additional volumes for the Supabase realtime pod(s)                                                                | `[]`                        |
| `realtime.extraVolumeMounts`                               | Optionally specify extra list of additional volumeMounts for the Supabase realtime container(s)                                                     | `[]`                        |
| `realtime.sidecars`                                        | Add additional sidecar containers to the Supabase realtime pod(s)                                                                                   | `[]`                        |
| `realtime.initContainers`                                  | Add additional init containers to the Supabase realtime pod(s)                                                                                      | `[]`                        |

### Supabase Realtime Traffic Exposure Parameters

| Name                                        | Description                                                                                  | Value       |
| ------------------------------------------- | -------------------------------------------------------------------------------------------- | ----------- |
| `realtime.service.type`                     | Supabase realtime service type                                                               | `ClusterIP` |
| `realtime.service.ports.http`               | Supabase realtime service HTTP port                                                          | `80`        |
| `realtime.service.nodePorts.http`           | Node port for HTTP                                                                           | `""`        |
| `realtime.service.clusterIP`                | Supabase realtime service Cluster IP                                                         | `""`        |
| `realtime.service.loadBalancerIP`           | Supabase realtime service Load Balancer IP                                                   | `""`        |
| `realtime.service.loadBalancerSourceRanges` | Supabase realtime service Load Balancer sources                                              | `[]`        |
| `realtime.service.externalTrafficPolicy`    | Supabase realtime service external traffic policy                                            | `Cluster`   |
| `realtime.service.annotations`              | Additional custom annotations for Supabase realtime service                                  | `{}`        |
| `realtime.service.extraPorts`               | Extra ports to expose in Supabase realtime service (normally used with the `sidecars` value) | `[]`        |
| `realtime.service.sessionAffinity`          | Control where realtime requests go, to the same pod or round-robin                           | `None`      |
| `realtime.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                  | `{}`        |

### Supabase Rest Parameters

| Name                                                   | Description                                                                                                                                          | Value                 |
| ------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| `rest.enabled`                                         | Enable Supabase rest                                                                                                                                 | `true`                |
| `rest.replicaCount`                                    | Number of Supabase rest replicas to deploy                                                                                                           | `1`                   |
| `rest.defaultConfig`                                   | Default configuration for the Supabase rest service                                                                                                  | `""`                  |
| `rest.extraConfig`                                     | Extra configuration for the Supabase rest service                                                                                                    | `{}`                  |
| `rest.existingConfigmap`                               | The name of an existing ConfigMap with the default configuration                                                                                     | `""`                  |
| `rest.extraConfigExistingConfigmap`                    | The name of an existing ConfigMap with extra configuration                                                                                           | `""`                  |
| `rest.image.registry`                                  | PostgREST image registry                                                                                                                             | `docker.io`           |
| `rest.image.repository`                                | PostgREST image repository                                                                                                                           | `bitnami/postgrest`   |
| `rest.image.tag`                                       | PostgREST image tag (immutable tags are recommended)                                                                                                 | `11.0.1-debian-11-r1` |
| `rest.image.digest`                                    | PostgREST image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                  |
| `rest.image.pullPolicy`                                | PostgREST image pull policy                                                                                                                          | `IfNotPresent`        |
| `rest.image.pullSecrets`                               | PostgREST image pull secrets                                                                                                                         | `[]`                  |
| `rest.containerPorts.http`                             | Supabase rest HTTP container port                                                                                                                    | `3000`                |
| `rest.livenessProbe.enabled`                           | Enable livenessProbe on Supabase rest containers                                                                                                     | `true`                |
| `rest.livenessProbe.initialDelaySeconds`               | Initial delay seconds for livenessProbe                                                                                                              | `5`                   |
| `rest.livenessProbe.periodSeconds`                     | Period seconds for livenessProbe                                                                                                                     | `10`                  |
| `rest.livenessProbe.timeoutSeconds`                    | Timeout seconds for livenessProbe                                                                                                                    | `5`                   |
| `rest.livenessProbe.failureThreshold`                  | Failure threshold for livenessProbe                                                                                                                  | `6`                   |
| `rest.livenessProbe.successThreshold`                  | Success threshold for livenessProbe                                                                                                                  | `1`                   |
| `rest.readinessProbe.enabled`                          | Enable readinessProbe on Supabase rest containers                                                                                                    | `true`                |
| `rest.readinessProbe.initialDelaySeconds`              | Initial delay seconds for readinessProbe                                                                                                             | `5`                   |
| `rest.readinessProbe.periodSeconds`                    | Period seconds for readinessProbe                                                                                                                    | `10`                  |
| `rest.readinessProbe.timeoutSeconds`                   | Timeout seconds for readinessProbe                                                                                                                   | `5`                   |
| `rest.readinessProbe.failureThreshold`                 | Failure threshold for readinessProbe                                                                                                                 | `6`                   |
| `rest.readinessProbe.successThreshold`                 | Success threshold for readinessProbe                                                                                                                 | `1`                   |
| `rest.startupProbe.enabled`                            | Enable startupProbe on Supabase rest containers                                                                                                      | `false`               |
| `rest.startupProbe.initialDelaySeconds`                | Initial delay seconds for startupProbe                                                                                                               | `5`                   |
| `rest.startupProbe.periodSeconds`                      | Period seconds for startupProbe                                                                                                                      | `10`                  |
| `rest.startupProbe.timeoutSeconds`                     | Timeout seconds for startupProbe                                                                                                                     | `5`                   |
| `rest.startupProbe.failureThreshold`                   | Failure threshold for startupProbe                                                                                                                   | `6`                   |
| `rest.startupProbe.successThreshold`                   | Success threshold for startupProbe                                                                                                                   | `1`                   |
| `rest.customLivenessProbe`                             | Custom livenessProbe that overrides the default one                                                                                                  | `{}`                  |
| `rest.customReadinessProbe`                            | Custom readinessProbe that overrides the default one                                                                                                 | `{}`                  |
| `rest.customStartupProbe`                              | Custom startupProbe that overrides the default one                                                                                                   | `{}`                  |
| `rest.resources.limits`                                | The resources limits for the Supabase rest containers                                                                                                | `{}`                  |
| `rest.resources.requests`                              | The requested resources for the Supabase rest containers                                                                                             | `{}`                  |
| `rest.podSecurityContext.enabled`                      | Enabled Supabase rest pods' Security Context                                                                                                         | `true`                |
| `rest.podSecurityContext.fsGroup`                      | Set Supabase rest pod's Security Context fsGroup                                                                                                     | `1001`                |
| `rest.containerSecurityContext.enabled`                | Enabled Supabase rest containers' Security Context                                                                                                   | `true`                |
| `rest.containerSecurityContext.runAsUser`              | Set Supabase rest containers' Security Context runAsUser                                                                                             | `1001`                |
| `rest.containerSecurityContext.runAsNonRoot`           | Set Supabase rest containers' Security Context runAsNonRoot                                                                                          | `true`                |
| `rest.containerSecurityContext.readOnlyRootFilesystem` | Set Supabase rest containers' Security Context runAsNonRoot                                                                                          | `false`               |
| `rest.command`                                         | Override default container command (useful when using custom images)                                                                                 | `[]`                  |
| `rest.args`                                            | Override default container args (useful when using custom images)                                                                                    | `[]`                  |
| `rest.hostAliases`                                     | Supabase rest pods host aliases                                                                                                                      | `[]`                  |
| `rest.podLabels`                                       | Extra labels for Supabase rest pods                                                                                                                  | `{}`                  |
| `rest.podAnnotations`                                  | Annotations for Supabase rest pods                                                                                                                   | `{}`                  |
| `rest.podAffinityPreset`                               | Pod affinity preset. Ignored if `rest.affinity` is set. Allowed values: `soft` or `hard`                                                             | `""`                  |
| `rest.podAntiAffinityPreset`                           | Pod anti-affinity preset. Ignored if `rest.affinity` is set. Allowed values: `soft` or `hard`                                                        | `soft`                |
| `rest.nodeAffinityPreset.type`                         | Node affinity preset type. Ignored if `rest.affinity` is set. Allowed values: `soft` or `hard`                                                       | `""`                  |
| `rest.nodeAffinityPreset.key`                          | Node label key to match. Ignored if `rest.affinity` is set                                                                                           | `""`                  |
| `rest.nodeAffinityPreset.values`                       | Node label values to match. Ignored if `rest.affinity` is set                                                                                        | `[]`                  |
| `rest.affinity`                                        | Affinity for Supabase rest pods assignment                                                                                                           | `{}`                  |
| `rest.nodeSelector`                                    | Node labels for Supabase rest pods assignment                                                                                                        | `{}`                  |
| `rest.tolerations`                                     | Tolerations for Supabase rest pods assignment                                                                                                        | `[]`                  |
| `rest.updateStrategy.type`                             | Supabase rest statefulset strategy type                                                                                                              | `RollingUpdate`       |
| `rest.priorityClassName`                               | Supabase rest pods' priorityClassName                                                                                                                | `""`                  |
| `rest.topologySpreadConstraints`                       | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template                             | `[]`                  |
| `rest.schedulerName`                                   | Name of the k8s scheduler (other than default) for Supabase rest pods                                                                                | `""`                  |
| `rest.terminationGracePeriodSeconds`                   | Seconds Redmine pod needs to terminate gracefully                                                                                                    | `""`                  |
| `rest.lifecycleHooks`                                  | for the Supabase rest container(s) to automate configuration before or after startup                                                                 | `{}`                  |
| `rest.extraEnvVars`                                    | Array with extra environment variables to add to Supabase rest nodes                                                                                 | `[]`                  |
| `rest.extraEnvVarsCM`                                  | Name of existing ConfigMap containing extra env vars for Supabase rest nodes                                                                         | `""`                  |
| `rest.extraEnvVarsSecret`                              | Name of existing Secret containing extra env vars for Supabase rest nodes                                                                            | `""`                  |
| `rest.extraVolumes`                                    | Optionally specify extra list of additional volumes for the Supabase rest pod(s)                                                                     | `[]`                  |
| `rest.extraVolumeMounts`                               | Optionally specify extra list of additional volumeMounts for the Supabase rest container(s)                                                          | `[]`                  |
| `rest.sidecars`                                        | Add additional sidecar containers to the Supabase rest pod(s)                                                                                        | `[]`                  |
| `rest.initContainers`                                  | Add additional init containers to the Supabase rest pod(s)                                                                                           | `[]`                  |

### Supabase Rest Traffic Exposure Parameters

| Name                                    | Description                                                                              | Value       |
| --------------------------------------- | ---------------------------------------------------------------------------------------- | ----------- |
| `rest.service.type`                     | Supabase rest service type                                                               | `ClusterIP` |
| `rest.service.ports.http`               | Supabase rest service HTTP port                                                          | `80`        |
| `rest.service.nodePorts.http`           | Node port for HTTP                                                                       | `""`        |
| `rest.service.clusterIP`                | Supabase rest service Cluster IP                                                         | `""`        |
| `rest.service.loadBalancerIP`           | Supabase rest service Load Balancer IP                                                   | `""`        |
| `rest.service.loadBalancerSourceRanges` | Supabase rest service Load Balancer sources                                              | `[]`        |
| `rest.service.externalTrafficPolicy`    | Supabase rest service external traffic policy                                            | `Cluster`   |
| `rest.service.annotations`              | Additional custom annotations for Supabase rest service                                  | `{}`        |
| `rest.service.extraPorts`               | Extra ports to expose in Supabase rest service (normally used with the `sidecars` value) | `[]`        |
| `rest.service.sessionAffinity`          | Control where rest requests go, to the same pod or round-robin                           | `None`      |
| `rest.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                              | `{}`        |

### Supabase Storage Parameters

| Name                                                      | Description                                                                                                                                        | Value                      |
| --------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- |
| `storage.enabled`                                         | Enable Supabase storage                                                                                                                            | `true`                     |
| `storage.replicaCount`                                    | Number of Supabase storage replicas to deploy                                                                                                      | `1`                        |
| `storage.defaultConfig`                                   | Default configuration for Supabase storage                                                                                                         | `""`                       |
| `storage.extraConfig`                                     | Extra configuration for Supabase storage                                                                                                           | `{}`                       |
| `storage.existingConfigmap`                               | The name of an existing ConfigMap with the default configuration                                                                                   | `""`                       |
| `storage.extraConfigExistingConfigmap`                    | The name of an existing ConfigMap with extra configuration                                                                                         | `""`                       |
| `storage.image.registry`                                  | Storage image registry                                                                                                                             | `docker.io`                |
| `storage.image.repository`                                | Storage image repository                                                                                                                           | `bitnami/supabase-storage` |
| `storage.image.tag`                                       | Storage image tag (immutable tags are recommended)                                                                                                 | `0.38.0-debian-11-r0`      |
| `storage.image.digest`                                    | Storage image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                       |
| `storage.image.pullPolicy`                                | Storage image pull policy                                                                                                                          | `IfNotPresent`             |
| `storage.image.pullSecrets`                               | Storage image pull secrets                                                                                                                         | `[]`                       |
| `storage.containerPorts.http`                             | Supabase storage HTTP container port                                                                                                               | `5000`                     |
| `storage.livenessProbe.enabled`                           | Enable livenessProbe on Supabase storage containers                                                                                                | `true`                     |
| `storage.livenessProbe.initialDelaySeconds`               | Initial delay seconds for livenessProbe                                                                                                            | `5`                        |
| `storage.livenessProbe.periodSeconds`                     | Period seconds for livenessProbe                                                                                                                   | `10`                       |
| `storage.livenessProbe.timeoutSeconds`                    | Timeout seconds for livenessProbe                                                                                                                  | `5`                        |
| `storage.livenessProbe.failureThreshold`                  | Failure threshold for livenessProbe                                                                                                                | `6`                        |
| `storage.livenessProbe.successThreshold`                  | Success threshold for livenessProbe                                                                                                                | `1`                        |
| `storage.readinessProbe.enabled`                          | Enable readinessProbe on Supabase storage containers                                                                                               | `true`                     |
| `storage.readinessProbe.initialDelaySeconds`              | Initial delay seconds for readinessProbe                                                                                                           | `5`                        |
| `storage.readinessProbe.periodSeconds`                    | Period seconds for readinessProbe                                                                                                                  | `10`                       |
| `storage.readinessProbe.timeoutSeconds`                   | Timeout seconds for readinessProbe                                                                                                                 | `5`                        |
| `storage.readinessProbe.failureThreshold`                 | Failure threshold for readinessProbe                                                                                                               | `6`                        |
| `storage.readinessProbe.successThreshold`                 | Success threshold for readinessProbe                                                                                                               | `1`                        |
| `storage.startupProbe.enabled`                            | Enable startupProbe on Supabase storage containers                                                                                                 | `false`                    |
| `storage.startupProbe.initialDelaySeconds`                | Initial delay seconds for startupProbe                                                                                                             | `5`                        |
| `storage.startupProbe.periodSeconds`                      | Period seconds for startupProbe                                                                                                                    | `10`                       |
| `storage.startupProbe.timeoutSeconds`                     | Timeout seconds for startupProbe                                                                                                                   | `5`                        |
| `storage.startupProbe.failureThreshold`                   | Failure threshold for startupProbe                                                                                                                 | `6`                        |
| `storage.startupProbe.successThreshold`                   | Success threshold for startupProbe                                                                                                                 | `1`                        |
| `storage.customLivenessProbe`                             | Custom livenessProbe that overrides the default one                                                                                                | `{}`                       |
| `storage.customReadinessProbe`                            | Custom readinessProbe that overrides the default one                                                                                               | `{}`                       |
| `storage.customStartupProbe`                              | Custom startupProbe that overrides the default one                                                                                                 | `{}`                       |
| `storage.resources.limits`                                | The resources limits for the Supabase storage containers                                                                                           | `{}`                       |
| `storage.resources.requests`                              | The requested resources for the Supabase storage containers                                                                                        | `{}`                       |
| `storage.podSecurityContext.enabled`                      | Enabled Supabase storage pods' Security Context                                                                                                    | `true`                     |
| `storage.podSecurityContext.fsGroup`                      | Set Supabase storage pod's Security Context fsGroup                                                                                                | `1001`                     |
| `storage.containerSecurityContext.enabled`                | Enabled Supabase storage containers' Security Context                                                                                              | `true`                     |
| `storage.containerSecurityContext.runAsUser`              | Set Supabase storage containers' Security Context runAsUser                                                                                        | `1001`                     |
| `storage.containerSecurityContext.runAsNonRoot`           | Set Supabase storage containers' Security Context runAsNonRoot                                                                                     | `true`                     |
| `storage.containerSecurityContext.readOnlyRootFilesystem` | Set Supabase storage containers' Security Context runAsNonRoot                                                                                     | `false`                    |
| `storage.command`                                         | Override default container command (useful when using custom images)                                                                               | `[]`                       |
| `storage.args`                                            | Override default container args (useful when using custom images)                                                                                  | `[]`                       |
| `storage.hostAliases`                                     | Supabase storage pods host aliases                                                                                                                 | `[]`                       |
| `storage.podLabels`                                       | Extra labels for Supabase storage pods                                                                                                             | `{}`                       |
| `storage.podAnnotations`                                  | Annotations for Supabase storage pods                                                                                                              | `{}`                       |
| `storage.podAffinityPreset`                               | Pod affinity preset. Ignored if `storage.affinity` is set. Allowed values: `soft` or `hard`                                                        | `""`                       |
| `storage.podAntiAffinityPreset`                           | Pod anti-affinity preset. Ignored if `storage.affinity` is set. Allowed values: `soft` or `hard`                                                   | `soft`                     |
| `storage.nodeAffinityPreset.type`                         | Node affinity preset type. Ignored if `storage.affinity` is set. Allowed values: `soft` or `hard`                                                  | `""`                       |
| `storage.nodeAffinityPreset.key`                          | Node label key to match. Ignored if `storage.affinity` is set                                                                                      | `""`                       |
| `storage.nodeAffinityPreset.values`                       | Node label values to match. Ignored if `storage.affinity` is set                                                                                   | `[]`                       |
| `storage.affinity`                                        | Affinity for Supabase storage pods assignment                                                                                                      | `{}`                       |
| `storage.nodeSelector`                                    | Node labels for Supabase storage pods assignment                                                                                                   | `{}`                       |
| `storage.tolerations`                                     | Tolerations for Supabase storage pods assignment                                                                                                   | `[]`                       |
| `storage.updateStrategy.type`                             | Supabase storage statefulset strategy type                                                                                                         | `RollingUpdate`            |
| `storage.priorityClassName`                               | Supabase storage pods' priorityClassName                                                                                                           | `""`                       |
| `storage.topologySpreadConstraints`                       | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template                           | `[]`                       |
| `storage.schedulerName`                                   | Name of the k8s scheduler (other than default) for Supabase storage pods                                                                           | `""`                       |
| `storage.terminationGracePeriodSeconds`                   | Seconds Redmine pod needs to terminate gracefully                                                                                                  | `""`                       |
| `storage.lifecycleHooks`                                  | for the Supabase storage container(s) to automate configuration before or after startup                                                            | `{}`                       |
| `storage.extraEnvVars`                                    | Array with extra environment variables to add to Supabase storage nodes                                                                            | `[]`                       |
| `storage.extraEnvVarsCM`                                  | Name of existing ConfigMap containing extra env vars for Supabase storage nodes                                                                    | `""`                       |
| `storage.extraEnvVarsSecret`                              | Name of existing Secret containing extra env vars for Supabase storage nodes                                                                       | `""`                       |
| `storage.extraVolumes`                                    | Optionally specify extra list of additional volumes for the Supabase storage pod(s)                                                                | `[]`                       |
| `storage.extraVolumeMounts`                               | Optionally specify extra list of additional volumeMounts for the Supabase storage container(s)                                                     | `[]`                       |
| `storage.sidecars`                                        | Add additional sidecar containers to the Supabase storage pod(s)                                                                                   | `[]`                       |
| `storage.initContainers`                                  | Add additional init containers to the Supabase storage pod(s)                                                                                      | `[]`                       |

### Supabase Storage Traffic Exposure Parameters

| Name                                       | Description                                                                                 | Value       |
| ------------------------------------------ | ------------------------------------------------------------------------------------------- | ----------- |
| `storage.service.type`                     | Supabase storage service type                                                               | `ClusterIP` |
| `storage.service.ports.http`               | Supabase storage service HTTP port                                                          | `80`        |
| `storage.service.nodePorts.http`           | Node port for HTTP                                                                          | `""`        |
| `storage.service.clusterIP`                | Supabase storage service Cluster IP                                                         | `""`        |
| `storage.service.loadBalancerIP`           | Supabase storage service Load Balancer IP                                                   | `""`        |
| `storage.service.loadBalancerSourceRanges` | Supabase storage service Load Balancer sources                                              | `[]`        |
| `storage.service.externalTrafficPolicy`    | Supabase storage service external traffic policy                                            | `Cluster`   |
| `storage.service.annotations`              | Additional custom annotations for Supabase storage service                                  | `{}`        |
| `storage.service.extraPorts`               | Extra ports to expose in Supabase storage service (normally used with the `sidecars` value) | `[]`        |
| `storage.service.sessionAffinity`          | Control where storage requests go, to the same pod or round-robin                           | `None`      |
| `storage.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                 | `{}`        |

### Storage Persistence Parameters

| Name                                | Description                                                                                             | Value                       |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------- | --------------------------- |
| `storage.persistence.enabled`       | Enable persistence using Persistent Volume Claims                                                       | `true`                      |
| `storage.persistence.mountPath`     | Path to mount the volume at.                                                                            | `/bitnami/supabase-storage` |
| `storage.persistence.subPath`       | The subdirectory of the volume to mount to, useful in dev environments and one PV for multiple services | `""`                        |
| `storage.persistence.storageClass`  | Storage class of backing PVC                                                                            | `""`                        |
| `storage.persistence.annotations`   | Persistent Volume Claim annotations                                                                     | `{}`                        |
| `storage.persistence.accessModes`   | Persistent Volume Access Modes                                                                          | `["ReadWriteOnce"]`         |
| `storage.persistence.size`          | Size of data volume                                                                                     | `8Gi`                       |
| `storage.persistence.existingClaim` | The name of an existing PVC to use for persistence                                                      | `""`                        |
| `storage.persistence.selector`      | Selector to match an existing Persistent Volume for WordPress data PVC                                  | `{}`                        |
| `storage.persistence.dataSource`    | Custom PVC data source                                                                                  | `{}`                        |

### Supabase Studio Parameters

| Name                                                     | Description                                                                                                                                       | Value                     |
| -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| `studio.enabled`                                         | Enable Supabase studio                                                                                                                            | `true`                    |
| `studio.publicURL`                                       | Supabase studio public URL                                                                                                                        | `""`                      |
| `studio.replicaCount`                                    | Number of Supabase studio replicas to deploy                                                                                                      | `1`                       |
| `studio.defaultConfig`                                   | Supabase studio default configuration                                                                                                             | `""`                      |
| `studio.extraConfig`                                     | Supabase studio extra configuration                                                                                                               | `{}`                      |
| `studio.existingConfigmap`                               | The name of an existing ConfigMap with the default configuration                                                                                  | `""`                      |
| `studio.extraConfigExistingConfigmap`                    | The name of an existing ConfigMap with extra configuration                                                                                        | `""`                      |
| `studio.image.registry`                                  | Studio image registry                                                                                                                             | `docker.io`               |
| `studio.image.repository`                                | Studio image repository                                                                                                                           | `bitnami/supabase-studio` |
| `studio.image.tag`                                       | Studio image tag (immutable tags are recommended)                                                                                                 | `0.23.4-debian-11-r5`     |
| `studio.image.digest`                                    | Studio image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag image tag (immutable tags are recommended) | `""`                      |
| `studio.image.pullPolicy`                                | Studio image pull policy                                                                                                                          | `IfNotPresent`            |
| `studio.image.pullSecrets`                               | Studio image pull secrets                                                                                                                         | `[]`                      |
| `studio.containerPorts.http`                             | Supabase studio HTTP container port                                                                                                               | `3000`                    |
| `studio.livenessProbe.enabled`                           | Enable livenessProbe on Supabase studio containers                                                                                                | `true`                    |
| `studio.livenessProbe.initialDelaySeconds`               | Initial delay seconds for livenessProbe                                                                                                           | `5`                       |
| `studio.livenessProbe.periodSeconds`                     | Period seconds for livenessProbe                                                                                                                  | `10`                      |
| `studio.livenessProbe.timeoutSeconds`                    | Timeout seconds for livenessProbe                                                                                                                 | `5`                       |
| `studio.livenessProbe.failureThreshold`                  | Failure threshold for livenessProbe                                                                                                               | `6`                       |
| `studio.livenessProbe.successThreshold`                  | Success threshold for livenessProbe                                                                                                               | `1`                       |
| `studio.readinessProbe.enabled`                          | Enable readinessProbe on Supabase studio containers                                                                                               | `true`                    |
| `studio.readinessProbe.initialDelaySeconds`              | Initial delay seconds for readinessProbe                                                                                                          | `5`                       |
| `studio.readinessProbe.periodSeconds`                    | Period seconds for readinessProbe                                                                                                                 | `10`                      |
| `studio.readinessProbe.timeoutSeconds`                   | Timeout seconds for readinessProbe                                                                                                                | `5`                       |
| `studio.readinessProbe.failureThreshold`                 | Failure threshold for readinessProbe                                                                                                              | `6`                       |
| `studio.readinessProbe.successThreshold`                 | Success threshold for readinessProbe                                                                                                              | `1`                       |
| `studio.startupProbe.enabled`                            | Enable startupProbe on Supabase studio containers                                                                                                 | `false`                   |
| `studio.startupProbe.initialDelaySeconds`                | Initial delay seconds for startupProbe                                                                                                            | `5`                       |
| `studio.startupProbe.periodSeconds`                      | Period seconds for startupProbe                                                                                                                   | `10`                      |
| `studio.startupProbe.timeoutSeconds`                     | Timeout seconds for startupProbe                                                                                                                  | `5`                       |
| `studio.startupProbe.failureThreshold`                   | Failure threshold for startupProbe                                                                                                                | `6`                       |
| `studio.startupProbe.successThreshold`                   | Success threshold for startupProbe                                                                                                                | `1`                       |
| `studio.customLivenessProbe`                             | Custom livenessProbe that overrides the default one                                                                                               | `{}`                      |
| `studio.customReadinessProbe`                            | Custom readinessProbe that overrides the default one                                                                                              | `{}`                      |
| `studio.customStartupProbe`                              | Custom startupProbe that overrides the default one                                                                                                | `{}`                      |
| `studio.resources.limits`                                | The resources limits for the Supabase studio containers                                                                                           | `{}`                      |
| `studio.resources.requests`                              | The requested resources for the Supabase studio containers                                                                                        | `{}`                      |
| `studio.podSecurityContext.enabled`                      | Enabled Supabase studio pods' Security Context                                                                                                    | `true`                    |
| `studio.podSecurityContext.fsGroup`                      | Set Supabase studio pod's Security Context fsGroup                                                                                                | `1001`                    |
| `studio.containerSecurityContext.enabled`                | Enabled Supabase studio containers' Security Context                                                                                              | `true`                    |
| `studio.containerSecurityContext.runAsUser`              | Set Supabase studio containers' Security Context runAsUser                                                                                        | `1001`                    |
| `studio.containerSecurityContext.runAsNonRoot`           | Set Supabase studio containers' Security Context runAsNonRoot                                                                                     | `true`                    |
| `studio.containerSecurityContext.readOnlyRootFilesystem` | Set Supabase studio containers' Security Context runAsNonRoot                                                                                     | `false`                   |
| `studio.command`                                         | Override default container command (useful when using custom images)                                                                              | `[]`                      |
| `studio.args`                                            | Override default container args (useful when using custom images)                                                                                 | `[]`                      |
| `studio.hostAliases`                                     | Supabase studio pods host aliases                                                                                                                 | `[]`                      |
| `studio.podLabels`                                       | Extra labels for Supabase studio pods                                                                                                             | `{}`                      |
| `studio.podAnnotations`                                  | Annotations for Supabase studio pods                                                                                                              | `{}`                      |
| `studio.podAffinityPreset`                               | Pod affinity preset. Ignored if `studio.affinity` is set. Allowed values: `soft` or `hard`                                                        | `""`                      |
| `studio.podAntiAffinityPreset`                           | Pod anti-affinity preset. Ignored if `studio.affinity` is set. Allowed values: `soft` or `hard`                                                   | `soft`                    |
| `studio.nodeAffinityPreset.type`                         | Node affinity preset type. Ignored if `studio.affinity` is set. Allowed values: `soft` or `hard`                                                  | `""`                      |
| `studio.nodeAffinityPreset.key`                          | Node label key to match. Ignored if `studio.affinity` is set                                                                                      | `""`                      |
| `studio.nodeAffinityPreset.values`                       | Node label values to match. Ignored if `studio.affinity` is set                                                                                   | `[]`                      |
| `studio.affinity`                                        | Affinity for Supabase studio pods assignment                                                                                                      | `{}`                      |
| `studio.nodeSelector`                                    | Node labels for Supabase studio pods assignment                                                                                                   | `{}`                      |
| `studio.tolerations`                                     | Tolerations for Supabase studio pods assignment                                                                                                   | `[]`                      |
| `studio.updateStrategy.type`                             | Supabase studio statefulset strategy type                                                                                                         | `RollingUpdate`           |
| `studio.priorityClassName`                               | Supabase studio pods' priorityClassName                                                                                                           | `""`                      |
| `studio.topologySpreadConstraints`                       | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template                          | `[]`                      |
| `studio.schedulerName`                                   | Name of the k8s scheduler (other than default) for Supabase studio pods                                                                           | `""`                      |
| `studio.terminationGracePeriodSeconds`                   | Seconds Redmine pod needs to terminate gracefully                                                                                                 | `""`                      |
| `studio.lifecycleHooks`                                  | for the Supabase studio container(s) to automate configuration before or after startup                                                            | `{}`                      |
| `studio.extraEnvVars`                                    | Array with extra environment variables to add to Supabase studio nodes                                                                            | `[]`                      |
| `studio.extraEnvVarsCM`                                  | Name of existing ConfigMap containing extra env vars for Supabase studio nodes                                                                    | `""`                      |
| `studio.extraEnvVarsSecret`                              | Name of existing Secret containing extra env vars for Supabase studio nodes                                                                       | `""`                      |
| `studio.extraVolumes`                                    | Optionally specify extra list of additional volumes for the Supabase studio pod(s)                                                                | `[]`                      |
| `studio.extraVolumeMounts`                               | Optionally specify extra list of additional volumeMounts for the Supabase studio container(s)                                                     | `[]`                      |
| `studio.sidecars`                                        | Add additional sidecar containers to the Supabase studio pod(s)                                                                                   | `[]`                      |
| `studio.initContainers`                                  | Add additional init containers to the Supabase studio pod(s)                                                                                      | `[]`                      |

### Supabase Studio Traffic Exposure Parameters

| Name                                      | Description                                                                                                                      | Value                    |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `studio.service.type`                     | Supabase studio service type                                                                                                     | `ClusterIP`              |
| `studio.service.ports.http`               | Supabase studio service HTTP port                                                                                                | `80`                     |
| `studio.service.nodePorts.http`           | Node port for HTTP                                                                                                               | `""`                     |
| `studio.service.clusterIP`                | Supabase studio service Cluster IP                                                                                               | `""`                     |
| `studio.service.loadBalancerIP`           | Supabase studio service Load Balancer IP                                                                                         | `""`                     |
| `studio.service.loadBalancerSourceRanges` | Supabase studio service Load Balancer sources                                                                                    | `[]`                     |
| `studio.service.externalTrafficPolicy`    | Supabase studio service external traffic policy                                                                                  | `Cluster`                |
| `studio.service.annotations`              | Additional custom annotations for Supabase studio service                                                                        | `{}`                     |
| `studio.service.extraPorts`               | Extra ports to expose in Supabase studio service (normally used with the `sidecars` value)                                       | `[]`                     |
| `studio.service.sessionAffinity`          | Control where studio requests go, to the same pod or round-robin                                                                 | `None`                   |
| `studio.service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                                                                      | `{}`                     |
| `studio.ingress.enabled`                  | Enable ingress record generation for Supabase                                                                                    | `false`                  |
| `studio.ingress.pathType`                 | Ingress path type                                                                                                                | `ImplementationSpecific` |
| `studio.ingress.hostname`                 | Default host for the ingress record                                                                                              | `supabase-studio.local`  |
| `studio.ingress.ingressClassName`         | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                     |
| `studio.ingress.path`                     | Default path for the ingress record                                                                                              | `/`                      |
| `studio.ingress.annotations`              | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                     |
| `studio.ingress.tls`                      | Enable TLS configuration for the host defined at `studio.ingress.hostname` parameter                                             | `false`                  |
| `studio.ingress.selfSigned`               | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                     | `false`                  |
| `studio.ingress.extraHosts`               | An array with additional hostname(s) to be covered with the ingress record                                                       | `[]`                     |
| `studio.ingress.extraPaths`               | An array with additional arbitrary paths that may need to be added to the ingress under the main host                            | `[]`                     |
| `studio.ingress.extraTls`                 | TLS configuration for additional hostname(s) to be covered with this ingress record                                              | `[]`                     |
| `studio.ingress.secrets`                  | Custom TLS certificates as secrets                                                                                               | `[]`                     |
| `studio.ingress.extraRules`               | Additional rules to be covered with this ingress record                                                                          | `[]`                     |

### Init Container Parameters

| Name                                                   | Description                                                                                     | Value                       |
| ------------------------------------------------------ | ----------------------------------------------------------------------------------------------- | --------------------------- |
| `volumePermissions.enabled`                            | Enable init container that changes the owner/group of the PV mount point to `runAsUser:fsGroup` | `false`                     |
| `volumePermissions.image.registry`                     | Bitnami Shell image registry                                                                    | `docker.io`                 |
| `volumePermissions.image.repository`                   | Bitnami Shell image repository                                                                  | `bitnami/bitnami-shell`     |
| `volumePermissions.image.tag`                          | Bitnami Shell image tag (immutable tags are recommended)                                        | `11-debian-11-r118`         |
| `volumePermissions.image.pullPolicy`                   | Bitnami Shell image pull policy                                                                 | `IfNotPresent`              |
| `volumePermissions.image.pullSecrets`                  | Bitnami Shell image pull secrets                                                                | `[]`                        |
| `volumePermissions.resources.limits`                   | The resources limits for the init container                                                     | `{}`                        |
| `volumePermissions.resources.requests`                 | The requested resources for the init container                                                  | `{}`                        |
| `volumePermissions.containerSecurityContext.runAsUser` | Set init container's Security Context runAsUser                                                 | `0`                         |
| `psqlImage.registry`                                   | PostgreSQL client image registry                                                                | `docker.io`                 |
| `psqlImage.repository`                                 | PostgreSQL client image repository                                                              | `bitnami/supabase-postgres` |
| `psqlImage.digest`                                     | PostgreSQL client image digest (overrides image tag)                                            | `""`                        |
| `psqlImage.tag`                                        | PostgreSQL client image tag (immutable tags are recommended)                                    | `15.1.0-debian-11-r41`      |
| `psqlImage.pullPolicy`                                 | PostgreSQL client image pull policy                                                             | `IfNotPresent`              |
| `psqlImage.pullSecrets`                                | PostgreSQL client image pull secrets                                                            | `[]`                        |
| `psqlImage.debug`                                      | Enable PostgreSQL client image debug mode                                                       | `false`                     |

### Other Parameters

| Name                                          | Description                                                      | Value  |
| --------------------------------------------- | ---------------------------------------------------------------- | ------ |
| `rbac.create`                                 | Specifies whether RBAC resources should be created               | `true` |
| `serviceAccount.create`                       | Specifies whether a ServiceAccount should be created             | `true` |
| `serviceAccount.name`                         | The name of the ServiceAccount to use.                           | `""`   |
| `serviceAccount.annotations`                  | Additional Service Account annotations (evaluated as a template) | `{}`   |
| `serviceAccount.automountServiceAccountToken` | Automount service account token for the server service account   | `true` |

### Kong sub-chart parameters

| Name                             | Description                                                                    | Value            |
| -------------------------------- | ------------------------------------------------------------------------------ | ---------------- |
| `kong.enabled`                   | Enable Kong                                                                    | `true`           |
| `kong.database`                  | Database to use                                                                | `off`            |
| `kong.initContainers`            | Add additional init containers to the Kong pods                                | `""`             |
| `kong.ingressController.enabled` | Enable Kong Ingress Controller                                                 | `false`          |
| `kong.kong.extraVolumeMounts`    | Additional volumeMounts to the Kong container                                  | `[]`             |
| `kong.kong.extraEnvVars`         | Additional environment variables to set                                        | `[]`             |
| `kong.extraVolumes`              | Additional volumes to the Kong pods                                            | `[]`             |
| `kong.ingress.enabled`           | Enable Ingress rule                                                            | `false`          |
| `kong.ingress.hostname`          | Kong Ingress hostname                                                          | `supabase.local` |
| `kong.ingress.tls`               | Enable TLS for Kong Ingress                                                    | `false`          |
| `kong.service.loadBalancerIP`    | Kubernetes service LoadBalancer IP                                             | `""`             |
| `kong.service.type`              | Kubernetes service type                                                        | `LoadBalancer`   |
| `kong.service.ports.proxyHttp`   | Kong service port                                                              | `80`             |
| `kong.postgresql.enabled`        | Switch to enable or disable the PostgreSQL helm chart inside the Kong subchart | `false`          |

### PostgreSQL sub-chart parameters

| Name                                          | Description                                                                                                | Value                                                                                                                        |
| --------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `postgresql.enabled`                          | Switch to enable or disable the PostgreSQL helm chart                                                      | `true`                                                                                                                       |
| `postgresql.auth.existingSecret`              | Name of existing secret to use for PostgreSQL credentials                                                  | `""`                                                                                                                         |
| `postgresql.architecture`                     | PostgreSQL architecture (`standalone` or `replication`)                                                    | `standalone`                                                                                                                 |
| `postgresql.service.ports.postgresql`         | PostgreSQL service port                                                                                    | `5432`                                                                                                                       |
| `postgresql.image.registry`                   | PostgreSQL image registry                                                                                  | `docker.io`                                                                                                                  |
| `postgresql.image.repository`                 | PostgreSQL image repository                                                                                | `bitnami/supabase-postgres`                                                                                                  |
| `postgresql.image.tag`                        | PostgreSQL image tag (immutable tags are recommended)                                                      | `15.1.0-debian-11-r41`                                                                                                       |
| `postgresql.image.digest`                     | PostgreSQL image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                                                                                                                         |
| `postgresql.image.pullPolicy`                 | PostgreSQL image pull policy                                                                               | `IfNotPresent`                                                                                                               |
| `postgresql.image.pullSecrets`                | Specify image pull secrets                                                                                 | `[]`                                                                                                                         |
| `postgresql.image.debug`                      | Specify if debug values should be set                                                                      | `false`                                                                                                                      |
| `postgresql.postgresqlSharedPreloadLibraries` | Set the shared_preload_libraries parameter in postgresql.conf                                              | `pg_stat_statements, pg_stat_monitor, pgaudit, plpgsql, plpgsql_check, pg_cron, pg_net, pgsodium, timescaledb, auto_explain` |
| `postgresql.auth.postgresPassword`            | PostgreSQL admin password                                                                                  | `""`                                                                                                                         |
| `postgresql.auth.existingSecret`              | Name of existing secret to use for PostgreSQL credentials                                                  | `""`                                                                                                                         |
| `postgresql.architecture`                     | PostgreSQL architecture (`standalone` or `replication`)                                                    | `standalone`                                                                                                                 |
| `postgresql.service.ports.postgresql`         | PostgreSQL service port                                                                                    | `5432`                                                                                                                       |
| `externalDatabase.host`                       | Database host                                                                                              | `""`                                                                                                                         |
| `externalDatabase.port`                       | Database port number                                                                                       | `5432`                                                                                                                       |
| `externalDatabase.user`                       | Non-root username for PostgreSQL                                                                           | `supabase_admin`                                                                                                             |
| `externalDatabase.password`                   | Password for the non-root username for PostgreSQL                                                          | `""`                                                                                                                         |
| `externalDatabase.database`                   | PostgreSQL database name                                                                                   | `postgres`                                                                                                                   |
| `externalDatabase.existingSecret`             | Name of an existing secret resource containing the database credentials                                    | `""`                                                                                                                         |
| `externalDatabase.existingSecretPasswordKey`  | Name of an existing secret key containing the database credentials                                         | `db-password`                                                                                                                |

The above parameters map to the env variables defined in [bitnami/supabase-studio](https://github.com/bitnami/containers/tree/main/bitnami/supabase-studio). For more information please refer to the [bitnami/supabase-studio](https://github.com/bitnami/containers/tree/main/bitnami/supabase-studio) image documentation.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install my-release \
  --set postgresql.auth.postgresPassword=secretpassword \
    oci://registry-1.docker.io/bitnamicharts/supabase
```

The above command sets the PostgreSQL `postgres` user password to `secretpassword`.

> NOTE: Once this chart is deployed, it is not possible to change the application's access credentials, such as usernames or passwords, using Helm. To change these application credentials after deployment, delete any persistent volumes (PVs) used by the chart and re-deploy it, or use the application's built-in administrative tools if available.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/supabase
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### External database support

You may want to have supabase connect to an external database rather than installing one inside your cluster. Typical reasons for this are to use a managed database service, or to share a common database server for all your applications. To achieve this, the chart allows you to specify credentials for an external database with the [`externalDatabase` parameter](#parameters). You should also disable the PostgreSQL installation with the `postgresql.enabled` option. Here is an example:

```console
postgresql.enabled=false
externalDatabase.host=myexternalhost
externalDatabase.user=myuser
externalDatabase.password=mypassword
externalDatabase.database=mydatabase
externalDatabase.port=5432
```

### Ingress

This chart provides support for Ingress resources. If you have an ingress controller installed on your cluster, such as [nginx-ingress-controller](https://github.com/bitnami/charts/tree/main/bitnami/nginx-ingress-controller) or [contour](https://github.com/bitnami/charts/tree/main/bitnami/contour) you can utilize the ingress controller to serve your application.

To enable Ingress integration, set `studio.ingress.enabled` to `true`. The `studio.ingress.hostname` property can be used to set the host name. The `studio.ingress.tls` parameter can be used to add the TLS configuration for this host. It is also possible to have more than one host, with a separate TLS configuration for each host. [Learn more about configuring and using Ingress](https://docs.bitnami.com/kubernetes/infrastructure/supabase/configuration/configure-ingress/).

### TLS secrets

The chart also facilitates the creation of TLS secrets for use with the Ingress controller, with different options for certificate management. [Learn more about TLS secrets](https://docs.bitnami.com/kubernetes/infrastructure/supabase/administration/enable-tls-ingress/).

## Persistence

The chart mounts a [Persistent Volume](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) volume at `/bitnami/supabase-storage`. The volume is created using dynamic volume provisioning, by default. An existing PersistentVolumeClaim can also be defined.

If you encounter errors when working with persistent volumes, refer to our [troubleshooting guide for persistent volumes](https://docs.bitnami.com/kubernetes/faq/troubleshooting/troubleshooting-persistence-volumes/).

### Additional environment variables

In case you want to add extra environment variables (useful for advanced operations like custom init scripts), you can use the `extraEnvVars` property inside the different component sections.

```yaml
rest:
  extraEnvVars:
    - name: LOG_LEVEL
      value: error
```

Alternatively, you can use a ConfigMap or a Secret with the environment variables. To do so, use the `extraEnvVarsCM` or the `extraEnvVarsSecret` values inside the specific component sections.

### Sidecars

If additional containers are needed in the same pod as supabase (such as additional metrics or logging exporters), they can be defined using the `sidecars` parameter inside the component specific sections. If these sidecars export extra ports, extra port definitions can be added using the `service.extraPorts` parameter. [Learn more about configuring and using sidecar containers](https://docs.bitnami.com/kubernetes/infrastructure/supabase/administration/configure-use-sidecars/).

### Pod affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, use one of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters inside the specific component sections.

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
