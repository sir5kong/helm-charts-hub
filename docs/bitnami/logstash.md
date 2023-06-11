<!--- app-name: Logstash -->

# Logstash packaged by Bitnami

Logstash is an open source data processing engine. It ingests data from multiple sources, processes it, and sends the output to final destination in real-time. It is a core component of the ELK stack.

[Overview of Logstash](http://logstash.net)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/logstash
```

## Introduction

This chart bootstraps a [logstash](https://github.com/bitnami/containers/tree/main/bitnami/logstash) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.dev/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/logstash
```

These commands deploy logstash on the Kubernetes cluster in the default configuration. The [configuration](#configuration-and-installation-details) section lists the parameters that can be configured during installation.

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

| Name                     | Description                                                                              | Value           |
| ------------------------ | ---------------------------------------------------------------------------------------- | --------------- |
| `kubeVersion`            | Force target Kubernetes version (using Helm capabilities if not set)                     | `""`            |
| `nameOverride`           | String to partially override logstash.fullname template (will maintain the release name) | `""`            |
| `fullnameOverride`       | String to fully override logstash.fullname template                                      | `""`            |
| `clusterDomain`          | Default Kubernetes cluster domain                                                        | `cluster.local` |
| `commonAnnotations`      | Annotations to add to all deployed objects                                               | `{}`            |
| `commonLabels`           | Labels to add to all deployed objects                                                    | `{}`            |
| `extraDeploy`            | Array of extra objects to deploy with the release (evaluated as a template).             | `[]`            |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden)  | `false`         |
| `diagnosticMode.command` | Command to override all containers in the deployment                                     | `["sleep"]`     |
| `diagnosticMode.args`    | Args to override all containers in the deployment                                        | `["infinity"]`  |

### Logstash parameters

| Name                                          | Description                                                                                                                       | Value                    |
| --------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| `image.registry`                              | Logstash image registry                                                                                                           | `docker.io`              |
| `image.repository`                            | Logstash image repository                                                                                                         | `bitnami/logstash`       |
| `image.tag`                                   | Logstash image tag (immutable tags are recommended)                                                                               | `8.8.1-debian-11-r0`     |
| `image.digest`                                | Logstash image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag                          | `""`                     |
| `image.pullPolicy`                            | Logstash image pull policy                                                                                                        | `IfNotPresent`           |
| `image.pullSecrets`                           | Specify docker-registry secret names as an array                                                                                  | `[]`                     |
| `image.debug`                                 | Specify if debug logs should be enabled                                                                                           | `false`                  |
| `hostAliases`                                 | Add deployment host aliases                                                                                                       | `[]`                     |
| `configFileName`                              | Logstash configuration file name. It must match the name of the configuration file mounted as a configmap.                        | `logstash.conf`          |
| `enableMonitoringAPI`                         | Whether to enable the Logstash Monitoring API or not  Kubernetes cluster domain                                                   | `true`                   |
| `monitoringAPIPort`                           | Logstash Monitoring API Port                                                                                                      | `9600`                   |
| `extraEnvVars`                                | Array containing extra env vars to configure Logstash                                                                             | `[]`                     |
| `extraEnvVarsSecret`                          | To add secrets to environment                                                                                                     | `""`                     |
| `extraEnvVarsCM`                              | To add configmaps to environment                                                                                                  | `""`                     |
| `input`                                       | Input Plugins configuration                                                                                                       | `""`                     |
| `filter`                                      | Filter Plugins configuration                                                                                                      | `""`                     |
| `output`                                      | Output Plugins configuration                                                                                                      | `""`                     |
| `existingConfiguration`                       | Name of existing ConfigMap object with the Logstash configuration (`input`, `filter`, and `output` will be ignored).              | `""`                     |
| `enableMultiplePipelines`                     | Allows user to use multiple pipelines                                                                                             | `false`                  |
| `extraVolumes`                                | Array to add extra volumes (evaluated as a template)                                                                              | `[]`                     |
| `extraVolumeMounts`                           | Array to add extra mounts (normally used with extraVolumes, evaluated as a template)                                              | `[]`                     |
| `serviceAccount.create`                       | Enable creation of ServiceAccount for Logstash pods                                                                               | `true`                   |
| `serviceAccount.name`                         | The name of the service account to use. If not set and `create` is `true`, a name is generated                                    | `""`                     |
| `serviceAccount.automountServiceAccountToken` | Allows automount of ServiceAccountToken on the serviceAccount created                                                             | `true`                   |
| `serviceAccount.annotations`                  | Additional custom annotations for the ServiceAccount                                                                              | `{}`                     |
| `containerPorts`                              | Array containing the ports to open in the Logstash container (evaluated as a template)                                            | `[]`                     |
| `initContainers`                              | Add additional init containers to the Logstash pod(s)                                                                             | `[]`                     |
| `sidecars`                                    | Add additional sidecar containers to the Logstash pod(s)                                                                          | `[]`                     |
| `replicaCount`                                | Number of Logstash replicas to deploy                                                                                             | `1`                      |
| `updateStrategy.type`                         | Update strategy type (`RollingUpdate`, or `OnDelete`)                                                                             | `RollingUpdate`          |
| `podManagementPolicy`                         | Pod management policy                                                                                                             | `OrderedReady`           |
| `podAnnotations`                              | Pod annotations                                                                                                                   | `{}`                     |
| `podLabels`                                   | Extra labels for Logstash pods                                                                                                    | `{}`                     |
| `podAffinityPreset`                           | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                               | `""`                     |
| `podAntiAffinityPreset`                       | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                          | `soft`                   |
| `nodeAffinityPreset.type`                     | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                         | `""`                     |
| `nodeAffinityPreset.key`                      | Node label key to match. Ignored if `affinity` is set.                                                                            | `""`                     |
| `nodeAffinityPreset.values`                   | Node label values to match. Ignored if `affinity` is set.                                                                         | `[]`                     |
| `affinity`                                    | Affinity for pod assignment                                                                                                       | `{}`                     |
| `nodeSelector`                                | Node labels for pod assignment                                                                                                    | `{}`                     |
| `tolerations`                                 | Tolerations for pod assignment                                                                                                    | `[]`                     |
| `priorityClassName`                           | Pod priority                                                                                                                      | `""`                     |
| `schedulerName`                               | Name of the k8s scheduler (other than default)                                                                                    | `""`                     |
| `terminationGracePeriodSeconds`               | In seconds, time the given to the Logstash pod needs to terminate gracefully                                                      | `""`                     |
| `topologySpreadConstraints`                   | Topology Spread Constraints for pod assignment                                                                                    | `[]`                     |
| `podSecurityContext.enabled`                  | Enabled Logstash pods' Security Context                                                                                           | `true`                   |
| `podSecurityContext.fsGroup`                  | Set Logstash pod's Security Context fsGroup                                                                                       | `1001`                   |
| `containerSecurityContext.enabled`            | Enabled Logstash containers' Security Context                                                                                     | `true`                   |
| `containerSecurityContext.runAsUser`          | Set Logstash containers' Security Context runAsUser                                                                               | `1001`                   |
| `containerSecurityContext.runAsNonRoot`       | Set Logstash container's Security Context runAsNonRoot                                                                            | `true`                   |
| `command`                                     | Override default container command (useful when using custom images)                                                              | `[]`                     |
| `args`                                        | Override default container args (useful when using custom images)                                                                 | `[]`                     |
| `lifecycleHooks`                              | for the Logstash container(s) to automate configuration before or after startup                                                   | `{}`                     |
| `resources.limits`                            | The resources limits for the Logstash container                                                                                   | `{}`                     |
| `resources.requests`                          | The requested resources for the Logstash container                                                                                | `{}`                     |
| `startupProbe.enabled`                        | Enable startupProbe                                                                                                               | `false`                  |
| `startupProbe.initialDelaySeconds`            | Initial delay seconds for startupProbe                                                                                            | `60`                     |
| `startupProbe.periodSeconds`                  | Period seconds for startupProbe                                                                                                   | `10`                     |
| `startupProbe.timeoutSeconds`                 | Timeout seconds for startupProbe                                                                                                  | `5`                      |
| `startupProbe.failureThreshold`               | Failure threshold for startupProbe                                                                                                | `6`                      |
| `startupProbe.successThreshold`               | Success threshold for startupProbe                                                                                                | `1`                      |
| `livenessProbe.enabled`                       | Enable livenessProbe                                                                                                              | `true`                   |
| `livenessProbe.initialDelaySeconds`           | Initial delay seconds for livenessProbe                                                                                           | `60`                     |
| `livenessProbe.periodSeconds`                 | Period seconds for livenessProbe                                                                                                  | `10`                     |
| `livenessProbe.timeoutSeconds`                | Timeout seconds for livenessProbe                                                                                                 | `5`                      |
| `livenessProbe.failureThreshold`              | Failure threshold for livenessProbe                                                                                               | `6`                      |
| `livenessProbe.successThreshold`              | Success threshold for livenessProbe                                                                                               | `1`                      |
| `readinessProbe.enabled`                      | Enable readinessProbe                                                                                                             | `true`                   |
| `readinessProbe.initialDelaySeconds`          | Initial delay seconds for readinessProbe                                                                                          | `60`                     |
| `readinessProbe.periodSeconds`                | Period seconds for readinessProbe                                                                                                 | `10`                     |
| `readinessProbe.timeoutSeconds`               | Timeout seconds for readinessProbe                                                                                                | `5`                      |
| `readinessProbe.failureThreshold`             | Failure threshold for readinessProbe                                                                                              | `6`                      |
| `readinessProbe.successThreshold`             | Success threshold for readinessProbe                                                                                              | `1`                      |
| `customStartupProbe`                          | Custom startup probe for the Web component                                                                                        | `{}`                     |
| `customLivenessProbe`                         | Custom liveness probe for the Web component                                                                                       | `{}`                     |
| `customReadinessProbe`                        | Custom readiness probe for the Web component                                                                                      | `{}`                     |
| `service.type`                                | Kubernetes service type (`ClusterIP`, `NodePort`, or `LoadBalancer`)                                                              | `ClusterIP`              |
| `service.ports`                               | Logstash service ports (evaluated as a template)                                                                                  | `[]`                     |
| `service.loadBalancerIP`                      | loadBalancerIP if service type is `LoadBalancer`                                                                                  | `""`                     |
| `service.loadBalancerSourceRanges`            | Addresses that are allowed when service is LoadBalancer                                                                           | `[]`                     |
| `service.externalTrafficPolicy`               | External traffic policy, configure to Local to preserve client source IP when using an external loadBalancer                      | `""`                     |
| `service.clusterIP`                           | Static clusterIP or None for headless services                                                                                    | `""`                     |
| `service.annotations`                         | Annotations for Logstash service                                                                                                  | `{}`                     |
| `service.sessionAffinity`                     | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                                                              | `None`                   |
| `service.sessionAffinityConfig`               | Additional settings for the sessionAffinity                                                                                       | `{}`                     |
| `service.headless.annotations`                | Annotations for the headless service.                                                                                             | `{}`                     |
| `persistence.enabled`                         | Enable Logstash data persistence using PVC                                                                                        | `false`                  |
| `persistence.existingClaim`                   | A manually managed Persistent Volume and Claim                                                                                    | `""`                     |
| `persistence.storageClass`                    | PVC Storage Class for Logstash data volume                                                                                        | `""`                     |
| `persistence.accessModes`                     | PVC Access Mode for Logstash data volume                                                                                          | `["ReadWriteOnce"]`      |
| `persistence.size`                            | PVC Storage Request for Logstash data volume                                                                                      | `2Gi`                    |
| `persistence.annotations`                     | Annotations for the PVC                                                                                                           | `{}`                     |
| `persistence.mountPath`                       | Mount path of the Logstash data volume                                                                                            | `/bitnami/logstash/data` |
| `persistence.selector`                        | Selector to match an existing Persistent Volume for WordPress data PVC                                                            | `{}`                     |
| `volumePermissions.enabled`                   | Enable init container that changes the owner and group of the persistent volume(s) mountpoint to `runAsUser:fsGroup`              | `false`                  |
| `volumePermissions.securityContext.runAsUser` | User ID for the volumePermissions init container                                                                                  | `0`                      |
| `volumePermissions.image.registry`            | Init container volume-permissions image registry                                                                                  | `docker.io`              |
| `volumePermissions.image.repository`          | Init container volume-permissions image repository                                                                                | `bitnami/bitnami-shell`  |
| `volumePermissions.image.tag`                 | Init container volume-permissions image tag (immutable tags are recommended)                                                      | `11-debian-11-r123`      |
| `volumePermissions.image.digest`              | Init container volume-permissions image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                     |
| `volumePermissions.image.pullPolicy`          | Init container volume-permissions image pull policy                                                                               | `IfNotPresent`           |
| `volumePermissions.image.pullSecrets`         | Specify docker-registry secret names as an array                                                                                  | `[]`                     |
| `volumePermissions.resources.limits`          | Init container volume-permissions resource limits                                                                                 | `{}`                     |
| `volumePermissions.resources.requests`        | Init container volume-permissions resource requests                                                                               | `{}`                     |
| `ingress.enabled`                             | Enable ingress controller resource                                                                                                | `false`                  |
| `ingress.selfSigned`                          | Create a TLS secret for this ingress record using self-signed certificates generated by Helm                                      | `false`                  |
| `ingress.pathType`                            | Ingress Path type                                                                                                                 | `ImplementationSpecific` |
| `ingress.apiVersion`                          | Override API Version (automatically detected if not set)                                                                          | `""`                     |
| `ingress.hostname`                            | Default host for the ingress resource                                                                                             | `logstash.local`         |
| `ingress.path`                                | The Path to Logstash. You may need to set this to '/*' in order to use this with ALB ingress controllers.                         | `/`                      |
| `ingress.annotations`                         | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations.  | `{}`                     |
| `ingress.tls`                                 | Enable TLS configuration for the hostname defined at ingress.hostname parameter                                                   | `false`                  |
| `ingress.extraHosts`                          | The list of additional hostnames to be covered with this ingress record.                                                          | `[]`                     |
| `ingress.extraPaths`                          | Any additional arbitrary paths that may need to be added to the ingress under the main host.                                      | `[]`                     |
| `ingress.extraRules`                          | The list of additional rules to be added to this ingress record. Evaluated as a template                                          | `[]`                     |
| `ingress.extraTls`                            | The tls configuration for additional hostnames to be covered with this ingress record.                                            | `[]`                     |
| `ingress.secrets`                             | If you're providing your own certificates, please use this to add the certificates as secrets                                     | `[]`                     |
| `ingress.ingressClassName`                    | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                     | `""`                     |
| `pdb.create`                                  | If true, create a pod disruption budget for pods.                                                                                 | `false`                  |
| `pdb.minAvailable`                            | Minimum number / percentage of pods that should remain scheduled                                                                  | `1`                      |
| `pdb.maxUnavailable`                          | Maximum number / percentage of pods that may be made unavailable                                                                  | `""`                     |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set enableMonitoringAPI=false oci://registry-1.docker.io/bitnamicharts/logstash
```

The above command disables the Logstash Monitoring API.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/logstash
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling vs Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Expose the Logstash service

The service(s) created by the deployment can be exposed within or outside the cluster using any of the following approaches:

- **Ingress**: Set `ingress.enabled=true` to expose Logstash through Ingress.
- **ClusterIP**: Set `service.type=ClusterIP` to choose this service type.
- **NodePort**: Set `service.type=NodePort` to choose this service type.
- **LoadBalancer**: Set `service.type=LoadBalancer` to choose this service type.

For more information, refer to the [chart documentation on exposing the Logstash service](https://docs.bitnami.com/kubernetes/apps/logstash/get-started/expose-service/).

### Use custom configuration

By default, this Helm chart provides a basic configuration for Logstash: listening to HTTP requests on port 8080 and writing them to the standard output.

This Logstash configuration can be adjusted using the *input*, *filter*, and *output* parameters, which allow specification of the input, filter and output plugins configuration respectively. In addition to these options, the chart also supports reading configuration from an external ConfigMap via the *existingConfiguration* parameter.

Refer to the [chart documentation for more information on customizing the Logstash deployment](https://docs.bitnami.com/kubernetes/apps/logstash/configuration/customize-deployment/).

### Create and use multiple pipelines

The chart supports the use of [multiple pipelines](https://www.elastic.co/guide/en/logstash/master/multiple-pipelines.html) by setting the *enableMultiplePipelines* parameter to *true*.

The chart supports setting an external ConfigMap with all the configuration files via the *existingConfiguration* parameter.

For more information and an example, refer to the chart documentation on [using multiple pipelines](https://docs.bitnami.com/kubernetes/apps/logstash/configuration/use-multiple-pipelines/).

### Add extra environment variables

To add extra environment variables, use the `extraEnvVars` property.

```yaml
extraEnvVars:
  - name: ELASTICSEARCH_HOST
    value: "x.y.z"
```

To add extra environment variables from an external ConfigMap or secret, use the `extraEnvVarsCM` and `extraEnvVarsSecret` properties. Note that the secret and ConfigMap should be already available in the namespace.

```yaml
extraEnvVarsSecret: logstash-secrets
extraEnvVarsCM: logstash-configmap
```

### Set Pod affinity

This chart allows you to set custom Pod affinity using the `affinity` parameter. Find more information about Pod affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, use one of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters.

## Persistence

The [Bitnami Logstash](https://github.com/bitnami/containers/tree/main/bitnami/logstash) image stores the Logstash data at the `/bitnami/logstash/data` path of the container.

Persistent Volume Claims (PVCs) are used to keep the data across deployments. This is known to work in GCE, AWS, and minikube.

See the [Parameters](#parameters) section to configure the PVC or to disable persistence.

## Troubleshooting

Find more information about how to deal with common errors related to Bitnami's Helm charts in [this troubleshooting guide](https://docs.bitnami.com/general/how-to/troubleshoot-helm-chart-issues).

## Upgrading

### To 5.0.0

This major release is no longer contains the metrics section because the container `bitnami/logstash-exporter` has been deprecated due to the upstream project is not maintained.

### To 4.0.0

This major release updates the chart to use Logstash 8. In addition, this chart has been standardized adding missing values and renaming others, in order to get aligned with the rest of the assets in the Bitnami charts repository.

The following values have been renamed:

- `securityContext` has been splitted between `containerSecurityContext` and `podSecurityContext`.
- Liveness and readiness probes httpGet field can not be modified. For customization, use customLivenessProbe and customReadinessProbe instead.
- `lifecycle` renamed as `lifecycleHooks`.
- `service.ports` is now evaluated as a template with array structure.
- Enabling `ingress.tls` no longer auto generates certificates. Use `ingress.selfSigned` to enable the creation of autogenerated certificates.
- `podDisruptionBudget.*` renamed as `pdb.*`.

### To 3.0.0

This version standardizes the way of defining Ingress rules. When configuring a single hostname for the Ingress rule, set the `ingress.hostname` value. When defining more than one, set the `ingress.extraHosts` array. Apart from this case, no issues are expected to appear when upgrading.

### To 2.0.0

This version drops support of including files in the `files/` folder, as it was working only under certain circumstances and the chart already provides alternative mechanisms like the `input` , `output` and `filter`, the `existingConfiguration` or the `extraDeploy` values.

### To 1.2.0

This version introduces `bitnami/common`, a [library chart](https://helm.sh/docs/topics/library_charts/#helm) as a dependency. More documentation about this new utility could be found [here](https://github.com/bitnami/charts/tree/main/bitnami/common#bitnami-common-library-chart). Please, make sure that you have updated the chart dependencies before executing any upgrade.

### To 1.0.0

[On November 13, 2020, Helm v2 support formally ended](https://github.com/helm/charts#status-of-the-project). Subsequently, a major version of the chart was released to incorporate the different features added in Helm v3 and to be consistent with the Helm project itself regarding the Helm v2 EOL.

[Learn more about this change and related upgrade considerations](https://docs.bitnami.com/kubernetes/apps/logstash/administration/upgrade-helm3/).

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