<!--- app-name: Whereabouts -->

# Whereabouts packaged by Bitnami

Whereabouts is a CNI plugin for Kubernetes clusters. It dynamically assigns IP addresses cluster-wide. Features both IPv4 and IPv6 addressing.

[Overview of Whereabouts](https://github.com/k8snetworkplumbingwg/whereabouts)

Trademarks: This software listing is packaged by Bitnami. The respective trademarks mentioned in the offering are owned by the respective companies, and use of them does not imply any affiliation or endorsement.

## TL;DR

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/whereabouts
```

## Introduction

This chart bootstraps a [Whereabouts](https://github.com/bitnami/containers/tree/main/bitnami/whereabouts) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

Bitnami charts can be used with [Kubeapps](https://kubeapps.com/) for deployment and management of Helm Charts in clusters.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm install my-release oci://registry-1.docker.io/bitnamicharts/whereabouts
```

The command deploys Whereabouts on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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

| Name                     | Description                                                                                                     | Value          |
| ------------------------ | --------------------------------------------------------------------------------------------------------------- | -------------- |
| `kubeVersion`            | Force target Kubernetes version (using Helm capabilities if not set)                                            | `""`           |
| `nameOverride`           | String to partially override whereabouts.fullname template (will maintain the release name)                     | `""`           |
| `fullnameOverride`       | String to fully override whereabouts.fullname template                                                          | `""`           |
| `namespaceOverride`      | String to fully override common.names.namespace                                                                 | `""`           |
| `commonAnnotations`      | Common annotations to add to all Whereabouts resources (sub-charts are not considered). Evaluated as a template | `{}`           |
| `commonLabels`           | Common labels to add to all Whereabouts resources (sub-charts are not considered). Evaluated as a template      | `{}`           |
| `extraDeploy`            | Array of extra objects to deploy with the release (evaluated as a template).                                    | `[]`           |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden)                         | `false`        |
| `diagnosticMode.command` | Command to override all containers in the deployment                                                            | `["sleep"]`    |
| `diagnosticMode.args`    | Args to override all containers in the deployment                                                               | `["infinity"]` |

### Whereabouts parameters

| Name                                    | Description                                                                                                           | Value                       |
| --------------------------------------- | --------------------------------------------------------------------------------------------------------------------- | --------------------------- |
| `image.registry`                        | Whereabouts image registry                                                                                            | `docker.io`                 |
| `image.repository`                      | Whereabouts Image name                                                                                                | `bitnami/whereabouts`       |
| `image.tag`                             | Whereabouts Image tag                                                                                                 | `0.6.1-debian-11-r25`       |
| `image.digest`                          | Whereabouts image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag           | `""`                        |
| `image.pullPolicy`                      | Whereabouts image pull policy                                                                                         | `IfNotPresent`              |
| `image.pullSecrets`                     | Specify docker-registry secret names as an array                                                                      | `[]`                        |
| `image.debug`                           | Specify if debug logs should be enabled                                                                               | `false`                     |
| `hostCNIBinDir`                         | CNI binary dir in the host machine to mount                                                                           | `/opt/cni/bin`              |
| `hostCNINetDir`                         | CNI net.d dir in the host machine to mount                                                                            | `/etc/cni/net.d`            |
| `CNIMountPath`                          | Path inside the container to mount the CNI dirs                                                                       | `/bitnami/whereabouts/host` |
| `command`                               | Override default container command (useful when using custom images)                                                  | `[]`                        |
| `args`                                  | Override default container args (useful when using custom images)                                                     | `[]`                        |
| `updateStrategy.type`                   | Update strategy - only really applicable for deployments with RWO PVs attached                                        | `RollingUpdate`             |
| `priorityClassName`                     | Whereabouts pods' priorityClassName                                                                                   | `""`                        |
| `schedulerName`                         | Name of the k8s scheduler (other than default)                                                                        | `""`                        |
| `topologySpreadConstraints`             | Topology Spread Constraints for pod assignment                                                                        | `[]`                        |
| `hostAliases`                           | Add deployment host aliases                                                                                           | `[]`                        |
| `extraEnvVars`                          | Extra environment variables                                                                                           | `[]`                        |
| `extraEnvVarsCM`                        | ConfigMap containing extra env vars                                                                                   | `""`                        |
| `extraEnvVarsSecret`                    | Secret containing extra env vars (in case of sensitive data)                                                          | `""`                        |
| `extraVolumes`                          | Array of extra volumes to be added to the deployment (evaluated as template). Requires setting `extraVolumeMounts`    | `[]`                        |
| `extraVolumeMounts`                     | Array of extra volume mounts to be added to the container (evaluated as template). Normally used with `extraVolumes`. | `[]`                        |
| `initContainers`                        | Add additional init containers to the pod (evaluated as a template)                                                   | `[]`                        |
| `sidecars`                              | Attach additional containers to the pod (evaluated as a template)                                                     | `[]`                        |
| `tolerations`                           | Tolerations for pod assignment                                                                                        | `[]`                        |
| `podAffinityPreset`                     | Pod affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                   | `""`                        |
| `podAntiAffinityPreset`                 | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                              | `soft`                      |
| `nodeAffinityPreset.type`               | Node affinity preset type. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                             | `""`                        |
| `nodeAffinityPreset.key`                | Node label key to match Ignored if `affinity` is set.                                                                 | `""`                        |
| `nodeAffinityPreset.values`             | Node label values to match. Ignored if `affinity` is set.                                                             | `[]`                        |
| `affinity`                              | Affinity for pod assignment                                                                                           | `{}`                        |
| `nodeSelector`                          | Node labels for pod assignment. Evaluated as a template.                                                              | `{}`                        |
| `resources.requests`                    | The requested resources for the init container                                                                        | `{}`                        |
| `resources.limits`                      | The resources limits for the init container                                                                           | `{}`                        |
| `podSecurityContext.enabled`            | Enable Whereabouts pods' Security Context                                                                             | `true`                      |
| `podSecurityContext.fsGroup`            | Whereabouts pods' group ID                                                                                            | `0`                         |
| `containerSecurityContext.enabled`      | Enable Whereabouts containers' Security Context                                                                       | `true`                      |
| `containerSecurityContext.runAsUser`    | Whereabouts containers' Security Context                                                                              | `0`                         |
| `containerSecurityContext.runAsNonRoot` | Set Whereabouts container's Security Context runAsNonRoot                                                             | `false`                     |
| `containerSecurityContext.privileged`   | Set Whereabouts container's Security Context privileged                                                               | `true`                      |
| `startupProbe.enabled`                  | Enable startupProbe                                                                                                   | `false`                     |
| `startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                                | `10`                        |
| `startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                                       | `10`                        |
| `startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                                      | `5`                         |
| `startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                                    | `5`                         |
| `startupProbe.successThreshold`         | Success threshold for startupProbe                                                                                    | `1`                         |
| `livenessProbe.enabled`                 | Enable livenessProbe                                                                                                  | `true`                      |
| `livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                               | `10`                        |
| `livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                                      | `10`                        |
| `livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                                     | `5`                         |
| `livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                                   | `5`                         |
| `livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                                   | `1`                         |
| `readinessProbe.enabled`                | Enable readinessProbe                                                                                                 | `false`                     |
| `readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                              | `10`                        |
| `readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                                     | `5`                         |
| `readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                                    | `1`                         |
| `readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                                  | `5`                         |
| `readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                                  | `1`                         |
| `customStartupProbe`                    | Override default startup probe                                                                                        | `{}`                        |
| `customLivenessProbe`                   | Override default liveness probe                                                                                       | `{}`                        |
| `customReadinessProbe`                  | Override default readiness probe                                                                                      | `{}`                        |
| `lifecycleHooks`                        | LifecycleHook to set additional configuration at startup Evaluated as a template                                      | `{}`                        |
| `podAnnotations`                        | Pod annotations                                                                                                       | `{}`                        |
| `podLabels`                             | Add additional labels to the pod (evaluated as a template)                                                            | `{}`                        |

### Other Parameters

| Name                                          | Description                                                            | Value  |
| --------------------------------------------- | ---------------------------------------------------------------------- | ------ |
| `rbac.create`                                 | Specifies whether RBAC resources should be created                     | `true` |
| `serviceAccount.create`                       | Enable creation of ServiceAccount for Whereabouts pod                  | `true` |
| `serviceAccount.name`                         | The name of the ServiceAccount to use.                                 | `""`   |
| `serviceAccount.automountServiceAccountToken` | Allows auto mount of ServiceAccountToken on the serviceAccount created | `true` |
| `serviceAccount.annotations`                  | Additional custom annotations for the ServiceAccount                   | `{}`   |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
helm install my-release \
  --set schedulerName=high-priority \
    oci://registry-1.docker.io/bitnamicharts/whereabouts
```

The above command sets the Whereabouts scheduler to high-priority.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
helm install my-release -f values.yaml oci://registry-1.docker.io/bitnamicharts/whereabouts
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Configuration and installation details

### [Rolling VS Immutable tags](https://docs.bitnami.com/containers/how-to/understand-rolling-tags-containers/)

It is strongly recommended to use immutable tags in a production environment. This ensures your deployment does not change automatically if the same tag is updated with a different image.

Bitnami will release a new chart updating its containers if a new version of the main container, significant changes, or critical vulnerabilities exist.

### Host configuration

Once installed, the helm chart will modify configuration files in the host nodes of the Kubernetes cluster. Ensure that the cluster allows root and privileged deployments.

Once the whereabouts configuration is installed, check the [upstream Kubernetes documentation](upstream documentation) on how to modify the network settings of the cluster.

> **Important**: Double check that the host CNI binary and configuration directories are properly configured, or the deployment will fail. This is done using the `hostCNINetDir` and `hostCNIBinDir` values.

### Image

The `image` parameter allows specifying which image will be pulled for the chart.

#### Private registry

If you configure the `image` value to one in a private registry, you will need to [specify an image pull secret](https://kubernetes.io/docs/concepts/containers/images/#specifying-imagepullsecrets-on-a-pod).

1. Manually create image pull secret(s) in the namespace. See [this YAML example reference](https://kubernetes.io/docs/concepts/containers/images/#creating-a-secret-with-a-docker-config). Consult your image registry's documentation about getting the appropriate secret.
2. Note that the `imagePullSecrets` configuration value cannot currently be passed to helm using the `--set` parameter, so you must supply these using a `values.yaml` file, such as:

    ```yaml
    imagePullSecrets:
      - name: SECRET_NAME
    ```

3. Install the chart

### Setting Pod's affinity

This chart allows you to set your custom affinity using the `affinity` parameter. Find more information about Pod's affinity in the [kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity).

As an alternative, you can use of the preset configurations for pod affinity, pod anti-affinity, and node affinity available at the [bitnami/common](https://github.com/bitnami/charts/tree/main/bitnami/common#affinities) chart. To do so, set the `podAffinityPreset`, `podAntiAffinityPreset`, or `nodeAffinityPreset` parameters.

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